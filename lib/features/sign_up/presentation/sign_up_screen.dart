import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/small_text_field.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';

import '../../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = true;
///TODO make all controllers private
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController =
      TextEditingController();
  final TextEditingController nameSignUpController = TextEditingController();
  final TextEditingController confirmPasswordSignUpController =
      TextEditingController();

  @override
  void dispose() {
    emailSignUpController.dispose();
    passwordSignUpController.dispose();
    nameSignUpController.dispose();
    confirmPasswordSignUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///TODO make only one variable
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            ///TODO Remove global navigator variable [@kNavigatorKey]
            kNavigatorKey.currentState?.pushReplacement(
              MaterialPageRoute(
                  builder: (_) =>
                      MainScreen(user: FirebaseAuth.instance.currentUser!)),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          ///TODO Use switch case for manage bloc state
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              Image.asset(
                'assets/main_bakery.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                height: screenHeight / 3,
              ),
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: CustomColors.whiteColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(44)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            )
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const Center(
                                  child: CustomTitle(
                                    text: 'Sign Up',
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Email',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(
                                    controller: emailSignUpController),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Name',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(
                                    controller: nameSignUpController),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Password',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(
                                    controller: passwordSignUpController),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Confirm Password',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(
                                    controller:
                                        confirmPasswordSignUpController),
                                const SizedBox(height: 34),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: NextButton(
                                      onPressed: () {
                                        ///TODO add validation
                                        context.read<AuthBloc>().add(
                                              RegisterEvent(
                                                emailSignUpController.text,
                                                passwordSignUpController.text,
                                              ),
                                            );
                                      },
                                      text: 'Create Account',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

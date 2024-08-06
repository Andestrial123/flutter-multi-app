import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/features/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/auth_text_field.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/small_text_field.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool? isChecked = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;

    const divider = Divider(
      color: CustomColors.brownLight,
    );

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 32),
                                  child: Center(
                                    child: CustomTitle(
                                      text: 'Login',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Email',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 8),
                                SmallTextField(controller: emailController),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Password',
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 8),
                                SmallTextField(controller: passwordController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const MultiAppTypography(
                                        TypographyType.middleText, 'New User?'),
                                    const SizedBox(width: 2),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SignUpScreen()));
                                      },
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                      child: const MultiAppTypography(
                                        TypographyType.middleTextBold,
                                        'Create Account',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 34),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 64),
                                    child: NextButton(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(LoginEvent(
                                          emailController.text,
                                          passwordController.text,
                                        ));
                                      },
                                      text: 'Next',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: divider,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: MultiAppTypography(
                                          TypographyType.middleText, 'or'),
                                    ),
                                    Expanded(
                                      child: divider,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Column(
                                  children: [
                                    Center(
                                      child: AuthTextField(
                                        onPressed: () {
                                          context
                                              .read<AuthBloc>()
                                              .add(GoogleEvent());
                                        },
                                        text: 'Login with Google',
                                        image: SvgPicture.asset(
                                          'assets/google.svg',
                                          height: 24.0,
                                          width: 24.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                        child: AuthTextField(
                                          onPressed: () {
                                            context
                                                .read<AuthBloc>()
                                                .add(FacebookEvent());
                                          },
                                          text: "Login with Facebook",
                                          image: SvgPicture.asset(
                                            'assets/facebook.svg',
                                            height: 24.0,
                                            width: 24.0,
                                          ),
                                        )),
                                  ],
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

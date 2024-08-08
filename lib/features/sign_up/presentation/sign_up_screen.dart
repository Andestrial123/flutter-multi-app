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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailSignUpController = TextEditingController();
  final TextEditingController _passwordSignUpController = TextEditingController();
  final TextEditingController _nameSignUpController = TextEditingController();
  final TextEditingController _confirmPasswordSignUpController = TextEditingController();

  @override
  void dispose() {
    _emailSignUpController.dispose();
    _passwordSignUpController.dispose();
    _nameSignUpController.dispose();
    _confirmPasswordSignUpController.dispose();
    super.dispose();
  }

  void _validateAndSignUp() {
    final email = _emailSignUpController.text;
    final password = _passwordSignUpController.text;
    final confirmPassword = _confirmPasswordSignUpController.text;
    final name = _nameSignUpController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    context.read<AuthBloc>().add(
      RegisterEvent(email, password, name),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (AuthLoadedState):
              final user = FirebaseAuth.instance.currentUser!;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => MainScreen(
                    user: user,
                    name: user.displayName,
                  ),
                ),
              );
              break;
            case const (AuthErrorState):
              final errorState = state as AuthErrorState;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorState.error)),
              );
              break;
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (AuthLoadingState):
              return const Center(child: CircularProgressIndicator());
            default:
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
                              borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
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
                                    SmallTextField(controller: _emailSignUpController),
                                    const SizedBox(height: 16),
                                    const MultiAppTypography(
                                      TypographyType.bigText,
                                      'Name',
                                      color: CustomColors.brownLight,
                                    ),
                                    const SizedBox(height: 4),
                                    SmallTextField(controller: _nameSignUpController),
                                    const SizedBox(height: 16),
                                    const MultiAppTypography(
                                      TypographyType.bigText,
                                      'Password',
                                      color: CustomColors.brownLight,
                                    ),
                                    const SizedBox(height: 4),
                                    SmallTextField(controller: _passwordSignUpController),
                                    const SizedBox(height: 16),
                                    const MultiAppTypography(
                                      TypographyType.bigText,
                                      'Confirm Password',
                                      color: CustomColors.brownLight,
                                    ),
                                    const SizedBox(height: 4),
                                    SmallTextField(controller: _confirmPasswordSignUpController),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const MultiAppTypography(
                                            TypographyType.middleText, 'You have an account?'),
                                        TextButton(
                                          onPressed: () {
                                            context.read<AuthBloc>().add(ShowAuthScreenEvent());
                                          },
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          child: const MultiAppTypography(
                                            TypographyType.middleTextBold,
                                            'Sign In',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 34),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 32),
                                        child: NextButton(
                                          onPressed: _validateAndSignUp,
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
          }
        },
      ),
    );
  }
}
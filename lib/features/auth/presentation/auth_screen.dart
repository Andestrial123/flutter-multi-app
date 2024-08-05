import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/create_account/presentation/create_account_screen.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:sign_in_button/sign_in_button.dart';

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

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 250),
                  const Center(
                    child: MultiAppTypography(
                      TypographyType.headline1,
                      'Login',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const MultiAppTypography(
                    TypographyType.bigText,
                    'Email',
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 45,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(32),
                      child: TextField(
                        cursorHeight: 18,
                        controller: emailController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 8, left: 16, right: 16, bottom: 16),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const MultiAppTypography(TypographyType.bigText, 'Password'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 45,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(32),
                      child: TextField(
                        cursorHeight: 18,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 8, left: 16, right: 16, bottom: 16),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                              MaterialPageRoute(builder: (context) => const CreateAccountScreen()));
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const MultiAppTypography(
                          TypographyType.middleTextBold,
                          'Create account',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CheckboxTheme(
                          data: CheckboxThemeData(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Checkbox(
                            activeColor: Colors.brown,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.brown),
                            ),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                        )
                      ),
                      const SizedBox(width: 2),
                      const MultiAppTypography(
                          TypographyType.middleText, 'Remember me'),
                    ],
                  ),
                  const SizedBox(height: 34),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LoginEvent(
                            emailController.text,
                            passwordController.text,
                          ));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          elevation: MaterialStateProperty.all(4),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: const MultiAppTypography(
                          TypographyType.bigText,
                          'Next',
                          color: Colors.white,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                            MultiAppTypography(TypographyType.middleText, 'or'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: SignInButton(Buttons.google,
                              text: "Login with Google",
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.brown, width: 2.0),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(12), onPressed: () {
                            context.read<AuthBloc>().add(GoogleEvent());
                          }),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: SignInButtonBuilder(
                            icon: Icons.facebook,
                            text: "Login with Facebook",
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.brown, width: 2.0),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            textColor: Colors.black,
                            iconColor: Colors.blue,
                            padding: const EdgeInsets.all(12),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

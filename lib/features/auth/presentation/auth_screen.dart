import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/create_account/presentation/create_account_screen.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;

    const brownLight = Color.fromRGBO(181, 117, 117, 1);
    const brownDark = Color.fromRGBO(106, 52, 47, 1);

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
                          color: Color.fromRGBO(238, 228, 219, 1),
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
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: 'CustomFont',
                                        fontSize: 28,
                                        color: brownDark,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0.3, 0.9),
                                            blurRadius: 3.0,
                                            color: Color.fromARGB(128, 0, 0, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Email',
                                  color: brownLight,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 35,
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(32),
                                    child: TextField(
                                      cursorHeight: 18,
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 8,
                                            left: 16,
                                            right: 16,
                                            bottom: 8),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(238, 228, 219, 1),
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                          borderSide: BorderSide(
                                            width: 10,
                                            color: brownLight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const MultiAppTypography(
                                  TypographyType.bigText,
                                  'Password',
                                  color: brownLight,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 35,
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(32),
                                    child: TextField(
                                      cursorHeight: 18,
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 8,
                                            left: 16,
                                            right: 16,
                                            bottom: 16),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(238, 228, 219, 1),
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                                                    const CreateAccountScreen()));
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
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          brownDark,
                                        ),
                                        elevation: MaterialStateProperty.all(4),
                                      ),
                                      child: const Text(
                                        'Next',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: brownLight,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: MultiAppTypography(
                                          TypographyType.middleText, 'or'),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: brownLight
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 60,
                                        width: double.infinity,
                                        child: SignInButtonBuilder(
                                          text: "Login with Google",
                                          image: SvgPicture.asset(
                                            'assets/google.svg',
                                            height: 24.0,
                                            width: 24.0,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<AuthBloc>()
                                                .add(GoogleEvent());
                                          },
                                          backgroundColor: const Color.fromRGBO(
                                              238, 228, 219, 1),
                                          textColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.brown,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          padding: const EdgeInsets.all(12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                      child: SizedBox(
                                        height: 60,
                                        width: double.infinity,
                                        child: SignInButtonBuilder(
                                          image: SvgPicture.asset(
                                            'assets/facebook.svg',
                                            height: 24.0,
                                            width: 24.0,
                                          ),
                                          text: "Login with Facebook",
                                          backgroundColor: const Color.fromRGBO(
                                              238, 228, 219, 1),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.brown,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          textColor: Colors.black,
                                          iconColor: Colors.blue,
                                          padding: const EdgeInsets.all(12),
                                          onPressed: () {
                                            context
                                                .read<AuthBloc>()
                                                .add(FacebookEvent());
                                          },
                                        ),
                                      ),
                                    ),
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

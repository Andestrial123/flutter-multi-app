import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/features/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/custom_widgets/custom_widgets.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/auth_text_field.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/small_text_field.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/debouncer.dart';
import 'package:flutter_multi_app/utils/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 2000);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (AuthLoadedState):
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => MainScreen(user: FirebaseAuth.instance.currentUser!),
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
            case const (SignUpScreenState):
              return const SignUpScreen();
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
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 64),
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
                                    SmallTextField(controller: _emailController),
                                    const SizedBox(height: 16),
                                    const MultiAppTypography(
                                      TypographyType.bigText,
                                      'Password',
                                      color: CustomColors.brownLight,
                                    ),
                                    const SizedBox(height: 8),
                                    SmallTextField(controller: _passwordController),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const MultiAppTypography(
                                          TypographyType.middleText,
                                          'New User?',
                                        ),
                                        const SizedBox(width: 2),
                                        TextButton(
                                          onPressed: () {
                                            context.read<AuthBloc>().add(ShowSignUpScreenEvent());
                                          },
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
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
                                            _debouncer.run(() {
                                              if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Please fill out all fields'),
                                                  ),
                                                );
                                                return;
                                              }
                                              context.read<AuthBloc>().add(LoginEvent(
                                                _emailController.text,
                                                _passwordController.text,
                                              ));
                                            });
                                          },
                                          text: 'Next',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: CustomWidgets.divider,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          child: MultiAppTypography(
                                            TypographyType.middleText,
                                            'or',
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomWidgets.divider,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                    Column(
                                      children: [
                                        Center(
                                          child: AuthTextField(
                                            onPressed: () {
                                              context.read<AuthBloc>().add(GoogleEvent());
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
                                              context.read<AuthBloc>().add(FacebookEvent());
                                            },
                                            text: "Login with Facebook",
                                            image: SvgPicture.asset(
                                              'assets/facebook.svg',
                                              height: 24.0,
                                              width: 24.0,
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
          }
        },
      ),
    );
  }
}
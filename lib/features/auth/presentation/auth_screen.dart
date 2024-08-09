import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/features/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/auth_text_field.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/small_text_field.dart';
import 'package:flutter_multi_app/shared/widgets/widgets.dart';
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
  final Debouncer _debouncer = Debouncer(milliseconds: 3000);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => MainScreen(user: FirebaseAuth.instance.currentUser!),
              ),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoadingState;
          final isLoadingGoogle = state is GoogleLoadingState;
          final isLoadingFacebook = state is FacebookLoadingState;

          if (state is SignUpScreenState) {
            return const SignUpScreen();
          } else {
            return Stack(
              children: [
                Image.asset(
                  Assets.mainBakery,
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 32),
                                    child: Center(
                                      child: CustomTitle(
                                        text: LocaleKeys.login.tr(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  MultiAppTypography(
                                    TypographyType.bigText,
                                    LocaleKeys.email.tr(),
                                    color: CustomColors.brownLight,
                                  ),
                                  const SizedBox(height: 8),
                                  SmallTextField(controller: _emailController),
                                  const SizedBox(height: 16),
                                  MultiAppTypography(
                                    TypographyType.bigText,
                                    LocaleKeys.password.tr(),
                                    color: CustomColors.brownLight,
                                  ),
                                  const SizedBox(height: 8),
                                  SmallTextField(controller: _passwordController),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MultiAppTypography(
                                        TypographyType.middleText,
                                        LocaleKeys.newUser.tr(),
                                      ),
                                      const SizedBox(width: 2),
                                      TextButton(
                                        onPressed: () {
                                          context.read<AuthBloc>().add(ShowSignUpScreenEvent());
                                        },
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        child: MultiAppTypography(
                                          TypographyType.middleTextBold,
                                          LocaleKeys.createAccount.tr(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 34),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 64),
                                      child: NextButton(
                                        onPressed: isLoading
                                            ? null
                                            : () {
                                          _debouncer.call(() {
                                            if (_emailController.text.isEmpty ||
                                                _passwordController.text.isEmpty) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(LocaleKeys.fillOutAllFields.tr()),
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
                                        text: isLoading ? '' : LocaleKeys.next.tr(),
                                        isLoading: isLoading,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const Expanded(child: divider),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: MultiAppTypography(
                                          TypographyType.middleText,
                                          LocaleKeys.or.tr(),
                                        ),
                                      ),
                                      const Expanded(child: divider),
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
                                          text: LocaleKeys.logInGoogle.tr(),
                                          image: SvgPicture.asset(
                                            Assets.google,
                                            height: 24.0,
                                            width: 24.0,
                                          ),
                                          isLoading: isLoadingGoogle,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Center(
                                        child: AuthTextField(
                                          onPressed: () {
                                            context.read<AuthBloc>().add(FacebookEvent());
                                          },
                                          text: LocaleKeys.logInFacebook.tr(),
                                          image: SvgPicture.asset(
                                            Assets.facebook,
                                            height: 24.0,
                                            width: 24.0,
                                          ),
                                          isLoading: isLoadingFacebook,
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
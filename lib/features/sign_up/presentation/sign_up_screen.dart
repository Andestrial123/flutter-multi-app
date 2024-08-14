import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/sign_up/domain/sign_up_bloc.dart';
import 'package:flutter_multi_app/shared/assets/assets.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/text/custom_title.dart';
import 'package:flutter_multi_app/shared/widgets/text_fields/small_text_field.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_multi_app/utils/typography.dart';

import '../../../shared/assets/routes.dart';

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
  bool _isButtonDisabled = false;

  @override
  void dispose() {
    _emailSignUpController.dispose();
    _passwordSignUpController.dispose();
    _nameSignUpController.dispose();
    _confirmPasswordSignUpController.dispose();
    super.dispose();
  }

  void _validateAndSignUp() {
    setState(() {
      _isButtonDisabled = true;
    });

    final email = _emailSignUpController.text;
    final password = _passwordSignUpController.text;
    final confirmPassword = _confirmPasswordSignUpController.text;
    final name = _nameSignUpController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.fillInAllFields.tr())),
      );
      _reactivateButton();
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.passwordNotMatch.tr())),
      );
      _reactivateButton();
      return;
    }

    context.read<SignUpBloc>().add(
      RegisterEvent(email, password, name),
    );
  }

  void _reactivateButton() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isButtonDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoadedState) {
            context.router.replaceNamed(
              Routes.main
            );
          } else if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
            _reactivateButton();
          }
        },
        builder: (context, state) {
          final isLoading = state is SignUpLoadingState;
          final isButtonDisabled = _isButtonDisabled || isLoading;

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
                          )
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
                                      text: LocaleKeys.signUp.tr(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                MultiAppTypography(
                                  TypographyType.bigText,
                                  LocaleKeys.email.tr(),
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(controller: _emailSignUpController),
                                const SizedBox(height: 16),
                                MultiAppTypography(
                                  TypographyType.bigText,
                                  LocaleKeys.name.tr(),
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(controller: _nameSignUpController),
                                const SizedBox(height: 16),
                                MultiAppTypography(
                                  TypographyType.bigText,
                                  LocaleKeys.password.tr(),
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(controller: _passwordSignUpController),
                                const SizedBox(height: 16),
                                MultiAppTypography(
                                  TypographyType.bigText,
                                  LocaleKeys.confirmPassword.tr(),
                                  color: CustomColors.brownLight,
                                ),
                                const SizedBox(height: 4),
                                SmallTextField(controller: _confirmPasswordSignUpController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MultiAppTypography(
                                      TypographyType.middleText,
                                      LocaleKeys.haveAccount.tr(),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(ShowAuthScreenEvent());
                                      },
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      child: MultiAppTypography(
                                        TypographyType.middleTextBold,
                                        LocaleKeys.signIn.tr(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 34),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32),
                                    child: NextButton(
                                      onPressed: isButtonDisabled ? null : _validateAndSignUp,
                                      text: isLoading
                                          ? ''
                                          : LocaleKeys.createAccount.tr(),
                                      isLoading: isLoading,
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
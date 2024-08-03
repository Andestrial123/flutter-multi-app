import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/typography.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
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
              const SizedBox(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const MultiAppTypography(TypographyType.bigText, 'Password'),
              const SizedBox(height: 8),
              const SizedBox(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MultiAppTypography(
                      TypographyType.middleText, 'New user?'),
                  const SizedBox(width: 2),
                  TextButton(
                      onPressed: () {},
                      child: const MultiAppTypography(
                        TypographyType.middleTextBold,
                        'Create account',
                      ))
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    tristate: true,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  const MultiAppTypography(
                      TypographyType.middleText, 'Remember me'),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                    ),
                    child: const MultiAppTypography(
                      TypographyType.bigText,
                      'Next',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: MultiAppTypography(TypographyType.middleText, 'or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('google'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('facebook'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

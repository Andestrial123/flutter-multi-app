import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/firebase_service.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User name: ${user.displayName ?? 'No name'}'),
            Text('User email: ${user.email ?? 'No email'}'),
            StreamBuilder<User?>(
              stream: FirebaseService().auth.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return const Text('User not found');
                }
                final currentUser = snapshot.data!;

                currentUser.reload().then((_) {
                  if (currentUser.emailVerified) {
                    (context as Element).markNeedsBuild();
                  }
                });
                return const SizedBox.shrink();
              },
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(LogoutEvent());
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
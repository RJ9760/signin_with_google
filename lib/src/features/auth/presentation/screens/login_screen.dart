import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/features/auth/presentation/widgets/continue_with_google.dart';
import 'package:todo/src/features/homescreen/homescreen.dart';

class Loginscreen extends ConsumerWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                'Welcome back.',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Login to manage your daily target',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacer(flex: 1),
              //calling the email and password textfield widget
              // const Textfield(),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     const Expanded(
              //       child: Divider(
              //         thickness: 1,
              //         color:
              //             Colors.grey, // Or use your subtitle color from theme
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //       child: Text(
              //         'OR',
              //         style: Theme.of(context).textTheme.bodyMedium,
              //       ),
              //     ),
              //     const Expanded(
              //       child: Divider(thickness: 1, color: Colors.grey),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
             GoogleSignInButton(onPressed: (){}),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
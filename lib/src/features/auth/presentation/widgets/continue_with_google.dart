import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final bool isLoading;
  // final bool isLoading;
  //this.loading = false tells that if it is not pressed or nothing inside onpressed it will be assume as null
  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isLoading
          ? null
          : onPressed, //if losding disable button if not allow button to click
      icon: const Icon(Icons.g_mobiledata, size: 28, color: Colors.white),
      label: Text(
        isLoading ? 'Signing in...' : 'Continue with Google',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFF1A202C),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

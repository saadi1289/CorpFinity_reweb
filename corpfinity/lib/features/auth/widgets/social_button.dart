import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final SocialProvider provider;
  final bool isLoading;

  const SocialButton({
    super.key,
    required this.text,
    required this.provider,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getTextColor(),
          side: BorderSide(color: Colors.grey[300]!),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5FCCC4)),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getIcon(),
                  const SizedBox(width: 12),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _getTextColor(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (provider) {
      case SocialProvider.google:
        return Colors.white;
      case SocialProvider.facebook:
        return const Color(0xFFF7F7F7);
      case SocialProvider.apple:
        return Colors.black;
    }
  }

  Color _getTextColor() {
    switch (provider) {
      case SocialProvider.google:
      case SocialProvider.facebook:
        return const Color(0xFF1A1A1A);
      case SocialProvider.apple:
        return Colors.white;
    }
  }

  Widget _getIcon() {
    switch (provider) {
      case SocialProvider.google:
        return SvgPicture.asset(
          'assets/logos/google.svg',
          width: 20,
          height: 20,
        );
      case SocialProvider.facebook:
        return SvgPicture.asset(
          'assets/logos/facebook.svg',
          width: 20,
          height: 20,
        );
      case SocialProvider.apple:
        return const Icon(
          Icons.apple,
          color: Colors.white,
          size: 20,
        );
    }
  }
}

enum SocialProvider {
  google,
  facebook,
  apple,
}
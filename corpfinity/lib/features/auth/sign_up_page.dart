import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_in_page.dart';
import 'widgets/auth_button.dart';
import 'widgets/social_button.dart';
import 'widgets/auth_form_field.dart';
import 'auth_service.dart';
import '../../main_app.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _pageController = PageController();
  int _index = 0;
  bool _showEmailForm = false;

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  static const _slideCount = 3;
  Timer? _timer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      final next = (_index + 1) % _slideCount;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
    _username.addListener(_onFormChanged);
    _email.addListener(_onFormChanged);
    _password.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            final maxWidth = isWide ? 480.0 : constraints.maxWidth;
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: isWide ? 320 : 280,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (i) => setState(() => _index = i),
                          children: const [
                            _Slide(
                              title: 'Focus in 5 minutes',
                              subtitle:
                                  'Boost your productivity and efficiency',
                              asset:
                                  'assets/illustrations/undraw_dev-productivity_5wps.svg',
                            ),
                            _Slide(
                              title: 'Healthy options',
                              subtitle: 'Make better choices every day',
                              asset:
                                  'assets/illustrations/undraw_eating-pasta_96tb.svg',
                            ),
                            _Slide(
                              title: 'Worry Free Work',
                              subtitle: 'Make your Worries go away',
                              asset:
                                  'assets/illustrations/undraw_nature-benefits_ak6e.svg',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _Indicator(
                        index: _index,
                        count: _slideCount,
                        color: const Color(0xFF5FCCC4),
                        onTap: (i) {
                          _pageController.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      SocialButton(
                        text: 'Sign up with Google',
                        provider: SocialProvider.google,
                        onPressed: _handleGoogleSignUp,
                      ),
                      const SizedBox(height: 16),
                      AuthButton(
                        text: 'Sign up with Email',
                        icon: const Icon(Icons.mail_outline, size: 20),
                        isLoading: _isLoading,
                        onPressed: () => setState(() => _showEmailForm = true),
                      ),
                      const SizedBox(height: 16),
                      SocialButton(
                        text: 'Sign up with Facebook',
                        provider: SocialProvider.facebook,
                        onPressed: _handleFacebookSignUp,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignInPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF5FCCC4),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: !_showEmailForm
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Form(
                                  key: _formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      AuthFormField(
                                        controller: _username,
                                        hintText: 'Username',
                                        textInputAction: TextInputAction.next,
                                        validator: (v) {
                                          if (v == null ||
                                              v.trim().length < 2) {
                                            return 'Enter a valid username';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      AuthFormField(
                                        controller: _email,
                                        hintText: 'Email',
                                        keyboardType: TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        validator: (v) {
                                          final email = v ?? '';
                                          final ok = RegExp(
                                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                          ).hasMatch(email);
                                          if (!ok) {
                                            return 'Enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      _PasswordField(
                                        controller: _password,
                                      ),
                                      const SizedBox(height: 24),
                                      AuthButton(
                                        text: 'Create Account',
                                        isLoading: _isLoading,
                                        onPressed: _canSubmit ? _handleCreateAccount : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool get _canSubmit {
    final nameOk = _username.text.trim().length >= 2;
    final emailOk = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(_email.text.trim());
    final pass = _password.text;
    final passOk =
        pass.length >= 8 &&
        RegExp(r'[A-Za-z]').hasMatch(pass) &&
        RegExp(r'\d').hasMatch(pass);
    return nameOk && emailOk && passOk;
  }

  void _onFormChanged() {
    if (_showEmailForm) {
      setState(() {});
    }
  }

  void _handleGoogleSignUp() async {
    setState(() => _isLoading = true);
    
    final result = await AuthService().signInWithGoogle();
    
    setState(() => _isLoading = false);
    
    if (mounted) {
      if (result.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signed up with Google! 🎉'),
            backgroundColor: Color(0xFF5FCCC4),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error ?? 'Google sign up failed'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _handleFacebookSignUp() async {
    setState(() => _isLoading = true);
    
    final result = await AuthService().signInWithFacebook();
    
    setState(() => _isLoading = false);
    
    if (mounted) {
      if (result.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signed up with Facebook! 🎉'),
            backgroundColor: Color(0xFF5FCCC4),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error ?? 'Facebook sign up failed'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _handleCreateAccount() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      
      final result = await AuthService().signUp(
        _username.text,
        _email.text,
        _password.text,
      );
      
      setState(() => _isLoading = false);
      
      if (mounted) {
        if (result.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully! 🎉'),
              backgroundColor: Color(0xFF5FCCC4),
              behavior: SnackBarBehavior.floating,
            ),
          );
          // Navigate to main app
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainApp()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.error ?? 'Account creation failed'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String asset;
  const _Slide({
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: isWide ? 220 : 180,
          child: Semantics(
            label: title,
            image: true,
            child: SvgPicture.asset(asset, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final int index;
  final int count;
  final Color color;
  final ValueChanged<int>? onTap;
  const _Indicator({
    required this.index,
    required this.count,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == index;
        return GestureDetector(
          onTap: onTap == null ? null : () => onTap!(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: active ? 20 : 8,
            decoration: BoxDecoration(
              color: active ? color : Colors.black26,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}

class _PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const _PasswordField({required this.controller});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return AuthFormField(
      controller: widget.controller,
      hintText: 'Password',
      obscureText: _obscured,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscured = !_obscured),
        icon: Icon(
          _obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: Colors.grey[600],
        ),
      ),
      validator: (v) {
        final p = v ?? '';
        final strong =
            p.length >= 8 &&
            RegExp(r'[A-Za-z]').hasMatch(p) &&
            RegExp(r'\d').hasMatch(p);
        if (!strong) return 'Min 8 chars with letters and numbers';
        return null;
      },
    );
  }
}

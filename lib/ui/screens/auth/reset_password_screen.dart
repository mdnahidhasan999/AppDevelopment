import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp/ui/screens/auth/sign_in_screen.dart';
import 'package:practiceapp/ui/widgets/background_widget.dart';

import '../../../data/models/network_response.dart';
import '../../../data/network_caller/network_caller.dart';
import '../../../data/utilities/urls.dart';
import '../../utility/app_colors.dart';
import '../../widgets/snack_bar_messages.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen(
      {super.key, required this.email, required this.otp});

  final String email, otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _resetPasswordOnProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Minimum length of password should be more than 6 letters, and combination of number and letters",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration:
                        const InputDecoration(hintText: 'Confirm Password'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: _resetPasswordOnProgress == false,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        _onTapConfirmButton();
                      },
                      child: const Text('Confirm'),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4),
                          text: "Have account? ",
                          children: [
                            TextSpan(
                                text: 'Sign In',
                                style: TextStyle(color: AppColors.themeColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _onTapSignInButton();
                                  }),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
            (route) => false);
  }

  void _onTapConfirmButton() {
    _resetPassword(_passwordTEController.text);
  }

  Future<void> _resetPassword(String password) async {
    _resetPasswordOnProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> inputParms = {
      "email": widget.email,
      "OTP": widget.otp,
      "password": password,
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.resetPassword, body: inputParms,
    );
    _resetPasswordOnProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Reset Password! Try again Now');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
                (route) => false);
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Reset Password failed! Try again');
      }
    }
  }

  @override
  void dispose() {
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}

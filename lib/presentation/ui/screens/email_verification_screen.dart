import 'package:craftybay/data/utils/snack_message.dart';
import 'package:craftybay/presentation/state_holders/email_verification_controller.dart';
import 'package:craftybay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:craftybay/presentation/ui/widgets/centered_circular_prograss_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(),
                const SizedBox(height: 20),
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(
                  "Please enter your email address",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black54,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                GetBuilder<EmailVerificationController>(
                  builder: (emailVerificationController) {
                    return Visibility(
                      visible: !emailVerificationController.inProgress ,
                      replacement:const CenteredCircularPrograssIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: const Text("Next"),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool result = await _emailVerificationController
        .verifyEmail(_emailTEController.text.trim());
    if (result) {
      Get.to(
        () => OtpVerificationScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          _emailVerificationController.errorMessage!,
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}

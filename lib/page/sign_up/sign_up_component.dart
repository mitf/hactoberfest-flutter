import 'package:flutter/material.dart';
import 'package:sandbox_apps/resource/resources.dart';
import 'package:sandbox_apps/widget/widget.dart';

class SignUpComponent extends StatefulWidget {
  const SignUpComponent({Key? key}) : super(key: key);

  @override
  _SignUpComponentState createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  var _formKey = GlobalKey<FormState>();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextInputFieldWidget(
              hint: Constants.LABEL_EMAIL,
              border: true,
              validation: ValidatorWidget.emailValidator,
            ),
            SizedBox(
              height: 16,
            ),
            TextInputFieldWidget(
              textEditingController: _passwordController,
              border: true,
              hint: Constants.PASSWORD,
              isPassword: true,
              validation: ValidatorWidget.passwordValidator,
            ),
            SizedBox(
              height: 16,
            ),
            TextInputFieldWidget(
              textEditingController: _confirmPasswordController,
              border: true,
              hint: Constants.CONFIRM_PASSWORD,
              isPassword: true,
              validation: (value) {
                if (value!.isEmpty) {
                  return "Confirm Password is required";
                } else if (value.compareTo(_passwordController.text) != 0) {
                  return "Confirm Password do not match";
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

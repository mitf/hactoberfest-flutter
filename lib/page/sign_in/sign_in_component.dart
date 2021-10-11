import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_apps/resource/resources.dart';
import 'package:sandbox_apps/widget/widget.dart';

class SignInComponent extends StatefulWidget {
  const SignInComponent({Key? key}) : super(key: key);

  @override
  _SignInComponentState createState() => _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        children: [
          Center(
            child: Icon(
              Icons.android,
              size: 150,
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    hint: Constants.PASSWORD,
                    border: true,
                    isPassword: true,
                    validation: ValidatorWidget.passwordValidator,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacementNamed(
                                      context, 'home_page');
                                }
                              },
                              child: const Text('Sign In')),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                        text: "Don't have an Account? ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextSpan(
                        text: "Register Here",
                        style: const TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, 'sign_up_page');
                          },
                      ),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInputFieldWidget extends StatefulWidget {
  TextInputFieldWidget(
      {Key? key,
      required this.hint,
      this.border,
      this.enable,
      this.maxLength,
      this.textInputType,
      this.validation,
      this.isPassword = false,
      this.textEditingController})
      : super(key: key);

  final String hint;
  bool? border;
  bool? enable;
  bool isPassword;
  int? maxLength;
  TextEditingController? textEditingController;
  TextInputType? textInputType;
  FormFieldValidator<String>? validation;

  @override
  _TextInputFieldWidgetState createState() => _TextInputFieldWidgetState();
}

class _TextInputFieldWidgetState extends State<TextInputFieldWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      validator: widget.validation,
      maxLength: widget.maxLength,
      autocorrect: false,
      keyboardType: widget.textInputType != null
          ? widget.textInputType
          : TextInputType.text,
      enabled: widget.enable,
      obscureText: widget.isPassword ? _isObscure : false,
      decoration: InputDecoration(
        labelText: widget.hint,
        counterText: "",
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility))
            : null,
        enabledBorder: (widget.border != null && widget.border!)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.cyanAccent),
              )
            : null,
        focusedBorder: (widget.border != null && widget.border!)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.cyan),
              )
            : null,
        focusedErrorBorder: (widget.border != null && widget.border!)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              )
            : null,
        errorBorder: (widget.border != null && widget.border!)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.redAccent),
              )
            : null,
      ),
    );
  }

  void _togglePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}

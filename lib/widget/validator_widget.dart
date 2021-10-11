import 'package:form_field_validator/form_field_validator.dart';

class ValidatorWidget {
  ValidatorWidget._();

  static MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid Email format'),
    MinLengthValidator(6, errorText: 'Email must contain at least 6 character'),
  ]);

  static MultiValidator passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6,
        errorText: 'Password must contain at least 6 character'),
  ]);
}

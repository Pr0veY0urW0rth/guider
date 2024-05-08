import 'package:formz/formz.dart';
import 'package:guider/src/core/domain/validation/auth_validation.dart';

enum EmailValidationError {
  empty,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Почта отсутствует!';
      case invalid:
        return 'Неверная почта!';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  // ignore: use_super_parameters
  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return EmailValidationError.empty;
    }

    if (!EmailSubmitRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

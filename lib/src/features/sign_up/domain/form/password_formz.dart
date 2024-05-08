import 'package:formz/formz.dart';
import 'package:guider/src/core/domain/validation/auth_validation.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  tooLong,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Пароль отсутствует!';
      case tooLong:
        return 'Пароль слишком длинный!';
      case tooShort:
        return 'Пароль слишком короткий!';
      case invalid:
        return 'Неверный пароль!';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  // ignore: use_super_parameters
  const PasswordFormz.dirty(String value) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MaxLengthStringValidator(60).isValid(value)) {
      return PasswordValidationError.tooLong;
    }

    if (!MinLengthStringValidator(6).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}

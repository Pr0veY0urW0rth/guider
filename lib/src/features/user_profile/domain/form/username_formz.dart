import 'package:formz/formz.dart';
import 'package:guider/src/core/domain/validation/auth_validation.dart';

enum UsernameValidationError {
  empty,
  tooShort,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return "Имя пользователя отсутствует!";
      case tooShort:
        return 'Слишком короткое имя пользователя!';
      case invalid:
        return 'Неверное имя пользователя!';
    }
  }
}

class UsernameFormz extends FormzInput<String, UsernameValidationError> {
  const UsernameFormz.pure() : super.pure('');

  // ignore: use_super_parameters
  const UsernameFormz.dirty(String value) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    if (value.length < 6) return UsernameValidationError.tooShort;

    if (!UsernameSubmitRegexValidator().isValid(value)) {
      return UsernameValidationError.invalid;
    }
    return null;
  }
}

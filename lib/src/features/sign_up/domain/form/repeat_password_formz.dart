import 'package:formz/formz.dart';
import 'package:guider/src/core/domain/validation/auth_validation.dart';

enum RepeatPasswordValidationError {
  empty,
  tooShort,
  tooLong,
  invalid,
  mismatch;

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
      case mismatch:
        return 'Пароли не совпадают!';
    }
  }
}

class RepeatPasswordFormz
    extends FormzInput<String, RepeatPasswordValidationError> {
  final String password;
  const RepeatPasswordFormz.pure({this.password = ''}) : super.pure('');

  const RepeatPasswordFormz.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  RepeatPasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return RepeatPasswordValidationError.empty;
    }

    if (!MaxLengthStringValidator(60).isValid(value)) {
      return RepeatPasswordValidationError.tooLong;
    }

    if (!MinLengthStringValidator(6).isValid(value)) {
      return RepeatPasswordValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return RepeatPasswordValidationError.invalid;
    }

    if (value != password) {
      return RepeatPasswordValidationError.mismatch;
    }

    return null;
  }
}

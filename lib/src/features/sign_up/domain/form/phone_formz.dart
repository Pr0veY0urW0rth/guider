import 'package:formz/formz.dart';
import 'package:guider/src/core/domain/validation/auth_validation.dart';

enum PhoneValidationError {
  empty,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Номер телефона отсутствует!';
      case invalid:
        return 'Неверный формат телефона!';
    }
  }
}

class PhoneFormz extends FormzInput<String, PhoneValidationError> {
  const PhoneFormz.pure() : super.pure('');

  // ignore: use_super_parameters
  const PhoneFormz.dirty(String value) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PhoneValidationError.empty;
    }

    if (!PhoneSubmitRegexValidator().isValid(value)) {
      return PhoneValidationError.invalid;
    }

    return null;
  }
}

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({
    required this.regexSource,
  });

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);
      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      assert(false, e.toString());
      return true;
    }
  }
}

class UsernameSubmitRegexValidator extends RegexValidator {
  UsernameSubmitRegexValidator()
      : super(regexSource: r'(^[a-zA-Z0-9_.+-]{8,60}$)');
}

class PasswordSubmitRegexValidator extends RegexValidator {
  PasswordSubmitRegexValidator()
      : super(
            regexSource:
                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*();:,."-_/#?&])[A-Za-z\d@$!%*();:,."-_/#?&]{8,60}$');
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator()
      : super(
            regexSource:
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}

class PhoneSubmitRegexValidator extends RegexValidator {
  PhoneSubmitRegexValidator()
      : super(regexSource: r'^((\+7|7|8)+([0-9]){10})$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);

  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}

class MaxLengthStringValidator extends StringValidator {
  MaxLengthStringValidator(this.maxLength);

  final int maxLength;

  @override
  bool isValid(String value) {
    return value.length <= maxLength;
  }
}

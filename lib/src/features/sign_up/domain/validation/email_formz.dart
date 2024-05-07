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

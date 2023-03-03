abstract class MyBookException {}

class MyBookLoginDuplicatedException extends MyBookException {
  final body = 'Логін вже зайнятий';
}

class MyBookMailDuplicatedException extends MyBookException {
  final body = 'Пошта вже зайнята';
}

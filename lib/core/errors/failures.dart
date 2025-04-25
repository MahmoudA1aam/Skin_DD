abstract class Failure {
  final String message;
  Failure(this.message);
}

class SeverFailure extends Failure {
  SeverFailure(super.message);
}

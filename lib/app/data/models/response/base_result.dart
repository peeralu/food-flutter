typedef FutureResult<S> = Future<ResultData<S>>;

abstract class ResultData<S> {
  static ResultData<S> failure<S>(Failure failure) => _FailureResult(failure);
  static ResultData<S> success<S>(S data) => _SuccessResult(data);

  Failure? get error => fold<Failure?>((error) => error, (data) => null);
  S? get data => fold<S?>((error) => null, (data) => data);

  bool get isSuccess => this is _SuccessResult<S>;
  bool get isFailure => this is _FailureResult<S>;

  bool get hasData => this.data != null;
  bool get hasError => this.error != null;

  bool get isSuccessAndHasData => isSuccess && hasData;
  bool get isFailureAndHasError => isFailure && hasError;

  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData);
}

class _SuccessResult<S> extends ResultData<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData) {
    return fnData(_value);
  }
}

class _FailureResult<S> extends ResultData<S> {
  final Failure _value;

  _FailureResult(this._value);

  @override
  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData) {
    return fnFailure(_value);
  }
}

abstract class Failure implements Exception {
  final String? message;

  Failure({
    this.message,
  });
}

class ApiServiceFailure extends Failure {
  ApiServiceFailure({required String message}) : super(message: message);
}

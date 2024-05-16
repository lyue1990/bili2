
class BaseReponse<T> {
  final int statusCode;

  final T data;

  Error? error;

  BaseReponse({required this.statusCode, required this.data, this.error});
}
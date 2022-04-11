/// provides access to stream of objects[T]
abstract class Streamer<T extends Object?> {
  /// unique [T] states stream
  Stream<T> get stream;
}

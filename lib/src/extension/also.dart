extension Also<T> on T {
  /// Applies a given side-effect function [fn] passing the current value as parameter.
  ///
  /// The return is also the current value.
  ///
  /// This is useful when you don't want to create a temporary variable just to
  /// apply a side-effect function.
  ///
  /// Similar to [Stream.also].
  T also(void Function(T) fn) {
    fn(this);
    return this;
  }
}

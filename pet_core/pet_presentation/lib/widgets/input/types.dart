typedef FormValidator<T> = String? Function(T?);

abstract class PatternEvaluator {
  /// Returns the string representation of the pattern
  String get pattern;

  /// Evaluates if the the patter has a match with the [input]
  bool hasMatch(String input);
}

class RegExpPatternEvaluator implements PatternEvaluator {
  final RegExp regExp;

  /// Constructs an instance of the class.
  /// The argument [regExp] must not be null.
  RegExpPatternEvaluator(this.regExp);

  @override
  bool hasMatch(String input) {
    return regExp.hasMatch(input);
  }

  @override
  String get pattern => regExp.pattern;
}

class DefaultPatternEvaluator implements PatternEvaluator {
  final Pattern _pattern;

  /// Constructs an instance of the class.
  /// The argument [pattern] must not be null.
  DefaultPatternEvaluator(Pattern pattern) : _pattern = pattern;

  @override
  bool hasMatch(String input) => _pattern.allMatches(input).isNotEmpty;

  @override
  String get pattern => _pattern.toString();
}

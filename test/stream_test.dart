import 'dart:async';

import 'package:dartf/dartf.dart';
import 'package:test/test.dart';

void main() {
  test('[also]', () async {
    final result = <int>[];

    final items = await Stream.fromIterable([1, 2, 3])
        .also((it) => result.add(it))
        .toList();

    expect(items, [1, 2, 3]);
    expect(result, [1, 2, 3]);
  });
  test('[asyncAlso]', () async {
    final result = <int>[];

    final items = await Stream.fromIterable([1, 2, 3])
        .asyncAlso((it) async => result.add(it))
        .toList();

    expect(items, [1, 2, 3]);
    expect(result, [1, 2, 3]);
  });
  test('[merge] basic', () async {
    final result = <int>[];

    final items = await [
      Stream.fromIterable([1, 2, 3]),
      Stream.fromIterable([4, 5, 6]),
    ].merge().also((it) => result.add(it)).toList();

    expect(items, [1, 4, 2, 5, 3, 6]);
    expect(result, [1, 4, 2, 5, 3, 6]);
  });
  test('[merge] multiple types', () async {
    final result = <dynamic>[];

    final items = await <Stream<dynamic>>[
      Stream.fromIterable([1, 2, 3]),
      Stream.fromIterable(['a', 'b', 'c']),
    ].merge().also((it) => result.add(it)).toList();

    expect(items, [1, 'a', 2, 'b', 3, 'c']);
    expect(result, [1, 'a', 2, 'b', 3, 'c']);
  });
}

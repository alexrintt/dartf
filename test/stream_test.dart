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
}

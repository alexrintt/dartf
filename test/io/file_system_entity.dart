import 'dart:io';

import 'package:dartf/dartf_io.dart';
import 'package:test/test.dart';

void main() {
  group('FileSystemEntity', () {
    test('name', () {
      final file = File('~/home/log.txt');
      expect(file.name, 'log.txt');
    });
    test('nameWithoutExtension', () {
      final file = File('~/home/log.txt');
      expect(file.name, 'log');
    });
    test('dirName', () {
      final file = File('~/home/log.txt');
      expect(file.dirName, '~/home');
    });
    test('isWithin', () {
      final file = File('~/home/log.txt');
      final home = Directory('~/home/');
      expect(file.isWithin(home), isTrue);
    });
    test('withName', () {
      final file = File('~/home/log.txt');
      expect(file.withName('text.log'), File('~/home/text.log'));
    });
    test('extension', () {
      final file = File('~/home/log.txt');
      expect(file.extension, '.txt');
    });
  });
}

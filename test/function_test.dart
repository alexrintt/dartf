// ignore_for_file: prefer_function_declarations_over_variables
import 'package:dartf/dartf.dart';
import 'package:test/test.dart';

void main() {
  group('Function', () {
    group('Function1X', () {
      final func = (String s) => s;

      test('.invoke()', () {
        expect(func.invoke('t'), 't');
      });

      test('.partial()', () {
        final p = func.partial('p');
        expect(p(), 'p');
      });
    });

    group('Function2X', () {
      final func = (String s1, String s2) => '$s1,$s2';

      test('.invoke()', () {
        expect(func.invoke('t1', 't2'), 't1,t2');
      });

      test('.curry()', () {
        final curr = func.curry();
        expect(curr('t1')('t2'), 't1,t2');
      });

      test('.partial()', () {
        final p = func.partial('p');
        expect(p('t'), 'p,t');
      });

      test('.partial2()', () {
        final p = func.partial2('p1', 'p2');
        expect(p(), 'p1,p2');
      });

      test('.flip()', () {
        final flipped = func.flip();
        expect(flipped('t1', 't2'), 't2,t1');
      });
    });

    group('Curry2X', () {
      final func = (String s1) => (String s2) => '$s1,$s2';
      test('.uncurry()', () {
        final uncurr = func.uncurry();
        expect(uncurr('t1', 't2'), 't1,t2');
      });
    });

    group('Function3X', () {
      final func = (String s1, String s2, String s3) => '$s1,$s2,$s3';

      test('.invoke()', () {
        expect(func.invoke('t1', 't2', 't3'), 't1,t2,t3');
      });

      test('.curry()', () {
        final curr = func.curry();
        expect(curr('t1')('t2')('t3'), 't1,t2,t3');
      });

      test('.partial()', () {
        final p = func.partial('p');
        expect(p('t1', 't2'), 'p,t1,t2');
      });

      test('.partial2()', () {
        final p = func.partial2('p1', 'p2');
        expect(p('t'), 'p1,p2,t');
      });

      test('.partial3()', () {
        final p = func.partial3('p1', 'p2', 'p3');
        expect(p(), 'p1,p2,p3');
      });
    });

    group('Curry3X', () {
      final func = (String s1) => (String s2) => (String s3) => '$s1,$s2,$s3';
      test('.uncurry()', () {
        final uncurr = func.uncurry();
        expect(uncurr('t1', 't2', 't3'), 't1,t2,t3');
      });
    });

    group('Function4X', () {
      final func =
          (String s1, String s2, String s3, String s4) => '$s1,$s2,$s3,$s4';

      test('.invoke()', () {
        expect(func.invoke('t1', 't2', 't3', 't4'), 't1,t2,t3,t4');
      });

      test('.curry()', () {
        final curr = func.curry();
        expect(curr('t1')('t2')('t3')('t4'), 't1,t2,t3,t4');
      });

      test('.partial()', () {
        final p = func.partial('p');
        expect(p('t1', 't2', 't3'), 'p,t1,t2,t3');
      });

      test('.partial2()', () {
        final p = func.partial2('p1', 'p2');
        expect(p('t1', 't2'), 'p1,p2,t1,t2');
      });

      test('.partial3()', () {
        final p = func.partial3('p1', 'p2', 'p3');
        expect(p('t'), 'p1,p2,p3,t');
      });

      test('.partial4()', () {
        final p = func.partial4('p1', 'p2', 'p3', 'p4');
        expect(p(), 'p1,p2,p3,p4');
      });
    });

    group('Curry4X', () {
      final func = (String s1) =>
          (String s2) => (String s3) => (String s4) => '$s1,$s2,$s3,$s4';
      test('.uncurry()', () {
        final uncurr = func.uncurry();
        expect(uncurr('t1', 't2', 't3', 't4'), 't1,t2,t3,t4');
      });
    });
  });
}

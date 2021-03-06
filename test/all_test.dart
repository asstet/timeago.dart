library timeago.test;

import 'package:test/test.dart';
import 'package:timeago/timeago.dart';

final now = new DateTime.now();

void main() {
  final fuzzy = new TimeAgo();
  group('Ago', () {
    test('less than a minute ago', () {
      var result = fuzzy.format(now.subtract(new Duration(seconds: 1)));
      expect(result, equals('just a moment ago'));

      result = fuzzy.format(now.subtract(new Duration(seconds: 44)));
      expect(result, equals('just a moment ago'));
    });

    test('about a minute ago', () {
      var result = fuzzy.format(now.subtract(new Duration(seconds: 45)));
      expect(result, equals('a minute ago'));

      result = result = fuzzy.format(now.subtract(new Duration(seconds: 89)));
      expect(result, equals('a minute ago'));
    });

    test('n minutes ago', () {
      var result = fuzzy.format(now.subtract(new Duration(seconds: 90)));
      expect(result, equals('2 minutes ago'));

      result = fuzzy.format(now.subtract(new Duration(minutes: 44)));
      expect(result, equals('44 minutes ago'));
    });

    test('about an hour ago', () {
      var result = fuzzy.format(now.subtract(new Duration(minutes: 45)));
      expect(result, equals('an hour ago'));

      result = fuzzy.format(now.subtract(new Duration(minutes: 89)));
      expect(result, equals('an hour ago'));
    });

    test('n hours ago', () {
      var result = fuzzy.format(now.subtract(new Duration(minutes: 90)));
      expect(result, equals('2 hours ago'));

      result = fuzzy.format(now.subtract(new Duration(hours: 23)));
      expect(result, equals('23 hours ago'));
    });

    test('a day ago', () {
      var result = fuzzy.format(now.subtract(new Duration(hours: 24)));
      expect(result, equals('a day ago'));

      result = fuzzy.format(now.subtract(new Duration(hours: 47)));
      expect(result, equals('a day ago'));
    });

    test('n days ago', () {
      var result = fuzzy.format(now.subtract(new Duration(hours: 48)));
      expect(result, equals('2 days ago'));

      result = fuzzy.format(now.subtract(new Duration(days: 29)));
      expect(result, equals('29 days ago'));
    });

    test('about a month ago', () {
      var result = fuzzy.format(now.subtract(new Duration(days: 30)));
      expect(result, equals('a month ago'));

      result = fuzzy.format(now.subtract(new Duration(days: 59)));
      expect(result, equals('a month ago'));
    });

    test('n a month ago', () {
      var result = fuzzy.format(now.subtract(new Duration(days: 60)));
      expect(result, equals('2 months ago'));

      result = fuzzy.format(now.subtract(new Duration(days: 364)));
      expect(result, equals('12 months ago'));
    });

    test('about a year ago', () {
      var result = fuzzy.format(now.subtract(new Duration(days: 365)));
      expect(result, equals('a year ago'));

      result = fuzzy.format(now.subtract(new Duration(days: 364 * 2)));
      expect(result, equals('a year ago'));
    });

    test('n years ago', () {
      var result = fuzzy.format(now.subtract(new Duration(days: 365 * 2)));
      expect(result, equals('2 years ago'));

      result = fuzzy.format(now.subtract(new Duration(days: 365 * 5)));
      expect(result, equals('5 years ago'));
    });
  });

  group('Locale', () {
    test('show messages in supported locales', () async {
      await fuzzy.initializeLocale('es');
      await fuzzy.initializeLocale('es_short');
      await fuzzy.initializeLocale('en_short');
      await fuzzy.initializeLocale('fa');
      await fuzzy.initializeLocale('fr');
      await fuzzy.initializeLocale('it');
      await fuzzy.initializeLocale('ja');
      await fuzzy.initializeLocale('zh');
      await fuzzy.initializeLocale('zh_CN');
      await fuzzy.initializeLocale('pt_BR');
      await fuzzy.initializeLocale('pt_BR_short');
      await fuzzy.initializeLocale('ru');

      var result = timeAgo(now.subtract(new Duration(seconds: 1)));
      expect(result, equals('just a moment ago'));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'en_short');
      expect(result, equals('now'));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'es');
      expect(result, equals('hace un momento'));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'es_short');
      expect(result, equals('ahora'));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'fa');
      expect(result, equals("چند لحظه پیش"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'fr');
      expect(result, equals("il y a moins d\'une minute"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'it');
      expect(result, equals("meno di un minuto fa"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'ja');
      expect(result, equals("1 分未満 前"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'zh');
      expect(result, equals("少於一分鐘 前"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'zh_CN');
      expect(result, equals("少于一分钟 前"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'pt_BR');
      expect(result, equals("há poucos segundos"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'pt_BR_short');
      expect(result, equals("agora"));

      result = timeAgo(now.subtract(new Duration(seconds: 1)), locale: 'ru');
      expect(result, equals("минуту назад"));
      
    });
  });
}


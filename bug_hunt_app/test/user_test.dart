import 'package:flutter_test/flutter_test.dart';
import 'package:bug_hunt_app/models/user.dart';

void main() {
  group('User JSON Parsing Tests', () {
    test('fromJson creates User correctly', () {
      final json = {'email': 'test@example.com', 'password': 'password123'};

      final user = User.fromJson(json);

      expect(user.email, 'test@example.com');
      expect(user.password, 'password123');
    });

    test('toJson returns correct map', () {
      final user = User(email: 'test@example.com', password: 'password123');

      final json = user.toJson();

      expect(json['email'], 'test@example.com');
      expect(json['password'], 'password123');
    });

    test('fromJson throws when email is missing', () {
      final json = {'password': 'password123'};

      expect(() => User.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}

import 'package:learnflutter_mvp/repository/contact/mock_contact_repository.dart';
import 'package:learnflutter_mvp/repository/contact/random_user_repository.dart';
import 'package:learnflutter_mvp/repository/contact/contact_repository.dart';

enum Flavor { MOCK, PRO }

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ContactRepository get contactRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockContactRepository();
      default:
        return new RandomUserRepository();
    }
  }
/**
 * example
 * UserRepository get getUser{
 *   return <repository class call api>
 * }
 */
}

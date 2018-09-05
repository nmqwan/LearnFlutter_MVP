import 'package:learnflutter_mvp/repository/mock_contact_repository.dart';
import 'package:learnflutter_mvp/repository/random_user_repository.dart';
import 'package:learnflutter_mvp/model/contact.dart';

enum Flavor {
  MOCK,
  PRO
}

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
    switch(_flavor) {
      case Flavor.MOCK: return new MockContactRepository();
      default: // Flavor.PRO:
        return new RandomUserRepository();
    }
  }
}
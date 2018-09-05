import 'dart:async';
import 'package:learnflutter_mvp/model/contact.dart';

class MockContactRepository implements ContactRepository {
  Future<List<Contact>> fetch() {
    return new Future.value(kContacts);
  }
}

const kContacts = const <Contact>[
  const Contact(
      fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
  const Contact(fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com')
];

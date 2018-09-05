import 'package:learnflutter_mvp/model/contact.dart';
import 'dart:async';

abstract class ContactRepository {
  Future<List<Contact>> fetch();
}

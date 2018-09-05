import 'package:learnflutter_mvp/model/contact.dart';
import 'package:learnflutter_mvp/injection/dependency_injection.dart';
import 'package:learnflutter_mvp/repository/contact/contact_repository.dart';

abstract class ContactListViewContract {
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError();
}

class ContactListPresenter {
  ContactListViewContract _view;
  ContactRepository _repository;

  ContactListPresenter(this._view) {
    _repository = new Injector().contactRepository;
  }

  void loadContacts() {
    assert(_view != null);

    _repository
        .fetch()
        .then((contacts) => _view.onLoadContactsComplete(contacts))
        .catchError((onError) {
      print(onError);
      _view.onLoadContactsError();
    });
  }
}

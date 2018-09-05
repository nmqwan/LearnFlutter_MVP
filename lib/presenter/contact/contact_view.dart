import 'package:flutter/material.dart';
import 'package:learnflutter_mvp/model/contact.dart';
import 'package:learnflutter_mvp/presenter/contact/contact_presenter.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contacts"),
        ),
        body: new ContactList());
  }
}

///
///   Contact List
///

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => new _ContactListState();
}

class _ContactListState extends State<ContactList>
    implements ContactListViewContract {
  ContactListPresenter _presenter;

  List<Contact> _contacts;

  bool _IsSearching;

  _ContactListState() {
    _presenter = new ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = true;
    _presenter.loadContacts();
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    print('12321321');
    setState(() {
      _contacts = items;
      _IsSearching = false;
    });
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_IsSearching) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()));
    } else {
      widget = ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(_contacts[index].fullName),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );
          });
    }
    return widget;
  }
}

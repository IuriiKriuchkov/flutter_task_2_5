import 'package:flutter/material.dart';
import 'contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<UserContact> _contacts = kContacts;
  int? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список контактов'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_contacts[index].fullName),
              subtitle: Text(_contacts[index].phone),
              leading: CircleAvatar(
                child: Text(_contacts[index].fullName[0]),
              ),
              selected: index == _selectedItem,
              onTap: (){
                setState(() {
                  _selectedItem = index;
                });
              },
            );
          }),
    );
  }
}

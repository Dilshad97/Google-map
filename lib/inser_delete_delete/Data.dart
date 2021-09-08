import 'package:flutter/material.dart';

import 'Model.dart';
class DaTA extends StatefulWidget {
  const DaTA({Key? key}) : super(key: key);

  @override
  _DaTAState createState() => _DaTAState();
}

class _DaTAState extends State<DaTA> {
  ScrollController _scroll = ScrollController();
  Contact _contact = Contact(
    id: 0,
    mobile: '',
    Lastname: '',
    Firstname: '',
    Email: '',
    Password: '',
  );
  List<Contact> _contacts = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _ctrlMobile ,pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Welcome',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }
  _form() => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    child: SingleChildScrollView(
      controller: _scroll,
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (val) =>
              (val!.length == 0 ? 'This field is mandatory' : null),
              onSaved: (val) => setState(() => _contact.Firstname = val!),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (val) =>
              (val!.length == 0 ? 'This field is mandatory' : null),
              onSaved: (val) => setState(() => _contact.Lastname = val!),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (val) =>
              (val!.length == 0 ? 'This field is mandatory' : null),
              onSaved: (val) => setState(() => _contact.Email = val!),
            ),
            TextFormField(
              controller: pwd,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (val) =>
              (val!.length > 10 ? 'This field is mandatory' : null),
              onSaved: (val) => setState(() => _contact.Password = val!),
            ),
            TextFormField(
              controller: _ctrlMobile,
              decoration: InputDecoration(labelText: 'Mobile'),
              // validator: (val) =>
              //     val!.length < 10 ? '10 characters required' : null,
              onSaved: (val) => setState(() => _contact.mobile = val!),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50.0,
                top: 15,
              ),
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: () => _onSubmit(),
                    child: Text('Submit'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _contacts.clear();
                      });
                    },
                    child: Text('Clear'),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      _contacts.add(Contact(
        id: 0,
        Lastname: _contact.Lastname,
        mobile: _contact.mobile,
        Firstname: _contact.Firstname,
        Email: _contact.Email,
        Password: _contact.Password,
      ));
      form.reset();
    }
  }

  _list() => Expanded(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                setState(() {

                  _contacts[index].Firstname ==  pwd?.text ;
                  print('_ctrlMobile ${pwd?.text}');
                });
              },
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              _contacts[index].Firstname.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _contacts[index].Lastname.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _contacts.removeAt(index);
                                  });
                                },
                                child: Icon(Icons.delete)),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _contacts[index].Email.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _contacts[index].Password.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _contacts[index].mobile,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   leading: Text(
                  //     _contacts[index].Firstname.toUpperCase(),
                  //     style: TextStyle(
                  //         color: Colors.redAccent,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  //   title: Text(
                  //     _contacts[index].Lastname.toUpperCase(),
                  //     style: TextStyle(
                  //         color: Colors.redAccent,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  //   subtitle: Text(
                  //       _contacts[index].mobile),
                  //   trailing: IconButton(
                  //     icon: Icon(Icons.delete),
                  //     onPressed: () {
                  //       setState(() {
                  //         _contacts.removeAt(index);
                  //       });
                  //     },
                  //   ),
                  //   onTap: () {},
                  // ),
                  Divider(
                    height: 5.0,
                  ),
                ],
              ),
            );
          },
          itemCount: _contacts.length,
        ),
      ),
    ),
  );
}

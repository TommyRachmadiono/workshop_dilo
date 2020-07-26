import 'package:flutter/material.dart';
import 'package:workshop_dilo/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _selectedVisibility = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'http://pngimg.com/uploads/cat/cat_PNG50534.png',
              width: 100,
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: width / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      validator: (val) =>
                          val.isEmpty ? 'Username tidak boleh kosong' : null,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (val) =>
                          val.isEmpty ? 'Password tidak boleh kosong' : null,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            setState(() {
                              _selectedVisibility = !_selectedVisibility;
                            });
                            print(_selectedVisibility);
                          },
                          child: Icon(_selectedVisibility
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      obscureText: _selectedVisibility ? false : true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width,
                      child: RaisedButton(
                        splashColor: Colors.amber,
                        color: Colors.amberAccent[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Belum punya akun ? Daftar disini',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

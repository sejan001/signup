import "package:flutter/material.dart";
import "package:project_signup/main.dart";
import "package:shared_preferences/shared_preferences.dart";
import "home.dart";

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignupState();
}

class _SignupState extends State<Login> {
  TextEditingController _username1 = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Login ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 100,
                child: Image.network(
                    "data:image/png;base64,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"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 400,
                    child: TextFormField(
                      onSaved: (value) {
                        _username1.text = value!;
                      },
                      controller: _username1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Username",
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Cant be empty";
                        }
                        if (value.length > 10) {
                          return "Cant be more than 10 letters";
                        }
                        if (value.length > 10) {
                          return "Cant be more than 10 letters";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    child: TextFormField(
                        onSaved: (value) {
                          _password1.text = value!;
                        },
                        controller: _password1,
                        obscureText: _showpass,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Password",
                            hintText: "Password",
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showpass = !_showpass;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Cant be empty";
                          }
                          if (value.length > 10) {
                            return "Cant be more than 10 letters";
                          }
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        _login();
                      }
                    },
                    child: Text("Login")),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text("Dont have an account?")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    String username = _username1.text;
    String password = _password1.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedusername = prefs.getString('Username');
    String? storedpassword = prefs.getString('Password');

    if (username == storedusername && password == storedpassword) {
      // Successful login
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home()), //) Navigate to home page
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Wrong username or password.'),
          );
        },
      );
    }
  }
}

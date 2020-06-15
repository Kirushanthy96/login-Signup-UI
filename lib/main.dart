import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "required";
    } else if (value.length < 6) {
      return "should be at least 6 charecters";
    } else if (value.length > 15) {
      return "should not be more than 15 charecters";
    } else {
      return null;
    }
  }

  void moveToRegister() {
    formkey.currentState.reset();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  }

  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('login',style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText: "Email"
                      ),
                      validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Required *"),
                            EmailValidator(errorText: "Not A Valid Email"),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: "Password",
                        ),
                        obscureText: true,
                        validator: validatepass,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: RaisedButton(
                        onPressed: validate,
                        child: Text("Login",style: TextStyle(color: Colors.white),),
                        color: Colors.green,
                      ),
                    ),
                    new FlatButton(
                      child: new Text("Don't have an account",
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.blue),),
                      onPressed: moveToRegister,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}




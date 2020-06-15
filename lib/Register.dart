import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Signup extends StatefulWidget{
  @override
  State createState(){
    return RegisterPage();
  }
}

class RegisterPage extends State<Signup> {


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
    } else{
      return null;
    }
  }


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List<String> _Type = ['Lecturer', 'Demo', 'Student'];
  String _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Create an Account',style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold)),
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
                    padding:EdgeInsets.only(
                        top:20.0),
                    child:TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText: "User name"
                      ),
                      validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Required *"),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top:20.0
                    ),
                    child: DropdownButton(
                      hint: Text('Select Type'), // Not necessary for Option 1
                      value: _selectedType,
                      onChanged: (String Value) {
                        setState(() {
                          _selectedType = Value;
                        });
                      },
                      items: _Type.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText: "Password"
                      ),
                      obscureText: true,
                      validator: validatepass,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText: "Confirm Password"

                      ),
                      validator: validatepass,
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: RaisedButton(
                      onPressed: validate,
                      child: Text('Signup',style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                    ),
                  ),
                  new FlatButton(
                    child: new Text("Already have an account",
                      style: new TextStyle(fontSize: 20.0, color: Colors.blue),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
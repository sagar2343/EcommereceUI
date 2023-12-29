import 'package:first_project/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child:  SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                        }
                          return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty){
                          return "Password cannot be Empty";
                        }
                        else if (value!.length < 6){
                          return "Password length should be atleast 6";
                        }
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    Row(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.deepPurple,

                          borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 120),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 40 : 130,
                              height: 40,

                              alignment: Alignment.center,
                              child:changeButton
                                  ?Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                                  : Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(changeButton ? 40 : 120),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, MyRoutes.registerRoute),
                            child: Container(
                              width: 130,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

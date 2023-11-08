import 'package:base/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.firstRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  TextEditingController countryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF6F1F1),
      child: Form(
          child: Padding(
        padding: const EdgeInsets.only(top: 120, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/img1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login Now',
                  style: TextStyle(
                    color: Color(0xFF0245A3),
                    fontSize: 30,
                    fontFamily: 'Mplus1p',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please Login or Sign up to continue using the app',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Mplus1p',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF0245A3)),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF0245A3)),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your password",
                          suffixIcon: IconButton(
                            icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFF0245A3)),
                            onPressed: () {
                              setState(() {
                                _obscureText =
                                    !_obscureText; // Toggle the visibility
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Add the action for "Forgot Password" here
                    print("Forgot Password tapped");
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Mplus1p',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0245A3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Mplus1p',
                        fontSize: 18,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the Register page when "Register" is clicked
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Do not have an account? Register',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Mplus1p',
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

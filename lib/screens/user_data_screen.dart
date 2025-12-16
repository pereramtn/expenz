import 'package:dp_5/constance/colours.dart';
import 'package:dp_5/constance/constance.dart';
import 'package:dp_5/widgets/custm_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //controllers for the text from fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter Your Personal Details",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 30),

                //form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form field for the user name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check whether the user entered a valid username
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //form field for the email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check whether the user entered a valid email
                          if (value!.isEmpty) {
                            return "Please Enter Your E-mail";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //form field for the password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check whether the user entered a valid password
                          if (value!.isEmpty) {
                            return "Please Enter a valid Password";
                          }
                        },
                        obscureText: true, //not visible letters
                        decoration: InputDecoration(
                          hintText: "Enter Your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //form field for the confirm password
                      TextFormField(
                        controller: _ConfirmPasswordController,
                        validator: (value) {
                          //check whether the user entered a valid confirm password
                          if (value!.isEmpty) {
                            return "Please  Confirm Your Password";
                          }
                        },
                        obscureText: true, //not visible letters
                        decoration: InputDecoration(
                          hintText: "confirm Your Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 30),

                      //remember me for the next time
                      Row(
                        children: [
                          const Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      //submit button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //form is valid , process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _ConfirmPasswordController.text;

                          }
                        },
                        child: CustmButton(
                          btnname: "Next",
                          btncolour: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

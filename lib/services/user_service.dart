import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //method to store username and email in shaed preference
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check whether the user enteredpasswored and confirm password are the same
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and Confirm Password do not match"),
          ),
        );
        return;
      }
      //if user password and confirm password are same then store user name and email

      //create an instance shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store username and password as key values
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      //show massege for the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Details Stored Successfully..!")),
      );
      return;
    } catch (err) {
      err.toString();
    }
  }

  //method to check weather username is saved in the shared pref
  static Future<bool> checkUsername() async {
    //create an instance for shared prefe
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("username");
    return userName != null;
  }

  //get the user name and the email
  static Future<Map<String, String>> getUserData() async {
    //create an instance for shared pref
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? userName = pref.getString("username");
    String? email = pref.getString("email");

    return {"username": userName!, "email": email!};
  }
}

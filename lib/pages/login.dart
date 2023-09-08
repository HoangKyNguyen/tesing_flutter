import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  void loginUser () async {
    await http.post(
      Uri.parse('https://your-api-url.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': emailController, 'password': passwordController}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/images/LCK.png"),
                 SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    bool emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]+)*$").hasMatch(value!);
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                    if(!emailRegex){
                      return "Enter valid email";
                    }
                  },
                ),

                 SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration:  InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: (){
                         setState(() {
                           passToggle= !passToggle;
                         });
                      },
                      child: Icon(passToggle?Icons.visibility : Icons.visibility_off),
                    )
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    }else if(passwordController.text.length<6){
                      return "Password required 6 characters or more";
                    }
                  },
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: (){
                    if(_formField.currentState!.validate()){
                      emailController.clear();
                      passwordController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Center(
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                        onPressed: (

                        ){

                    },
                        child:const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/pages/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  // Login function

  static Future<User?>loginUsingEmailPassword({required String email, required String password, required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User?user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email:email,password:password);
      user = userCredential.user;
  } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("NO user found for that email");
  }
  }
  return user;
  }


  @override
  Widget build(BuildContext context) {
    // create the textfeild controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Welcome Back to ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
              fontWeight: FontWeight.normal,
              )
          ),
          const Text(" EK STORE",
            style: TextStyle(
                color: Colors.black,
                fontSize:44.0,
                fontWeight: FontWeight.bold
          ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText:"User Email",
              prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                hintText:("User password"),
                prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black),
            ),),
          const SizedBox(
            height: 12.0,
          ),
          const Text('Dont remember your password?',style: TextStyle(
            color: Colors.blue,)),
             const SizedBox(
              height: 68.0,
             ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                //  lets test the app
                  User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const ProfileScreen()));
                  //      new profile screen page
                  }

                },
            child: const Text("Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            )
          ),
          ),
        ],
      ),
    );
  }
}

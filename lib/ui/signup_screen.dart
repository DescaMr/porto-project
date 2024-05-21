import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool rememberUser = false;

  Color c1 = const Color(0xFF29B6F6);
  @override
  Widget build(BuildContext context) {
    myColor = c1;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/bglogin.jpg"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(c1.withOpacity(0.6), BlendMode.srcATop),
          ),
        ),
        child: Stack(children: [
          Positioned(top: 70, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.people,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "SocialBox",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign Up",
          style:
              TextStyle(color: c1, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Create Your Account"),
        const SizedBox(height: 60),
        _buildGreyText("Name"),
        _buildInputField(nameController),
        const SizedBox(height: 20),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 20),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildGreyText("Confirm Password"),
        _buildInputField(confirmPasswordController, isPassword: true),
        const SizedBox(height: 60),
        _buildSignUpButton(),
        const SizedBox(height: 20),
        _buildAlreadyHaveAccount(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: c1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: c1),
        ),
        suffixIcon: isPassword
            ? Icon(Icons.remove_red_eye, color: Colors.grey)
            : Icon(Icons.done, color: Colors.grey),
      ),
      obscureText: isPassword,
      cursorColor: c1,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Already have an Account? Click Here",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildNewAccount() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: c1,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "OR SIGN UP",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        // debugPrint("Email : ${emailController.text}");
        // debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: c1,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "SIGN UP",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

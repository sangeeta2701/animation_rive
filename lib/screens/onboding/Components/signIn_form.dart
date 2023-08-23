import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("Email",style: TextStyle(
        color: Colors.black54
      ),),
      Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 16),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/email.svg"),
            )
          ),
        ),
      ),
      Text("Password",style: TextStyle(
        color: Colors.black54
      ),),
      Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 16),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/password.svg"),
            )
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 24),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF77D8E),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
            ),
          ),
          onPressed: (){}, icon: Icon(Icons.arrow_forward,
          color: Color(0xFFFE0037),), label: Text("Sign In"),),
      ),
    ],),);
  }
}
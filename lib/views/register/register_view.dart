import 'package:projekt_1_ekrany_logowania/views/login/login_view.dart';
import 'package:projekt_1_ekrany_logowania/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../register/register_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(MyImages.elipsa,)
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 59, left: 12,),
                          child: Row(
                            children: [
                              Align(
                                child: Image.asset(MyImages.arrow,)
                              ),
                              Align(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginView())
                                    );
                                  },
                                  child: Text (
                                    'Back',
                                     style: TextStyle(
                                       color: MyColors.purpleColor,
                                     ),
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 276),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: _signUpText('Sign Up')
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: BasicTextFormField(
                    icon: Icons.person_outline,
                    marker: 'Full Name'),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: BasicTextFormField(
                    icon: Icons.local_post_office_outlined,
                    marker: 'Email'),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: BasicTextFormField(
                    icon: Icons.lock_outline,
                    iconButton: Icons.remove_red_eye_outlined,
                    marker: 'Password',
                    isPassword: true,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: BasicTextFormField(
                    icon: Icons.lock_outline,
                    iconButton: Icons.remove_red_eye_outlined,
                    marker: 'Confirm Password',
                    isPassword: true,
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.signInColor,
                      textStyle: const TextStyle(fontSize: 17),
                      minimumSize: const Size(390, 50)
                  ),
                  onPressed: () {
                  Navigator.pop(context);
                },
                  child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: MyColors.whiteColor,
                      )
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 96, right: 94,),
                child: Row(
                    children: [
                      Text(
                          'Already have an account ?',
                          style: TextStyle(
                            color: MyColors.purpleColor,
                          ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute (builder: (context) => const LoginView()),
                          );
                        },
                        child: Text(
                            ' Sign In',
                            style: TextStyle(
                              color: MyColors.purpleColor,
                              fontWeight: FontWeight.w900,
                            ),
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _signUpText(String text) {
  return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor
      ),
  );
}











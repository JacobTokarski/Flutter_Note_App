import 'package:projekt_1_ekrany_logowania/views/home/home_view.dart';
import 'package:projekt_1_ekrany_logowania/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String correctEmail = 'k.tokarski2003@o2.pl';
  final String correctPassword = '12345678';

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    }
  }

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  void login() async {
    if (usernameController.text == correctEmail &&
        passwordController.text == correctPassword) {
      await _saveLoginStatus(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Login or Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(MyImages.logo),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 21),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _singInText('Sign in'),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 46),
                  child: BasicTextFormField(
                    icon: Icons.person_outline,
                    marker: 'Email or User Name',
                    controller: usernameController,
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(top:40 ,left: 20, right: 20,),
                  child: BasicTextFormField(
                    icon: Icons.lock_outline,
                    iconButton: Icons.remove_red_eye_outlined,
                    marker: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top:40, right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.purpleColor,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:40, left: 20, right:20,),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.signInColor,
                    minimumSize: const Size(390, 50),
                  ),
                  onPressed: login,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 170, right: 100, left: 100,),
                child: Row(
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                          color: MyColors.purpleColor,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute (builder: (context) => const RegisterView()),
                          );
                        },

                        child: Text(
                          ' Sign Up!',
                          style: TextStyle(
                            color: MyColors.purpleColor,
                            fontWeight: FontWeight.w800,
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

Widget _singInText(String text) {
  return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor
      )
  );
}

import 'package:flutter/material.dart';
import 'package:sole_quest/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_updateFocus);
    _passwordFocusNode.addListener(_updateFocus);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_updateFocus);
    _passwordFocusNode.removeListener(_updateFocus);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _updateFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add App Logo Image
                Image.asset(
                  'assets/images/logo/logo.png',
                  width: 150,
                  height: 150,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppConstantsColor.darkTextColor,
                  ),
                ),

                const SizedBox(height: 50),
                TextFormField(
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: _emailFocusNode.hasFocus
                          ? AppConstantsColor.materialButtonColor
                          : Colors.black87,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: _emailFocusNode.hasFocus
                          ? AppConstantsColor.materialButtonColor
                          : Colors.black87,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: AppConstantsColor.materialButtonColor,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus
                          ? AppConstantsColor.materialButtonColor
                          : Colors.black87,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: _passwordFocusNode.hasFocus
                          ? AppConstantsColor.materialButtonColor
                          : Colors.black87,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: AppConstantsColor.materialButtonColor,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                materialButton(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to the register screen
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: AppConstantsColor.materialButtonColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget materialButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Pass the itemsOnBag to the checkout screen
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }
}

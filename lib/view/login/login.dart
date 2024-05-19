import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sole_quest/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _showPassword = false;

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

  Future<void> Login(String email, String password) async {
    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(context, e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: SafeArea(
        child: Center(
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
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Colors.black87,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: _emailFocusNode.hasFocus
                            ? AppConstantsColor.materialButtonColor
                            : Colors.black87,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.red,
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
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () => {
                                setState(() {
                                  _showPassword = !_showPassword;
                                })
                              },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          color: Colors.black87),
                      labelStyle: const TextStyle(
                        color: Colors.black87,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: _passwordFocusNode.hasFocus
                            ? AppConstantsColor.materialButtonColor
                            : Colors.black87,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    obscureText: _showPassword,
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
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          'Signup',
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
            Login(
              _emailController.text,
              _passwordController.text,
            );
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

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sole_quest/utils/constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  // Show Password Boolean
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(_updateFocus);
    _emailFocusNode.addListener(_updateFocus);
    _countryFocusNode.addListener(_updateFocus);
    _cityFocusNode.addListener(_updateFocus);
    _phoneNumberFocusNode.addListener(_updateFocus);
    _passwordFocusNode.addListener(_updateFocus);
    _confirmPasswordFocusNode.addListener(_updateFocus);
  }

  @override
  void dispose() {
    _usernameFocusNode.removeListener(_updateFocus);
    _emailFocusNode.removeListener(_updateFocus);
    _countryFocusNode.removeListener(_updateFocus);
    _cityFocusNode.removeListener(_updateFocus);
    _phoneNumberFocusNode.removeListener(_updateFocus);
    _passwordFocusNode.removeListener(_updateFocus);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _updateFocus() {
    setState(() {});
  }

  Future<void> signUp(String username, String email, String city,
      String password, String confirmPassword) async {
    if (password != confirmPassword) {
      _showErrorDialog(context, 'Passwords do not match');
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'email': email,
          'city': city,
          'password': password,
        });
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showErrorDialog(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          _showErrorDialog(
              context, 'The account already exists for that email.');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo/logo.png',
                      width: 150,
                      height: 150,
                    ),
                    const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        labelText: 'Username',
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
                          Icons.person,
                          color: _usernameFocusNode.hasFocus
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
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
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
                    // TextFormField(
                    //   controller: _countryController,
                    //   focusNode: _countryFocusNode,
                    //   cursorColor: Colors.black87,
                    //   decoration: InputDecoration(
                    //     labelText: 'Country',
                    //     labelStyle: const TextStyle(
                    //       color: Colors.black87,
                    //     ),
                    //     focusedBorder: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       borderSide: BorderSide(
                    //         color: Colors.black87,
                    //       ),
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.flag,
                    //       color: _countryFocusNode.hasFocus
                    //           ? AppConstantsColor.materialButtonColor
                    //           : Colors.black87,
                    //     ),
                    //     border: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your country';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(height: 20),
                    TextFormField(
                      controller: _cityController,
                      focusNode: _cityFocusNode,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        labelText: 'City',
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
                          Icons.location_city,
                          color: _cityFocusNode.hasFocus
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
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // TextFormField(
                    //   controller: _phoneNumberController,
                    //   focusNode: _phoneNumberFocusNode,
                    //   cursorColor: Colors.black87,
                    //   decoration: InputDecoration(
                    //     labelText: 'Phone Number',
                    //     labelStyle: const TextStyle(
                    //       color: Colors.black87,
                    //     ),
                    //     focusedBorder: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       borderSide: BorderSide(
                    //         color: Colors.black87,
                    //       ),
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.phone,
                    //       color: _phoneNumberFocusNode.hasFocus
                    //           ? AppConstantsColor.materialButtonColor
                    //           : Colors.black87,
                    //     ),
                    //     border: const OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your phone number';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          color: Colors.black87,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => {
                                  setState(() {
                                    _showConfirmPassword =
                                        !_showConfirmPassword;
                                  })
                                },
                            icon: Icon(
                              _showConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            color: Colors.black87),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _confirmPasswordFocusNode.hasFocus
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
                      obscureText: _showConfirmPassword,
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
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            // Navigate to the register screen
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Login',
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
            signUp(
                _usernameController.text,
                _emailController.text,
                _cityController.text,
                _passwordController.text,
                _confirmPasswordController.text);
          }
        },
        child: const Text(
          "Create Account",
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

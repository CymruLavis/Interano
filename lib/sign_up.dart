import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'models/colourSwatch.dart';
import 'package:test/account_validation.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String pageName = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: pageName,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(pageName),
          backgroundColor: Colours().getAppBarColor(),
        ),
        body: const SignupWidget(),
      ),
    );
  }
}

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => SignUpWidgets();
}

class SignUpWidgets extends State<SignupWidget> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  // TextEditingController userName = TextEditingController();
  final password = TextEditingController();
  final passwordValidate = TextEditingController();
  final email = TextEditingController();
  var phoneNum = TextEditingController();
  final primaryColour = Colours();

  // PhoneNumber number = PhoneNumber();
  DateTime dob = DateTime.now();

  bool cbTandC = false;
  bool cbNotifications = false;
  bool isVisible = false;

  int flex1 = 3;
  int flex2 = 6;
  String message = "Fill in all fields";
  String initialCountry = 'CAN';
  String dropDown = "Male";

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return primaryColour.getPrimarySwatch();
    }

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: flex1,
                    child: const Text('First Name'),
                  ),
                  Expanded(
                      flex: flex2,
                      child: TextField(
                        controller: firstName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name',
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Last Name'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: lastName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Email'),
                ),
                Expanded(
                    flex: flex2,
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      onChanged: (value) {
                        if (emailValidation(email.text) == false) {
                          setState(() {
                            message = "Invalid email";
                            isVisible = true;
                          });
                        } else {
                          setState(() {
                            isVisible = false;
                          });
                        }
                      },
                    ))
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Phone Number'),
                ),
                Expanded(
                    flex: flex2,
                    child: TextField(
                      controller: phoneNum,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                      onChanged: (value) {
                        if (double.tryParse(phoneNum.text) == null) {
                          setState(() {
                            message = "Invalid phone number";
                            isVisible = true;
                          });
                        } else {
                          if (phoneNumberValidation(phoneNum.text) == false) {
                            setState(() {
                              message = "Invalid phone number length";
                              isVisible = true;
                            });
                          } else {
                            setState(() {
                              isVisible = false;
                            });
                          }
                        }
                      },
                    ))
              ]),
            ),

            Row(
              children: <Widget>[
                Expanded(flex: 3, child: const Text('Category: ')),
                Expanded(
                  flex: 6,
                  child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      value: dropDown,
                      items: [
                        DropdownMenuItem(child: Text("Male"), value: "Male"),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Other"),
                          value: "Other",
                        )
                      ],
                      onChanged: (value) {
                        if (value is String) {
                          setState(() {
                            dropDown = value;
                          });
                        }
                      },
                    ),
                  )),
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Date of Birth'),
                ),
                IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: dob,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colours()
                                    .getPrimarySwatch(), // <-- SEE HERE
                                // onPrimary: Colors.redAccent, // <-- SEE HERE
                                onSurface: Colours()
                                    .getPrimarySwatch(), // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.red, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      ).then((value) {
                        setState(() {
                          dob = value!;
                        });
                        if (ageValidation(dob) == false) {
                          setState(() {
                            message =
                                "You are too young to use this application";
                            isVisible = true;
                          });
                        } else {
                          setState(() {
                            isVisible = false;
                          });
                        }
                      });
                    }),
                Expanded(
                  flex: flex2,
                  child: Text(DateFormat('yyyy-MM-dd')
                      .format(dob as DateTime)
                      .toString()),
                ),
              ]),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            //   child: Row(children: <Widget>[
            //     Expanded(
            //       flex: flex1,
            //       child: const Text('Username'),
            //     ),
            //     Expanded(
            //       flex: flex2,
            //       child: TextField(
            //         controller: userName,
            //         decoration: const InputDecoration(
            //           border: OutlineInputBorder(),
            //           labelText: 'Username',
            //         ),
            //       ),
            //     )
            //   ]),
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Password'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      if (passwordValidation(password.text) == false) {
                        setState(() {
                          message =
                              "Password does not meet security requirements. \nPlease include uppercase, lowercase, \nspecial characters, and numbers.";
                          isVisible = true;
                        });
                      } else {
                        setState(() {
                          isVisible = false;
                        });
                      }
                    },
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Confirm Password'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: passwordValidate,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                    onChanged: (value) {
                      if (password.text != passwordValidate.text) {
                        setState(() {
                          message = "Entered passwords do not match";
                          isVisible = true;
                        });
                      } else {
                        isVisible = false;
                      }
                    },
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    child: Text(
                      message,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.red, fontStyle: FontStyle.italic),
                    ),
                    visible: isVisible,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Agree to ',
                      style: new TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: "terms and conditions",
                        style: TextStyle(color: Colours().getTextButtonColor()),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Uri url =
                                Uri(scheme: "https", host: "www.youtube.com");
                            if (!await launchUrl(url,
                                mode: LaunchMode.externalApplication)) {
                              throw showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Launch Error"),
                                        content: Text(
                                            "Error accessing terms and conditions"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Ok"))
                                        ],
                                      )); //pop up menu
                            }
                          })
                  ])),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: cbTandC,
                    onChanged: (bool? value) {
                      setState(() {
                        cbTandC = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Agree to notifications'),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: cbNotifications,
                    onChanged: (bool? value) {
                      setState(() {
                        cbNotifications = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColour.getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      child: const Text('Back'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: const Text("Create Account"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColour.getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      onPressed: (cbTandC && cbNotifications)
                          ? () {
                              if (textValidations(
                                      firstName.text,
                                      lastName.text,
                                      email.text,
                                      password.text,
                                      passwordValidate.text) ==
                                  false) {
                                setState(() {
                                  message = "Not all fields are completed";
                                  isVisible = true;
                                });
                              } else {
                                //Send random code to phone number
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountValidation()),
                                );
                              }
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

bool ageValidation(DateTime date) {
  bool flag = false;
  final now = DateTime.now();
  final dt2 = DateTime(now.year - 15, now.month, now.day);
  if (date.compareTo(dt2) < 0) {
    flag = true;
  }
  return flag;
}

bool passwordValidation(String password) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  if (!regex.hasMatch(password)) {
    return false;
  } else {
    return true;
  }
}

bool emailValidation(String email) {
  final bool flag = EmailValidator.validate(email);
  return flag;
}

bool phoneNumberValidation(String num) {
  bool flag = false;
  if (num.length == 10) {
    flag = true;
  }
  return flag;
}

bool textValidations(
    String fName, String lName, String email, String pass, String passVal) {
  bool flag = false;
  if (fName.isNotEmpty ||
      lName.isNotEmpty ||
      email.isNotEmpty ||
      pass.isNotEmpty ||
      passVal.isNotEmpty) {
    flag = true;
  }
  return flag;
}

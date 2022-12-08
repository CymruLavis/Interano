import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'models/colourSwatch.dart';
import 'package:test/account_validation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';

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
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordValidate = TextEditingController();
  TextEditingController email = TextEditingController();
  DateTime dob = DateTime.now();
  bool cbTandC = false;
  bool cbNotifications = false;
  PhoneNumber number = PhoneNumber(isoCode: 'CAN');
  final TextEditingController phoneNum = TextEditingController();
  String initialCountry = 'CAN';
  int flex1 = 3;
  int flex2 = 6;
  final primaryColour = Colours();

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
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                    ))
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: InternationalPhoneNumberInput(
                // ignoreBlank: false,
                // autoValidateMode: AutovalidateMode.disabled,
                // selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: PhoneNumber(isoCode: 'CAN'), // number
                // textFieldController: phoneNum,
                // formatInput: false,
                // keyboardType: TextInputType.numberWithOptions(
                //     signed: true, decimal: true),
                // inputBorder: OutlineInputBorder(),
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                // onInputValidated: (bool value) {
                //   print(value);
                // },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                // onSaved: (PhoneNumber number) {
                //   print('On Saved: $number');
                // },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: ElevatedButton(
                      child: const Text("Date of Birth"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColour.getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: dob,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100))
                            .then((value) {
                          setState(() {
                            dob = value!;
                          });
                        });

                        // setState(() {
                        //   dob = DateTime.now();
                        // });
                      } //_selectDate(context),
                      ),
                ),
                Expanded(
                  flex: flex2,
                  child: Text(DateFormat('yyyy-MM-dd')
                      .format(dob as DateTime)
                      .toString()),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Username'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: userName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Password'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(
                  flex: flex1,
                  child: const Text('Confirm Password'),
                ),
                Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: passwordValidate,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Agree to terms and conditions'),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountValidation()),
                        );
                        //Send random code to phone number
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

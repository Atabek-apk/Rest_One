import 'package:rest_one/Models/register_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../providers/login_provider.dart';

class RegistrPage extends StatefulWidget {
  const RegistrPage({Key? key}) : super(key: key);

  @override
  State<RegistrPage> createState() => _RegistrPageState();
}

class _RegistrPageState extends State<RegistrPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool validation = false;
  void formValidation() {
    if (_formKey.currentState!.validate()) {
      validation = true;
    } else {
      validation = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.orange[600]!,
                Colors.orange[400]!,
                Colors.orange[200]!
              ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Täç coffee',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hoş geldiňiz !',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: firstName,
                                validator: (firstName) {
                                  if (firstName!.isEmpty) {
                                    return 'Adyňyzy giriziň !';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange.shade500,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hintText: 'Adyňyz',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.orange.shade300,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: lastName,
                                validator: (lastName) {
                                  if (lastName!.isEmpty) {
                                    return 'Familiýaňyzy giriziň !';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange.shade500,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hintText: 'Familiýaňyz',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.orange.shade300,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: address,
                                validator: (address) {
                                  if (address!.isEmpty) {
                                    return 'Salgyňyzy giriziň !';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange.shade500,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hintText: 'Salgyňyz',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.orange.shade300,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: phoneNum,
                                validator: (phoneNum) {
                                  if (phoneNum!.isEmpty ||
                                      phoneNum.length < 8) {
                                    return 'Ulanyjy nomeryňyzy giriziň  !';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange.shade500,
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 0,
                                      minHeight: 0,
                                    ),
                                    prefixIcon: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 3),
                                      child: Text(
                                        '+993',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.orange.shade500,
                                            fontSize: 18.5),
                                      ),
                                    ),
                                    hintText: '61123456',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.orange.shade300,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: password,
                                validator: (password) {
                                  if (password!.isEmpty ||
                                      password.length < 6) {
                                    return 'Açar sözi 6+ giriziň !';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: authNotifier.isObsecure,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange.shade500,
                                ),
                                textAlign: TextAlign.left,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          authNotifier.isObsecure =
                                              !authNotifier.isObsecure;
                                        },
                                        child: authNotifier.isObsecure
                                            ? Icon(
                                                Icons.visibility,
                                                color: Colors.orangeAccent,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: Colors.orangeAccent,
                                              )),
                                    hintText: 'Açar sözi',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.orange.shade300,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        ZoomTapAnimation(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              formValidation();
                              if (validation) {
                                debugPrint("form validated");
                                RegisterModel model = RegisterModel(
                                    firstName: firstName.text,
                                    lastName: lastName.text,
                                    address: address.text,
                                    phoneNumber: phoneNum.text,
                                    password: password.text);
                                authNotifier
                                    .registerUser(model)
                                    .then((response) {
                                  if (response == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  } else {
                                    debugPrint("Failed to sign up");
                                  }
                                });
                              } else {
                                debugPrint("form not validated");
                              }
                            },
                            child: Text(
                              'Döretmek',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Eger akaunt bar bolsa ?',
                              style: TextStyle(
                                  color: Colors.orangeAccent.shade100,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                                // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                              },
                              child: Text(
                                'Giriş',
                                style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:rest_one/Models/login_response_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNum = TextEditingController();
  TextEditingController password = TextEditingController();

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
    // Future.delayed(Duration(seconds: 90), (){
    //   setState(() {
    //     authNotifier.logout();
    //   });
    // });
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
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/tr.png',
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Täç coffee',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Italic',
                                  ),
                                ),
                                Text(
                                  'W e l c o m e',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontFamily: 'BoldI'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(55.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              controller: phoneNum,
                              validator: (phoneNum) {
                                if (phoneNum!.isEmpty) {
                                  return 'Ulanyjy nomeryňyzy giriziň !';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange.shade500,
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange.shade600),
                                    borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange.shade200),
                                    borderRadius: BorderRadius.circular(20)),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                prefixIcon: Container(
                                    margin: EdgeInsets.only(left: 10, right: 3),
                                    child: Text(
                                      '+993',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.orange.shade500,
                                          fontSize: 18.5),
                                    )),
                                hintText: '61123456',
                                hintStyle: TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.orange.shade300,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: password,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'Açar sözüňizi giriziň !';
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
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orange.shade200),
                                      borderRadius: BorderRadius.circular(20)),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        authNotifier.isObsecure =
                                            !authNotifier.isObsecure;
                                      },
                                      child: authNotifier.isObsecure
                                          ? Icon(Icons.visibility,
                                              color: Colors.orangeAccent)
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
                        SizedBox(height: 40),
                        ZoomTapAnimation(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(280, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              formValidation();
                              if (validation == true) {
                                LoginModel model = LoginModel(
                                    phoneNumber: phoneNum.text,
                                    password: password.text);
                                authNotifier.userLogin(model).then((response) {
                                  if (response == true) {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                BottomPage()));
                                  } else {
                                    debugPrint("Failed to login");
                                  }
                                });
                              } else {
                                debugPrint("form not validated");
                              }
                              // Navigator.pop(context);
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                            },
                            child: Text(
                              'Giriş',
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
                              'Akaunt ýok bolsa ?',
                              style: TextStyle(
                                  color: Colors.orangeAccent.shade100,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => RegistrPage()));
                              },
                              child: Text(
                                'Döretmek',
                                style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 300,
                            )
                          ],
                        ),
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

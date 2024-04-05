import 'package:rest_one/Models/selected_card_model.dart';
import 'package:rest_one/Models/order_post_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

int size = 17;

class _CheckOutState extends State<CheckOut> {
  TextEditingController address = TextEditingController();
  TextEditingController phonyNumber = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController bellikisleg = TextEditingController();

  String userNymber = "";
  String userFirstName = "";
  String userAddress = "";

  putText() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userNymber = prefs.getString('userPhNumber')!;
    userFirstName = prefs.getString('userFirstName')!;
    userAddress = prefs.getString('userAddress')!;
    phonyNumber.text = userNymber;
    firstName.text = userFirstName;
    address.text = userAddress;
  }

  @override
  void initState() {
    putText();
    super.initState();
  }

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
    var chekOutNotifier = Provider.of<LoginNotifier>(context);
    var cardNotifier = Provider.of<CartProvider>(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Maglumatlar',
            style: TextStyle(
                color: Colors.black54, fontSize: 25, fontFamily: 'Bold'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 5),
                  child: TextFormField(
                    controller: address,
                    validator: (address) {
                      if (address!.isEmpty && address.length < 3) {
                        return 'Salgyňyzy giriziň !';
                      } else {
                        return null;
                      }
                    },
                    minLines: 1,
                    maxLines: 2,
                    cursorColor: Colors.orange.shade500,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        color: Colors.orange.shade600,
                        fontSize: size.toDouble()),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade600),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Meselem: Aşgabat şäheri Parahat 4',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: size.toDouble(),
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.orange.shade300,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  child: TextFormField(
                    controller: phonyNumber,
                    validator: (phonyNumber) {
                      if (phonyNumber!.isEmpty || phonyNumber.length < 7) {
                        return '66123456';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.orange.shade500,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        color: Colors.orange.shade600,
                        fontSize: size.toDouble()),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade600),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Meselem: +99366123456',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: size.toDouble(),
                      ),
                      filled: true,
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
                                color: Colors.orange.shade500, fontSize: 17.5),
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.orange.shade300,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  child: TextFormField(
                    controller: firstName,
                    validator: (firstName) {
                      if (firstName!.isEmpty) {
                        return 'Meselem: Maksat';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.orange.shade500,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        color: Colors.orange.shade600,
                        fontSize: size.toDouble()),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade600),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Meselem: Aman',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                  child: TextFormField(
                    controller: bellikisleg,
                    minLines: 1,
                    maxLines: 3,
                    cursorColor: Colors.orange.shade500,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        color: Colors.orange.shade600,
                        fontSize: size.toDouble()),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade600),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      label: Text('Aýratyn bellikler we islegler ?'),
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: size.toDouble(),
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.orange.shade300,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                    color: Colors.orange.shade700,
                    thickness: 2,
                    endIndent: 30,
                    indent: 30,
                    height: 40),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harytlar ${context.watch<CartProvider>().cartProductTotal} sany",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.grey,
                            fontFamily: 'Bold'),
                      ),
                      Text(
                        "${context.watch<CartProvider>().cartSubTotal} TMT",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.black87,
                            fontFamily: 'Bold'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Eltip berme hyzmaty",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.black38,
                            fontFamily: 'Bold'),
                      ),
                      Text(
                        "${context.watch<CartProvider>().shippingCharge} \TMT",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.black87,
                            fontFamily: 'Bold'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jemi",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.grey,
                            fontFamily: 'Bold'),
                      ),
                      Text(
                        "${context.watch<CartProvider>().cartTotal} TMT",
                        style: TextStyle(
                            fontSize: size.toDouble(),
                            color: Colors.black87,
                            fontFamily: 'Bold'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(300, 60),
                    ),
                    onPressed: () async {
                      formValidation();
                      if (validation == true) {
                        List<OrderItemDto> OrderList = [];
                        int umumy = cardNotifier.shoppingCart.length;
                        print("Sanyk ${umumy}");
                        List.generate(
                          umumy,
                          (index) {
                            return OrderList.add(
                              OrderItemDto(
                                  productId: cardNotifier
                                      .shoppingCart[index].product.id,
                                  quantity: cardNotifier
                                      .shoppingCart[index].quantity),
                            );
                          },
                        );
                        print("Sikl dashy : ${OrderList}");
                        print("Sikl dashy : ${OrderList.toString()}");
                        OrderModel model = OrderModel(
                            phoneNumber: phonyNumber.text,
                            address: address.text,
                            orderItemDto: OrderList);
                        chekOutNotifier.orderPush(model).then(
                          (orderResponse) {
                            if (orderResponse == true) {
                              context.read<CartProvider>().clearItem();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      elevation: 0,
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Colors.transparent,
                                      behavior: SnackBarBehavior.floating,
                                      content: SnakBarEveryTime(
                                          titleee: "Sargyt kabul edildi")));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopPage(),
                                  ),
                                  (route) => false);
                            } else {
                              debugPrint("Failed to push order");
                            }
                          },
                        );
                      } else {
                        debugPrint("Order not validated");
                      }
                    },
                    child: Text(
                      'Sargydy ugrat',
                      style: TextStyle(
                          fontSize: size.toDouble(), fontFamily: 'Bold'),
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

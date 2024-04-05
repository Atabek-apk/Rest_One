import 'package:rest_one/Models/userId_orders_response_model.dart';
import 'package:rest_one/Pages/screens/Settings/Orders_Page/order_product_details.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/service/get_orders_ byUserId_service.dart';

import '../../../../providers/login_provider.dart';
import '../User_Profil_Pages/non_user_profil.dart';

class UserOrdersPage extends StatefulWidget {
  const UserOrdersPage({Key? key}) : super(key: key);

  @override
  State<UserOrdersPage> createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage> {
  Future<List<UserIdResponseOrders>>? _orders;

  @override
  void initState() {
    _orders = TachServiceGetOrdersById().getUserIDOrders();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    double cardFontSize = 17;
    print('eehhee : ${menuPageController.orderproductList.isEmpty}');
    print('eehhee : ${menuPageController.orderproductList.isNotEmpty}');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        elevation: 2,
        title: Text(
          'Sargytlarym',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<UserIdResponseOrders>>(
        future: _orders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    authNotifier.logout();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NonUserProfil()));
                  },
                  child: Text(
                    'Täzeden ulgama giriň',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            } else {
              final product = snapshot.data;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: product!.length,
                  itemBuilder: ((context, index) {
                    print(" hhhhhhhhhh : ${product.length}");
                    var order = product[index];
                    List orderId = List.generate(order.orderItemDto.length,
                        (index) => order.orderItemDto[index].productId);
                    return InkWell(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var orID = order.id.toString();
                        prefs.setInt('prodId', order.id);
                        var b = prefs.getInt('prodId');
                        print("Print :   ${b}");
                        print("Print :   ${b.toString()}");
                        print("Printer :   ${order.id.toString()}");
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => OrderProductDetails(
                              OrderId: order.id,
                              PhonoNumber: order.phoneNumber,
                              Address: order.address,
                              CreateOPrder: order.createdAt,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                        child: Card(
                          color: Colors.orange.shade300,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                            ),
                                          ),
                                          padding: EdgeInsets.all(5.0),
                                          child: Container(
                                            child: Text(
                                              'Sargydyň belgisi',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: cardFontSize),
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                            ),
                                          ),
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            order.id.toString(),
                                            style: TextStyle(
                                                color: Colors.orange.shade500,
                                                fontSize: cardFontSize),
                                          ),
                                        )),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.orange.shade500,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Nomer',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: cardFontSize),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "+993${order.phoneNumber}",
                                        style: TextStyle(
                                            color: Colors.orange.shade500,
                                            fontSize: cardFontSize),
                                      ),
                                    )),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.orange.shade500,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: cardFontSize),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        order.address,
                                        style: TextStyle(
                                            color: Colors.orange.shade500,
                                            fontSize: cardFontSize),
                                      ),
                                    )),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.orange.shade500,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Sargydyň wagty',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: cardFontSize),
                                      ),
                                    )),
                                    Expanded(
                                      child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          order.createdAt
                                              .toString()
                                              .substring(0, 16),
                                          style: TextStyle(
                                              color: Colors.orange.shade500,
                                              fontSize: cardFontSize),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.orange.shade500,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5))),
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          'Sargydyň ýagdaýy',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: cardFontSize),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(5.0),
                                      child: order.orderStatusId == 1
                                          ? Text(
                                              "Kabul edildi",
                                              style: TextStyle(
                                                  color: Colors.green.shade500,
                                                  fontSize: cardFontSize),
                                            )
                                          : Text("Sargyt ýok",
                                              style: TextStyle(
                                                  color: Colors.orange.shade500,
                                                  fontSize: cardFontSize),
                                            ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text("Nomer :${product.phoneNumber}"),
                          //   trailing: Text(
                          //       "Address :${product.address}\nHarytlaryň sany :${product.orderItemDto[0].quantity}"),
                          //   subtitle: Text("Sargydyň wagty :${product.createdAt.toString().substring(0, 10)}"),
                          // ),
                        ),
                      ),
                      // child: CachedNetworkImage(
                      //   imageUrl: "${baseurl}admindata/product/product/${product.id}",
                      //   imageBuilder: (context, imageProvider) => Material(
                      //     elevation: 8,
                      //     borderRadius: BorderRadius.circular(15),
                      //     child: Column(
                      //       children: [
                      //         Expanded(
                      //           flex: 6,
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.grey,
                      //                 borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(15),
                      //                   topRight: Radius.circular(15),
                      //                   bottomLeft: Radius.circular(0),
                      //                   bottomRight: Radius.circular(0),
                      //                 ),
                      //                 image: DecorationImage(
                      //                     image: imageProvider, fit: BoxFit.cover)),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           flex: 3,
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.orangeAccent.shade200,
                      //                 borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(0),
                      //                   topRight: Radius.circular(0),
                      //                   bottomLeft: Radius.circular(15),
                      //                   bottomRight: Radius.circular(15),
                      //                 )),
                      //             alignment: Alignment.bottomCenter,
                      //             child: Column(
                      //               children: [
                      //                 Padding(
                      //                   padding: EdgeInsets.only(top: 6),
                      //                   child: Row(
                      //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                     children: [
                      //                       Text(product.phoneNumber),
                      //                       Text('${product.firstName} \TMT'),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsets.only(top: 6),
                      //                   child: Row(
                      //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                     children: [
                      //                       ElevatedButton(
                      //                           style: ElevatedButton.styleFrom(
                      //                               minimumSize: Size(70, 42),
                      //                               shape: RoundedRectangleBorder(
                      //                                   borderRadius:
                      //                                   BorderRadius.circular(15))),
                      //                           onPressed: () {
                      //                             // if(authNotifier.loggeIn == true){
                      //                             //   provider.pressButton(product);
                      //                             //   provider.isExist(product) ? ScaffoldMessenger.of(context).showSnackBar(
                      //                             //       SnackBar(
                      //                             //           elevation: 0,
                      //                             //           duration: Duration(milliseconds: 500),
                      //                             //           backgroundColor: Colors.transparent,
                      //                             //           behavior: SnackBarBehavior.floating,
                      //                             //           content: SnakBarEveryTime(titleee: "${product.name} halanlaryma goşuldy"))
                      //                             //   ) : ScaffoldMessenger.of(context).showSnackBar(
                      //                             //       SnackBar(
                      //                             //           elevation: 0,
                      //                             //           duration: Duration(milliseconds: 500),
                      //                             //           backgroundColor: Colors.transparent,
                      //                             //           behavior: SnackBarBehavior.floating,
                      //                             //           content: SnakBarEveryTime(titleee: "${product.name} halanlarymdan aýryldy"))
                      //                             //   );
                      //                             // } else {
                      //                             //   Navigator.push(
                      //                             //       context,
                      //                             //       MaterialPageRoute(
                      //                             //           builder: (context) =>
                      //                             //               LoginPage()));
                      //                             // }
                      //                           },
                      //                         child: Text('Web'),
                      //                           // child: provider.isExist(product)
                      //                           //     ? Icon(
                      //                           //   Icons.favorite,
                      //                           //   color: Colors.red.shade600,
                      //                           // )
                      //                           //     : Icon(Icons.favorite_border),
                      //                       ),
                      //                       ElevatedButton(
                      //                           style: ElevatedButton.styleFrom(
                      //                               minimumSize: Size(80, 42),
                      //                               shape: RoundedRectangleBorder(
                      //                                   borderRadius:
                      //                                   BorderRadius.circular(15))),
                      //                           onPressed: () {
                      //                             // if(authNotifier.loggeIn == true){
                      //                             //   print('product_card  ....');
                      //                             //   context
                      //                             //       .read<CartProvider>()
                      //                             //       .addToCart(product);
                      //                             //   ScaffoldMessenger.of(context).showSnackBar(
                      //                             //       SnackBar(
                      //                             //           elevation: 0,
                      //                             //           duration: Duration(milliseconds: 500),
                      //                             //           backgroundColor: Colors.transparent,
                      //                             //           behavior: SnackBarBehavior.floating,
                      //                             //           content: SnakBarEveryTime(titleee: "${product.name} sargyda goşuldy"))
                      //                             //   );
                      //                             // }else{
                      //                             //   Navigator.push(
                      //                             //       context,
                      //                             //       MaterialPageRoute(
                      //                             //           builder: (context) =>
                      //                             //               LoginPage()));
                      //                             // }
                      //                           },
                      //                           child: Icon(Icons.shopping_cart))
                      //                     ],
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //             //
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   placeholder: (context, url) => Shimmer.fromColors(
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: Colors.brown, borderRadius: BorderRadius.circular(15)),
                      //       ),
                      //       baseColor: Colors.grey.shade300,
                      //       highlightColor: Colors.white),
                      //   errorWidget: (context, url, error) => Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                      //     child: Center(
                      //       child: Icon(
                      //         Icons.error_outline_outlined,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    );
                  }));
            }
          }
        },
      ),
      // body: Obx(() {
      //   if (menuPageController.orderproductList.isNotEmpty) {
      //     return OrderProduct(product: menuPageController.orderproductList);
      //   } else {
      //     return Center(
      //       child: Text(
      //         'Entäk sargyt edilmedik',
      //         style: TextStyle(
      //             color: Colors.orange.shade300,
      //             fontSize: 28,
      //             fontFamily: 'Bold'),
      //       ),
      //     );
      //   }
      // }),
    );
  }
}

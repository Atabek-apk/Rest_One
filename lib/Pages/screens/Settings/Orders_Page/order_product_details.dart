import 'package:rest_one/Models/productId_product_response_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';
import 'package:rest_one/service/get_product_by_productId.dart';

import '../User_Profil_Pages/non_user_profil.dart';

class OrderProductDetails extends StatefulWidget {
  final int OrderId;
  final String PhonoNumber;
  final String Address;
  final DateTime CreateOPrder;
  const OrderProductDetails(
      {Key? key,
      required this.OrderId,
      required this.PhonoNumber,
      required this.Address,
      required this.CreateOPrder})
      : super(key: key);

  @override
  State<OrderProductDetails> createState() => _OrderProductDetailsState();
}

class _OrderProductDetailsState extends State<OrderProductDetails> {
  Future<List<GetproductbyproducId>>? _products;

  @override
  void initState() {
    _products = TachServiceGetProductsByProductId().getOrdersProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    double cardFontSize = 17;
    double ordercardFontSize = 16;
    Size size = MediaQuery.of(context).size;
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
          'Sargydyň belgisi: ${widget.OrderId}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder<List<GetproductbyproducId>>(
          future: _products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.5),
                alignment: Alignment.center,
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                                          widget.OrderId.toString(),
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
                                      "+993${widget.PhonoNumber}",
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
                                      widget.Address,
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
                                        widget.CreateOPrder.toString()
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
                                              bottomLeft: Radius.circular(5))),
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Harytlaryň sany',
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
                                    child: Text(
                                      product!.length.toString(),
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
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: product!.length,
                        itemBuilder: ((context, index) {
                          print(" hhhhhhhhhh : ${product.length}");
                          var order = product[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.orange.shade300,
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade100,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        width: size.width * 0.20,
                                        height: size.height * 0.12,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/images/splash/f.png',
                                            image: "${baseurl}admindata/product/product/${order.imagePath}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                          height: 90,
                                          padding: EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Kofeniň ady :${order.name}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            ordercardFontSize),
                                                  ),
                                                  FittedBox(
                                                    child: Container(
                                                      height: 40,
                                                      width: 250,
                                                      child: Text(
                                                        "Kofe barada : Bu kofe Täç coffee-de ýörite taýýarlanýar !!!",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                ordercardFontSize),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Bahasy :${order.reqularPrice}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        ordercardFontSize),
                                              ),
                                            ],
                                          ),
                                        )),
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
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}

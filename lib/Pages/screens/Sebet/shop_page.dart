import 'package:rest_one/constants/file_assistans.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        elevation: 0,
        title:
            Text("Sebet", style: TextStyle(fontSize: 25, fontFamily: 'Regular', color: Colors.white )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.005,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meniň sebedim",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: 'Bold'),
                            ),
                            Consumer<CartProvider>(
                              builder: (context, value, child) => Column(
                                children: value.shoppingCart
                                    .map(
                                      (cartItem) => CartItem(
                                        cartItem: cartItem,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                              ),
                              Icon(
                                Iconsax.bag,
                                size: size.width * 0.20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              Text(
                                "Sebediňiz boş !!!",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 28,
                                    fontFamily: 'Regular'),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            SizedBox(
                child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Umumy maglumat",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.040,
                                fontFamily: 'Bold'),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sargytlaryň jemi",
                                style: TextStyle(fontFamily: 'Regu'),
                              ),
                              Text(
                                "${context.watch<CartProvider>().cartProductTotal} Sany",
                                style: TextStyle(fontFamily: 'Bold'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.008,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sargytlaryň bahasy",
                                style: TextStyle(fontFamily: 'Regu'),
                              ),
                              Text(
                                "+${context.watch<CartProvider>().cartSubTotal}\TMT",
                                style: TextStyle(fontFamily: 'Bold'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.055,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ZoomTapAnimation(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(context: context, builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text('Sebedi arassalajakmy ?'),
                                            actions: [
                                              ElevatedButton( onPressed: (){
                                                Navigator.pop(context);
                                                context.read<CartProvider>().clearItem();
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                        elevation: 0,
                                                        duration: Duration(milliseconds: 500),
                                                        backgroundColor: Colors.transparent,
                                                        behavior: SnackBarBehavior.floating,
                                                        content: SnakBarEveryTime(titleee: "Sebet arassalandy"))
                                                );
                                              }, child: Text('Hawa'),),
                                              ElevatedButton( onPressed: (){
                                                Navigator.pop(context);
                                              }, child: Text('Ýok'),),
                                            ],
                                          );
                                        });

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide.none,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Sebedi arassala",
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).dividerColor,
                                              fontFamily: 'Bold',
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: ZoomTapAnimation(
                                    child: ElevatedButton(
                                      onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckOut()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[700],
                                        elevation: 20,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide.none,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            "Sargydy kabul et",
                                            style: TextStyle(
                                                color:
                                                    Theme.of(context).dividerColor,
                                                fontFamily: 'Bold',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}

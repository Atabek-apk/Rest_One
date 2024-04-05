import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';

class ProductDetails extends StatelessWidget {
  final TachProduct product;
  const ProductDetails({Key? key,required this.product}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoriteProduct>(context);
    var authNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange[500],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            width: double.infinity,
            height: 360,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 3,
                                      blurRadius: 5)
                                ]),
                            child: Icon(Icons.arrow_back)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 3,
                                  blurRadius: 5)
                            ]),
                        child: IconButton(onPressed: (){
                          if(authNotifier.loggeIn == true){
                            provider.pressButton(product);
                            provider.isExist(product) ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    elevation: 0,
                                    duration: Duration(milliseconds: 500),
                                    backgroundColor: Colors.transparent,
                                    behavior: SnackBarBehavior.floating,
                                    content: SnakBarEveryTime(titleee: "${product.name} halanlaryma goşuldy"))
                            ) : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    elevation: 0,
                                    duration: Duration(milliseconds: 500),
                                    backgroundColor: Colors.transparent,
                                    behavior: SnackBarBehavior.floating,
                                    content: SnakBarEveryTime(titleee: "${product.name} halanlarymdan aýryldy"))
                            );
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginPage()));
                          }
                        }, icon: provider.isExist(product)
                            ? Icon(
                          Icons.favorite,
                          color: Colors.red.shade600,
                        )
                            : Icon(Icons.favorite_border),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '${baseurl}admindata/product/product/${product.imagePath}',
                    height: 220,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      fontFamily: 'Bold',
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${product.regularPrice.toString()} TMT',
                  style: TextStyle(
                      fontFamily: 'Bold',
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5),
                ]),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
                maxWidth: 250,
                minHeight: 30,
                minWidth: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Görnüşi: ${product.category}',
                    style: TextStyle(
                        fontFamily: 'Regu',
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Önüm barada: ${product.description}',
                    style: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: ElevatedButton(
          onPressed: () {
            if(authNotifier.loggeIn == true){
              print('product_card_details  ....');
              context.read<CartProvider>().addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  duration: Duration(milliseconds: 500),
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: SnakBarEveryTime(titleee: "${product.name} sargyda goşuldy"),),
              );
            }else{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()));
            }
          },
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 28,
              )),
        ),
      ),
    );
  }
}


import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';


class ProductCard extends StatelessWidget {
  final TachProduct product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    final provider = Provider.of<FavoriteProduct>(context);
    print("product+page${product}");
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: product,
            ),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: "${baseurl}admindata/product/product/${product.imagePath}",
        imageBuilder: (context, imageProvider) => Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(product.name),
                            Text('${product.regularPrice} \TMT'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(70, 42),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {
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
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage()));
                                  }
                                },
                                child: provider.isExist(product)
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red.shade600,
                                      )
                                    : Icon(Icons.favorite_border)),
                             ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(80, 42),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {
                                  if(authNotifier.loggeIn == true){
                                    print('product_card  ....');
                                    context
                                        .read<CartProvider>()
                                        .addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            elevation: 0,
                                            duration: Duration(milliseconds: 500),
                                            backgroundColor: Colors.transparent,
                                            behavior: SnackBarBehavior.floating,
                                            content: SnakBarEveryTime(titleee: "${product.name} sargyda goşuldy"))
                                    );
                                  }else{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage()));
                                  }
                                },
                                child: Icon(Icons.shopping_cart))
                          ],
                        ),
                      )
                    ],
                  ),
                  //
                ),
              ),
            ],
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(15)),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

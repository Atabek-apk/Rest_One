import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    authNotifier.getPrefs();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          title: Row(
            children: [
              Image.asset(
                "assets/images/ten.png",
                height: 45,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Täç coffee',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Regular'),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchScreen(),
                  );
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Obx(() {
              if (menuPageController.bannerList.isNotEmpty) {
                return CoruselSlider(bannerList: menuPageController.bannerList);
              } else {
                return LoadinBanner();
              }
            }),
            SectionTitles(title: 'Category'),
            Obx(() {
              if (menuPageController.categoryList.isNotEmpty) {
                return PopularCategory(
                    categories: menuPageController.categoryList);
              } else {
                return CategoryLoading();
              }
            }),
            InkWell(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: SearchScreen(),
                  );
                },
                child: SectionTitles(title: 'Product')),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(() {
                if (menuPageController.productList.isNotEmpty) {
                  return PopularProduct(
                      product: menuPageController.productList);
                } else {
                  return ProductLoading();
                }
              }),
            ),
          ],
        ));
  }
}

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var provider = Provider.of<FavoriteProduct>(context);
    var productss = menuPageController.productList;
    List<TachProduct?> matchQuery = [];
    for (var prode in productss) {
      if (prode.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(prode);
      }
    }
    return matchQuery.isEmpty
        ? SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
          child: Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Image.asset(
                    'assets/images/error.png',
                    height: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gözleýän harydyňyz tapylmady !!!',
                    style: TextStyle(fontSize: 19, fontFamily: 'Regular'),
                  )
                ],
              ),
            ),
        )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var product = matchQuery[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  product: product,
                                )));
                  },
                  child: CachedNetworkImage(
                      imageUrl:
                          "${baseurl}admindata/product/product/${product!.imagePath}",
                      imageBuilder: (context, imageProvider) => Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(15),
                          child: Column(children: [
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
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(product.name),
                                          Text('${product.regularPrice} \TMT'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(70, 42),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              onPressed: () {
                                                provider.pressButton(product);
                                                provider.isExist(product)
                                                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        elevation: 0,
                                                        duration: Duration(
                                                            milliseconds: 1500),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        behavior: SnackBarBehavior
                                                            .floating,
                                                        content: SnakBarEveryTime(
                                                            titleee:
                                                                "${product.name} halanlaryma goşuldy")))
                                                    : ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                            elevation: 0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1500),
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            behavior: SnackBarBehavior
                                                                .floating,
                                                            content: SnakBarEveryTime(
                                                                titleee: "${product.name} halanlarymdan aýryldy")));
                                              },
                                              child: provider.isExist(product)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color:
                                                          Colors.red.shade600,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border)),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(80, 42),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              onPressed: () {
                                                context
                                                    .read<CartProvider>()
                                                    .addToCart(product);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        elevation: 0,
                                                        duration: Duration(
                                                            milliseconds: 1500),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        content: SnakBarEveryTime(
                                                            titleee:
                                                                "${product.name} sargyda goşuldy")));
                                              },
                                              child: Icon(Icons.shopping_cart))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                //
                              ),
                            )
                          ]))),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<FavoriteProduct>(context);
    var productss = menuPageController.productList;
    List<TachProduct?> matchQuery = [];
    for (var prode in productss) {
      if (prode.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(prode);
      }
    }
    return matchQuery.isEmpty
        ? SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Image.asset(
                    'assets/images/error.png',
                    height: 300,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Text(
                      'Entäk haryt gözlenmedik !!!',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19, fontFamily: 'Regular'),
                    ),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var product = matchQuery[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  product: product,
                                )));
                  },
                  child: CachedNetworkImage(
                      imageUrl:
                          "${baseurl}admindata/product/product/${product!.imagePath}",
                      imageBuilder: (context, imageProvider) => Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(15),
                          child: Column(children: [
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
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(product.name),
                                          Text('${product.regularPrice} \TMT'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(70, 42),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Container(
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.orange[200],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${product.name} halanlaryma goşuldy !",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Regu"),
                                                        ),
                                                        CircleAvatar(
                                                          child: IconButton(
                                                              onPressed: () {
                                                                provider
                                                                    .pressButton(
                                                                        product);
                                                                provider.isExist(
                                                                        product)
                                                                    ? ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                        SnackBar(
                                                                          elevation:
                                                                              0,
                                                                          duration:
                                                                              Duration(milliseconds: 1500),
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          behavior:
                                                                              SnackBarBehavior.floating,
                                                                          content:
                                                                              SnakBarEveryTime(titleee: "${product.name} halanlaryma goşuldy"),
                                                                        ),
                                                                      )
                                                                    : ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                        SnackBar(
                                                                          elevation:
                                                                              0,
                                                                          duration:
                                                                              Duration(milliseconds: 1500),
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          behavior:
                                                                              SnackBarBehavior.floating,
                                                                          content:
                                                                              SnakBarEveryTime(titleee: "${product.name} halanlarymdan aýryldy"),
                                                                        ),
                                                                      );
                                                              },
                                                              icon: Icon(
                                                                  Icons.clear)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                              },
                                              child: provider.isExist(product)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color:
                                                          Colors.red.shade600,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border)),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(80, 42),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              onPressed: () {
                                                context
                                                    .read<CartProvider>()
                                                    .addToCart(product);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Container(
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.orange[200],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${product.name} sargyda goşuldy !",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Regular"),
                                                        ),
                                                        CircleAvatar(
                                                          child: IconButton(
                                                              onPressed: () {
                                                                print(
                                                                    'object1');
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                    elevation:
                                                                        0,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    behavior:
                                                                        SnackBarBehavior
                                                                            .floating,
                                                                    content: SnakBarEveryTime(
                                                                        titleee:
                                                                            "${product.name} sargyda goşuldy")));
                                                              },
                                                              icon: Icon(
                                                                  Icons.clear)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                              },
                                              child: Icon(Icons.shopping_cart))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                //
                              ),
                            )
                          ]))),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75),
            ),
          );
  }
}

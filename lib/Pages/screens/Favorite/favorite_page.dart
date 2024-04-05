import 'package:rest_one/constants/file_assistans.dart';

class FavoriPage extends StatefulWidget {
  const FavoriPage({Key? key}) : super(key: key);

  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<FavoriteProduct>(context);
    final like = provider.like;
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
          title: Text("Halanlarym",
              style: TextStyle(
                  fontSize: 25, fontFamily: 'Regular', color: Colors.white)),
        ),
        body: like.isNotEmpty
            ? ListView.builder(
                itemCount: like.length,
                itemBuilder: (context, index) {
                  final lik = like[index];
                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              product: lik,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${baseurl}admindata/product/product/${lik.imagePath}",
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.fitWidth,
                                )),
                            SizedBox(
                              width: size.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lik.name,
                                    style: TextStyle(
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Bold'),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    "${lik.regularPrice} \TMT",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: size.width * 0.035,
                                        fontFamily: 'Bold'),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.pressButton(lik);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    elevation: 0,
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Colors.transparent,
                                    behavior: SnackBarBehavior.floating,
                                    content: SnakBarEveryTime(
                                        titleee:
                                            "${lik.name} halanlarymdan aýryldy")));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.2),
                                  radius: 20,
                                  child: provider.isExist(lik)
                                      ? Icon(
                                          Iconsax.trash,
                                          color: Colors.redAccent,
                                          size: 22,
                                        )
                                      : Icon(
                                          Iconsax.trash,
                                          color: Colors.redAccent,
                                          size: 22,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 85,
                    color: Colors.red.shade300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Halanlarym ýok !",
                    style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 28,
                        fontFamily: 'Bold'),
                  ),
                ],
              )));
  }
}

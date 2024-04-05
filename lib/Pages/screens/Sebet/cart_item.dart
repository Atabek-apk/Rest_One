import 'package:rest_one/Models/selected_card_model.dart';
import 'package:rest_one/constants/file_assistans.dart';

class CartItem extends StatefulWidget {
  final CartModel cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cardNotifier = Provider.of<CartProvider>(context);
    int a = cardNotifier.shoppingCart.length;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: widget.cartItem.product,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: size.width * 0.30,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "${baseurl}admindata/product/product/${widget.cartItem.product.imagePath}",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: size.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.product.name,
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Bold'),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    "${widget.cartItem.product.regularPrice} \TMT",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: size.width * 0.035,
                        fontFamily: 'Bold'),
                  ),
                  SizedBox(
                    height: size.width * 0.028,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartProvider>()
                              .incrementQty(widget.cartItem.id);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Iconsax.add,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        widget.cartItem.quantity.toString(),
                        style: TextStyle(fontFamily: 'Bold', fontSize: 18),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartProvider>()
                              .decrimentQty(widget.cartItem.id);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Iconsax.minus,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('Sebetden harydy aýyrjakmy ?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context
                                .read<CartProvider>()
                                .removeItem(widget.cartItem.id);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                elevation: 0,
                                duration: Duration(milliseconds: 500),
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                content: SnakBarEveryTime(
                                    titleee: "Sebetden aýryldy")));
                          },
                          child: Text(
                            'Hawa',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ýok',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.redAccent.withOpacity(0.07),
                radius: 22,
                child: const Icon(
                  Iconsax.trash,
                  color: Colors.redAccent,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

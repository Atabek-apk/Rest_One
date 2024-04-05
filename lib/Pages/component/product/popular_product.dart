import 'package:rest_one/constants/file_assistans.dart';

class PopularProduct extends StatelessWidget {
  final List<TachProduct> product;
  const PopularProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: product.length,
      itemBuilder: (context, index) => ProductCard(product: product[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.72),
    );
  }
}

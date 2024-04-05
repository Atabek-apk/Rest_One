import 'package:rest_one/constants/file_assistans.dart';

class ProductLoadingCard extends StatelessWidget {
  const ProductLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      child: Shimmer.fromColors(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/splash/f.png',
              ),
            ),
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white),
    );
  }
}

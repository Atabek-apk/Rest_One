import 'package:rest_one/constants/file_assistans.dart';

class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
            child: Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/splash/f.png',
                ),
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white),
      ),
    );
  }
}

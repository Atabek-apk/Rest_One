import 'package:rest_one/constants/file_assistans.dart';

class PopularCategory extends StatelessWidget {
  final List<TachCategory> categories;
  const PopularCategory({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryCard(category: categories[index])),
    );
  }
}

import 'package:rest_one/constants/file_assistans.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => CategoryLoadingCard()),
    );
  }
}

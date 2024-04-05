import 'package:rest_one/constants/file_assistans.dart';

class CategoryCard extends StatelessWidget {
  final TachCategory category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
      child: CachedNetworkImage(
        imageUrl: "${baseurl}admindata/product/category/${category.icon}",
        imageBuilder: (context, imageProvider) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
        ),
        placeholder: (context, url) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
              child: Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white),
        ),
        errorWidget: (context, url, error) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
              child: Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white),
        ),
      ),
    );
  }
}

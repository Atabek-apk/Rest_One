import 'package:rest_one/constants/file_assistans.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;
  const BannerCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(imageUrl: "${baseurl}admindata/banner/${imageUrl}",
        progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(aspectRatio: 16/9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white),
        fit: BoxFit.cover,
        width: double.infinity,),
      ),
    );
  }
}
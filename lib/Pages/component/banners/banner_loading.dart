import 'package:rest_one/constants/file_assistans.dart';

class LoadinBanner extends StatelessWidget {
  const LoadinBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(aspectRatio: 16/9,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/splash/f.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0; i<4; i++)
              Container(
                margin: EdgeInsets.only(right:5),
                height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),),
            ],)
          ],
        ),
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.white);
  }
}

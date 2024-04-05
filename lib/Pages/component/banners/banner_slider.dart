import 'package:rest_one/constants/file_assistans.dart';

class CoruselSlider extends StatefulWidget {
  final List<TachBanner> bannerList;
  const CoruselSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  State<CoruselSlider> createState() => _CoruselSliderState();
}

class _CoruselSliderState extends State<CoruselSlider> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;
  final CarouselController _controller = CarouselController();


  @override
  void initState() {
    _bannerList = widget.bannerList
        .map((e) => BannerCard(imageUrl: e.imagePath))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: _bannerList,
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 16/9,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 7),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            onPageChanged: (index, reason){
              setState(() {
                _currentIndex = index;
              });
            }
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerList.map((e) {
            int index = widget.bannerList.indexOf(e);
            return Container(
              margin: EdgeInsets.only(right:5),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
              ),);
          }).toList())
      ],
    );
  }
}

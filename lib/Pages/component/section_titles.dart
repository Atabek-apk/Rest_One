import 'package:rest_one/constants/file_assistans.dart';

class SectionTitles extends StatelessWidget {
  final String title;
  const SectionTitles({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(title, style: TextStyle(color: Colors.grey.shade700, fontSize: 17, fontFamily: "Regular"),),
        Text('See more', style: TextStyle(color: Colors.grey.shade700, fontSize: 17, fontFamily: "Regular"),),
      ],),
    );
  }
}

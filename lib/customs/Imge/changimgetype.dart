import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ChangeImageType extends StatelessWidget {
  final String urlImge;
  const ChangeImageType({Key? key, required this.urlImge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FChangeImageType(
      urlImge: urlImge,
    );
  }
}

class _FChangeImageType extends StatefulWidget {
  const _FChangeImageType({
    Key? key,
    required this.urlImge,
  }) : super(key: key);
  final String urlImge;

  @override
  State<_FChangeImageType> createState() => _FChangeImageTypeState();
}

class _FChangeImageTypeState extends State<_FChangeImageType> {
  @override
  Widget build(BuildContext context) {
    String imgErr = widget.urlImge;

    RegExp exp = RegExp(r'.svg', caseSensitive: false);
    String str = imgErr;

    if (exp.hasMatch(str)) {
      return SvgPicture.network(
        imgErr,
      );
    } else {
      return Image.network(
        imgErr,
      );
    }
  }
}

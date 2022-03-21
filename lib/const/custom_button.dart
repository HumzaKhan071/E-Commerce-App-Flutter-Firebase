import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttonWidth;
  const CustomButton(
      {Key? key,
      required this.text,
      this.radius,
      required this.function,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => function(),
      child: Material(
        elevation: 5,
        borderRadius: radius ?? BorderRadius.circular(20),
        color: Color.fromRGBO(30, 62, 160, 1),
        child: Container(
          alignment: Alignment.center,
          height: size.height / 17,
          width: size.width / buttonWidth,
          child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width / 22,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}

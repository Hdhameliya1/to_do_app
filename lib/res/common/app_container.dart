import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final String? hintText;
  final bool? isData;
  const AppContainer({Key? key, this.hintText, this.isData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 1,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFF1AB8DB),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        hintText ?? "",
        style: TextStyle(
          color: isData! ? Colors.black : Color(0xCC000000),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

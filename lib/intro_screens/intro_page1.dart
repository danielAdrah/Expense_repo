import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(children: [
        const SizedBox(
          height: 200,
        ),
        SizedBox(
          width: 260,
          height: 260,
          child: Center(child: SvgPicture.asset('assets/images/m1.svg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Your Personal Finance Assistant",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Keeping track of your expenses has never been easier. Simply store and save every little detail about your spending, and let our app handle the rest. ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
          ),
        ),
      ]),
    );
  }
}

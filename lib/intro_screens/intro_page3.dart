import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
          child: Center(child: SvgPicture.asset('assets/images/m3.svg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Track Your Finances With Ease",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Store and save every little detail about your spending. Let us help you manage your finances effectively. ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
          ),
        ),
      ]),
    );
  }
}

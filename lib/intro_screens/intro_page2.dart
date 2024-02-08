import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
          child: Center(child: SvgPicture.asset('assets/images/m2.svg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Easy And Fun Design To Use",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            " Navigating your financial journey has never been simpler And Funnier Through Our App",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
          ),
        ),
      ]),
    );
  }
}

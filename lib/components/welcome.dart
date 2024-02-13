import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter/components/expense_display.dart';

import '../homePage.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Track Your Finances,Simplify Your Life",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
            const Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Manage your expenses, analyze spending trends, and gain control over your finances.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 250,
              width: 200,
              child: SvgPicture.asset("assets/images/m4.svg"),
            ),
            const SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExpDisplay()));
              },
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Expense And Spending",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Analyze Spending",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

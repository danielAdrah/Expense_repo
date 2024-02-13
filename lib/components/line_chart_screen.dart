import 'package:flutter/material.dart';

class LineScreen extends StatefulWidget {
  const LineScreen({super.key});

  @override
  State<LineScreen> createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("this linr chart")),);
  }
}
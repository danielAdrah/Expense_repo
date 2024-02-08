import 'package:my_flutter/bar_graphs/bar_info.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<BarInfo> barData = [];

  void initializeBarData() {
    barData = [
      BarInfo(x: 0, y: sunAmount),
      BarInfo(x: 1, y: monAmount),
      BarInfo(x: 2, y: tueAmount),
      BarInfo(x: 3, y: wedAmount),
      BarInfo(x: 4, y: thurAmount),
      BarInfo(x: 5, y: friAmount),
      BarInfo(x: 6, y: satAmount),
    ];
  }
}

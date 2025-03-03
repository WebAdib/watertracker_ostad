import 'package:flutter/material.dart';

class addWaterBtn extends StatelessWidget {
  final int amount;
  IconData? icon;
  final VoidCallback onClick;
  addWaterBtn(
      {super.key, required this.amount, this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton.icon(
          onPressed: onClick,
          label: Text(
            '+ ${amount}ml',
            style: TextStyle(fontSize: 18),
          ),
          icon: Icon(icon ?? Icons.water_drop_rounded, color: Colors.white),
        ),
      ),
    );
  }
}

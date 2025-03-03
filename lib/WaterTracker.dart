import 'package:flutter/material.dart';

import 'widgets/addWaterBtn.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int _currentIntake = 0;
  double _targetIntake = 2000; // target daily intake in milliliters

  void _addWater(int amount) {
    setState(() {
      if (_currentIntake < _targetIntake) {
        _currentIntake += amount;
      }
    });
  }

  void _resetWater() {
    setState(() {
      _currentIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Water Tracker'),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //////////////////////////////// 1st section water intake tracker
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade500.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Today\'s Water Intake',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${_currentIntake}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            //////////////////////////////// 2nd section progress indicator
            SizedBox(height: 20),
            Text(
              'Daily Water Intake Goal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: 0.75, // replace with actual progress value
                    backgroundColor: Colors.white,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '75%',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            //////////////////////////////// 3rd section buttons
            addWaterBtn(
              amount: 100,
              onClick: () => _addWater(100),
            ),
            addWaterBtn(
              amount: 200,
              icon: Icons.local_cafe_rounded,
              onClick: () => _addWater(200),
            ),
            addWaterBtn(
              amount: 500,
              icon: Icons.local_drink_rounded,
              onClick: () => _addWater(500),
            ),

            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton.icon(
                  onPressed: _resetWater,
                  label: Text(
                    'Reset',
                    style: TextStyle(fontSize: 16),
                  ),
                  icon: Icon(Icons.restart_alt_rounded, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

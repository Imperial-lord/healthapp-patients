import 'package:flutter/material.dart';
import 'package:healthapp/components/customButton.dart';
import 'package:healthapp/screens/doctor_list.dart';

class Disease extends StatelessWidget {
  static const id = 'disease';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            CustomButton(
              title: 'ear',
              ///////////image: "assets/6.png",
              onPressed: () {
                //   Navigator.pushNamed(context, IitgBus.id);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomButton(
              title: 'bones',
              // image: "assets/6.png",
              onPressed: () {
                Navigator.pushNamed(context, Doctor.id);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomButton(
              title: 'kidney',
              ////// image: "assets/6.png",
              onPressed: () {
                // Navigator.pushNamed(context, Ferry.id);
              },
            ),
            // FlatButton.icon(onPressed: null, icon: null, label: null),
          ],
        ),
      ),
    );
  }
}

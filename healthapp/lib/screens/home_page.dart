import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  static const id = "home_page";

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFFF8F8F8),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _topPoster(),
              _bookAppointmentButton(),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Medical services we offer',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xFF08134D)),
                ),
              ),
              MyStatefulWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookAppointmentButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        onPressed: () {
          //TODO : Implemennt the book appointment here
          print('Book appointment!');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        highlightElevation: 20,
        color: Colors.blue[700],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Book an appointment',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _topPoster() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF08134D),
                Colors.blue,
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Dr. Amit Goel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Endocrinologist \nin Hyderabad',
                        style: TextStyle(
                            height: 1.3,
                            color: Color(0xFF08134D),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        //TODO : Implemennt the book appointment here
                        print('Book appointment!');
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      highlightElevation: 20,
                      color: Color(0xFF80B7FF),
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF08134D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image(
                  image: AssetImage('assets/images/doctor.png'),
                  width: 210,
                ),
              )
            ],
          )),
    );
  }
}

List<String> images = [
  'adrenal',
  'thyroid',
  'diabetes',
  'menstrual',
  'children',
  'parathyroid'
];

// stores ExpansionPanel state information
class Item {
  Item({
    this.id,
    this.expandedValue,
    this.headerValue,
    this.imageUrl,
  });

  int id;
  String expandedValue;
  String headerValue;
  String imageUrl;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    String img = images[index];
    String header = img[0].toUpperCase() + img.substring(1);
    String desc =
        'Adrenal Insufficiency, Adrenal Tumors , Cushing Syndrome etc';
    return Item(
      id: index,
      headerValue: '$header Disorders',
      expandedValue: '$desc',
      imageUrl: 'assets/images/$img.png',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(6);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      dividerColor: Colors.white,
      animationDuration: Duration(milliseconds: 800),
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
            value: item.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Image(
                    image: AssetImage(item.imageUrl),
                    height: 35,
                    width: 35,
                  ),
                  title: Text(
                    item.headerValue,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF08134D)),
                  ),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                subtitle: Text(
                  item.expandedValue,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8F8F8F)),
                ),
              ),
            ));
      }).toList(),
    );
  }
}

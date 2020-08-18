import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String testimonial =
    'Its indeed a pleasure and my sincere thanks to the doctor for controlling my sugar while I had visited almost all doctors. '
    'But in my first visit to the doctor I saw a dedicated approach and I was explained that my technique of taking insulin was not correct and a few modifications of the dose.'
    'I am now following his technique & the dose with this my sugars are well under control.';
String signature = 'Mr. Ragi Reddy (Entrepreneur)';

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
              _textTitle('Medical services we offer'),
              MyAccordionWidget(),
              _textTitle('COVID Information Videos'),
              _showVideos(),
              _textTitle('Articles'),
              _showArticles(),
              _textTitle('Testimonials'),
              _showTestimonials(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color(0xFF08134D)),
      ),
    );
  }

  Widget _showTestimonials() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _testimonialContainer(testimonial, signature),
          _testimonialContainer(testimonial, signature),
          _testimonialContainer(testimonial, signature),
          _testimonialContainer(testimonial, signature),
        ],
      ),
    );
  }

  Widget _testimonialContainer(String t, String s) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Container(
        width: 450,
        child: RaisedButton(
          onPressed: () {
            print('Pressed!');
          },
          highlightElevation: 20,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.quoteLeft,
                color: Colors.blue[700],
              ),
              Container(
                  padding: EdgeInsets.all(5), child: Flexible(child: Text(t,style: TextStyle(color: Color(0xFF8F8F8F)),))),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text('-'+s,style: TextStyle(color:Color(0xFF08134D)),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showArticles() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _articleContainer('https://dramitendo.com/an-overview-of-diabetes/',
              'https://dramitendo.com/wp-content/uploads/2020/07/diabetes.jpg'),
          _articleContainer(
              'https://dramitendo.com/precautions-for-thyroid-patients-dos-donts/',
              'https://dramitendo.com/wp-content/uploads/2020/07/thyroid.jpg'),
          _articleContainer(
              'https://dramitendo.com/what-you-should-know-about-hormones/',
              'https://dramitendo.com/wp-content/uploads/2020/07/dna.jpg'),
        ],
      ),
    );
  }

  Widget _articleContainer(String url, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
      child: InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
    );
  }

  Widget _showVideos() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _videoContainer('https://www.youtube.com/watch?v=Kf3Pz2aoIXE'),
          _videoContainer('https://www.youtube.com/watch?v=JfpECBWjMlo'),
          _videoContainer('https://www.youtube.com/watch?v=1vfrFSzFgo4'),
          _videoContainer('https://www.youtube.com/watch?v=AauNs2GIT7A'),
          _videoContainer('https://www.youtube.com/watch?v=03o1yjAq_2M'),
          _videoContainer('https://www.youtube.com/watch?v=YS_T3I1ps1w'),
        ],
      ),
    );
  }

  Widget _videoContainer(String url) {
    String video_id = url.split("=")[1];
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
      child: InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image(
                  image: NetworkImage('https://img.youtube.com/vi/' +
                      video_id +
                      '/sddefault.jpg'),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

class MyAccordionWidget extends StatefulWidget {
  MyAccordionWidget({Key key}) : super(key: key);

  @override
  _MyAccordionWidgetState createState() => _MyAccordionWidgetState();
}

class _MyAccordionWidgetState extends State<MyAccordionWidget> {
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

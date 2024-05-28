


import'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 233, 233, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCard(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height* 0.80,
                  child: buildFirstCard(),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: buildSecondLeftCard(),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: buildSecondRightCard(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: buildThirdLeftCard(),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: buildThirdRightCard(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: buildFourthLeftCard(),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: CustomCard(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: buildFourthRightCard(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Income', style: TextStyle(color: Colors.white, fontSize: 24)),
        Spacer(),
        Center(child: Image(image:AssetImage('images/income.png'))),
        Spacer(),
        Text('Annual 1.2M', style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    );
  }

  Widget buildSecondLeftCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enrollment', style: TextStyle(color: Colors.white, fontSize: 24)),
        Text('12', style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    );
  }

  Widget buildSecondRightCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Invoices', style: TextStyle(color: Colors.white, fontSize: 24)),
        Center(child: Icon(Icons.receipt, color: Colors.white, size: 50)),
        Text('47.7k', style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    );
  }

  Widget buildThirdLeftCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Teaching Staff', style: TextStyle(color: Colors.white, fontSize: 24)),
        Center(child: Icon(Icons.people, color: Colors.white, size: 50)),
        Text('7', style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    );
  }

  Widget buildThirdRightCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Grades', style: TextStyle(color: Colors.white, fontSize: 24)),
        Text('10', style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    );
  }

  Widget buildFourthLeftCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Parents', style: TextStyle(color: Colors.white, fontSize: 24)),
        Center(child: Icon(Icons.family_restroom, color: Colors.white, size: 50)),
      ],
    );
  }

  Widget buildFourthRightCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Learning Areas', style: TextStyle(color: Colors.white, fontSize: 24)),
        Center(child: Icon(Icons.book, color: Colors.white, size: 50)),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  CustomCard({required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF02282D),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
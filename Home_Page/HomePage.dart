import 'package:bmi2/BMI/BMI.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สุขภาพ ป๊าบๆที่สุด'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                //เมื่อกดปุ่มนี้ อยากให้เกิดอีเวนท์อะไร ให้มาโค้ดตรงนี้
                print('กดไปแล้วนะจ๊ะ ปุ่มโฮม');
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                //เมื่อกดปุ่มนี้ อยากให้เกิดอีเวนท์อะไร ให้มาโค้ดตรงนี้
                print('กดไปแล้วนะจ๊ะ ปุ่มตั้งค่า');
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                //เมื่อกดปุ่มนี้ อยากให้เกิดอีเวนท์อะไร ให้มาโค้ดตรงนี้
                print('กดไปแล้วนะจ๊ะ ปุ่มอิหยังวะ');
              },
              icon: const Icon(Icons.add_card_sharp))
        ],
      ),
      body: const BMI(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.query_stats,
              color: Colors.blueAccent,
            ),
            label: 'Stat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_soccer,
              color: Colors.red,
            ),
            label: 'Football',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('คุณปองพล หล่อโฮก'),
            ),
            ListTile(
              title: const Row(children: [
                Icon(Icons.man),
                Text('ดัชนีมวลกาย'),

              ]),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(children: [
                Icon(Icons.bloodtype),
                Text('ความดันเลือด'),

              ]),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.share),
      ),
    );
  }
}

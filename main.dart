

import 'package:flutter/material.dart';
import 'Home_Page/HomePage.dart';


void main()
{
  //Run ไปที่ MyApp
  runApp(const MyApp());
}
 //My app คือ Classแรกสุด สำหรับให้กำเนิดด้านหน้าจอ app
//MyApp is stateless (หน้าจอที่ fix ตลอดเวลา)

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    //สร้าง material
    return MaterialApp(
      title: 'ดัชนีมวลกายนะจ๊ะ',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


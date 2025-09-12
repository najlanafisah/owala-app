import 'package:flutter/material.dart';

class SizeConfig {
  // Class MediaQuery adalah class yang berfungsi untuk membuat aplikasi menjadi responsive
  // dengan cara mengambil ukuran aktual (apa adanya/real) pada layar platform
  static MediaQueryData _mediaQueryData =
  MediaQueryData.fromView(
    // ignore_for_file: deprecated_member_use
    WidgetsBinding.instance.window
  );
  // variable untuk meanmpung default size dari aplikasi,
  // sebelum di deploy ke platfrm yang spesifik,
  // mendapatkan ukuran aktual dari platform tsb
  // (misal = dideploy ke paltform android)
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  // fungsi function ini adalah untuk pamanggilan awal ketika aplikasi di jalankan
  // dan untuk mendapatkan ukuran dari layar platform
  // function ini penting banget
  void init(BuildContext context) {
    // berfungsi untuk mengambil ukuran aktual dari platform
    // karena di dalam variable _mediaQueryData didalamnya memanggil class Media Query
    // yang class Media Query itu sendiri berfungsi untuk mengambil ukuran aktual dari platform
    _mediaQueryData = MediaQuery.of(context); // ini yang bekerja untuk mengambil data ukurannya
    // untuk mengambil hanya data ukuran width saja
    screenWidth = _mediaQueryData.size.width;
    // untuk mengambil hanya data ukuran height saja
    screenHeight = _mediaQueryData.size.height;
  }
}

// function yang memiliki kembalian
double getProporsionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // ini adalah perhitungan untuk menghasiilkan nilai dan ukuran object yang responsive sesuai dengan platform
  return (inputHeight / 812.0 * screenHeight); // ukurannya 812.0 = kerena ngikutin size yang populer yaitu designer rata2 menggunakan iphone 10 (812 x 375) (jadi 812.0 adalah tinggi dari iphone x)
  // 
}

double getProporsionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0 * screenWidth);
}
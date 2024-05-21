import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> nikeShoes = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAddress: "assets/images/nike1.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN MID",
    price: 190.00,
    imgAddress: "assets/images/nike8.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 160.00,
    imgAddress: "assets/images/nike2.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "NIKE",
    model: "Air-FORCE",
    price: 110.00,
    imgAddress: "assets/images/nike3.png",
    modelColor: const Color(0xffD7D8DC),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike5.png",
    modelColor: const Color(0xff37376B),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 115.00,
    imgAddress: "assets/images/nike4.png",
    modelColor: const Color(0xffE4E3E8),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike7.png",
    modelColor: const Color(0xffD68043),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike6.png",
    modelColor: const Color(0xffE2E3E5),
  ),
];

final List<ShoeModel> addidasShoes = [
  ShoeModel(
    name: "ADDIDAS",
    model: "Ultraboost 21",
    price: 200.00,
    imgAddress: "assets/images/addidas1.png",
    modelColor: const Color(0xff5a9baf),
  ),
  ShoeModel(
    name: "ADDIDAS",
    model: "Sneakers",
    price: 99.00,
    imgAddress: "assets/images/addidas2.png",
    modelColor: const Color(0xff25282f),
  ),
  ShoeModel(
    name: "ADDIDAS",
    model: "Sneakers",
    price: 120.00,
    imgAddress: "assets/images/addidas3.png",
    modelColor: const Color(0xff39383e),
  ),
  ShoeModel(
    name: "ADDIDAS",
    model: "Galaxy 6",
    price: 110.00,
    imgAddress: "assets/images/addidas4.png",
    modelColor: const Color(0xff135353),
  ),
  ShoeModel(
    name: "ADDIDAS",
    model: "Response Super",
    price: 150.00,
    imgAddress: "assets/images/addidas5.png",
    modelColor: const Color(0xff55b4d0),
  ),
];

final List<ShoeModel> jordanShoes = [
  ShoeModel(
    name: "JORDAN",
    model: "Air Jordan 1",
    price: 200.00,
    imgAddress: "assets/images/jordan1.png",
    modelColor: const Color(0xff8a7b74),
  ),
  ShoeModel(
    name: "JORDAN",
    model: "Dunk Low",
    price: 99.00,
    imgAddress: "assets/images/jordan2.png",
    modelColor: const Color(0xff25282f),
  ),
  ShoeModel(
    name: "JORDAN",
    model: "Dunk",
    price: 120.00,
    imgAddress: "assets/images/jordan3.png",
    modelColor: const Color(0xff721621),
  ),
  ShoeModel(
    name: "JORDAN",
    model: "Sneakers",
    price: 110.00,
    imgAddress: "assets/images/jordan4.png",
    modelColor: const Color(0xff494656),
  ),
  ShoeModel(
    name: "JORDAN",
    model: "Gym Red",
    price: 150.00,
    imgAddress: "assets/images/jordan5.png",
    modelColor: const Color(0xff25282f),
  ),
];

final List<ShoeModel> pumaShoes = [
  ShoeModel(
    name: "PUMA",
    model: "Sports",
    price: 200.00,
    imgAddress: "assets/images/puma1.png",
    modelColor: const Color(0xffdd052c),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Track",
    price: 99.00,
    imgAddress: "assets/images/puma2.png",
    modelColor: const Color(0xff3b3235),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Racquet",
    price: 120.00,
    imgAddress: "assets/images/puma3.png",
    modelColor: const Color(0xff2d3245),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Basketball",
    price: 110.00,
    imgAddress: "assets/images/puma4.png",
    modelColor: const Color(0xff549e5b),
  ),
  ShoeModel(
    name: "PUMA",
    model: "Sports",
    price: 150.00,
    imgAddress: "assets/images/puma5.png",
    modelColor: const Color(0xff2b6ca4),
  ),
];

List<ShoeModel> itemsOnBag = [];

List<ShoeModel> favItems = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "Away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '💻',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '🤫',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  'Nike',
  'Adidas',
  'Jordan',
  'Puma',
  // 'Gucci',
  // 'Tom Ford',
  // 'Koio',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];

final List<double> sizes = [6, 7.5, 8, 9.5];

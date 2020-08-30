import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodapp/FoodTags.dart';
import 'package:foodapp/PopularFoodItem.dart';

class DeliciousFoodView extends StatefulWidget {
  @override
  _DeliciousFoodViewState createState() => _DeliciousFoodViewState();
}

class _DeliciousFoodViewState extends State<DeliciousFoodView> {
  static const double iconSize = 23; //Size of the icons in the app

  Container buildBody() {
    return Container(
      child: Column(
        children: [
          buildSearchBar(),
          buildCategoryList(),
          buildPopulars(),
        ],
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 15, right: 8),
    );
  }

  Expanded buildPopulars() {
    return Expanded(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              color: Colors.grey.withOpacity(0.07)),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              buildTopBarPopulars(),
              buildPopularFoodItems(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildPopularFoodItems() {
    final gorengan = FoodTags('Gorengan', Colors.orange);
    final makananRingan = FoodTags('Makanan Ringan', Colors.blue);
    final donut = FoodTags('Donut', Colors.red);
    final ombehan = FoodTags('Ombehan', Colors.green);
    final berAir = FoodTags('Ber Air', Colors.lightBlue);

    final foodItem1 = PopularFoodItem(
      'https://images.pexels.com/photos/2872755/pexels-photo-2872755.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Banana Goreng',
      [gorengan, makananRingan],
      'Warung buyakuk',
      2500,
    );
    final foodItem2 = PopularFoodItem(
      'https://images.pexels.com/photos/239581/pexels-photo-239581.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Donat Cilik',
      [gorengan, donut],
      'Warung buyakuk',
      12000,
    );
    final foodItem3 = PopularFoodItem(
      'https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'Copy anget',
      [ombehan, berAir],
      'Warung buyakuk',
      4500,
    );
    return Expanded(
      child: Column(
        children: [
          buildFoodItem(foodItem1),
          buildFoodItem(foodItem2),
          buildFoodItem(foodItem3),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }

  Card buildFoodItem(PopularFoodItem foodItem) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            buildFoodItemImage(foodItem.path),
            buildFoodItemDetails(foodItem.title, foodItem.tags,
                foodItem.description, foodItem.price),
          ],
        ),
      ),
    );
  }

  Expanded buildFoodItemDetails(
      String foodTitle, List<FoodTags> tagList, String description, int price) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.15,
          child: Column(
            children: [
              buildFoodItemTitle(foodTitle),
              Spacer(
                flex: 1,
              ),
              buildTagList(tagList),
              Spacer(
                flex: 2,
              ),
              buildFoodBottom(description, price),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }

  Row buildFoodBottom(String description, int price) {
    final thousand = price ~/ 1000;
    final remainder = price.remainder(1000);
    return Row(
      children: [
        buildBottomDescription(description),
        buildBottomPrice(thousand, remainder),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Text buildBottomPrice(int thousand, num remainder) {
    return Text(
      'Rp. $thousand.${remainder == 0 ? "000" : remainder}',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Text buildBottomDescription(String description) {
    return Text(
      description,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black26, fontSize: 12),
    );
  }

  Row buildTagList(List<FoodTags> tagList) {
    return Row(
      children: [
        buildFoodTag(tagList[0]),
        buildFoodTag(tagList[1]),
      ],
    );
  }

  Container buildFoodTag(FoodTags foodTag) {
    return Container(
      child: Text(
        foodTag.tagTitle,
        style: TextStyle(
            color: foodTag.tagColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
      //
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: foodTag.tagColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Text buildFoodItemTitle(String foodTitle) {
    return Text(
      foodTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  Card buildFoodItemImage(String path) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        path,
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.width * 0.17,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding buildTopBarPopulars() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          buildHeartIcon(),
          buildPopularsTitleSubtitle(),
          Spacer(),
          buildRightArrowButton(),
        ],
      ),
    );
  }

  Padding buildPopularsTitleSubtitle() {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitlePopulars(),
          SizedBox(
            height: 5,
          ),
          buildSubTitlePopulars(),
        ],
      ),
    );
  }

  IconButton buildRightArrowButton() => IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {},
      );

  Text buildSubTitlePopulars() => Text(
        'Monggo, entekno duwkmul',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.3),
        ),
      );

  Text buildTitlePopulars() => Text(
        'Popular',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );

  Card buildHeartIcon() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Icon(
          Icons.favorite,
          size: iconSize,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        color: Colors.red,
      ),
      margin: EdgeInsets.only(right: 10),
    );
  }

  Container buildCategoryList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCategoryItems(index, context),
        ),
      ),
    );
  }

  Container buildCategoryItems(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          buildCategoryItemImage(context),
          buildCategoryItemText(),
        ],
      ),
    );
  }

  SizedBox buildCategoryItemText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Row(
        children: [
          buildCategoryItemTitle(),
          buildCategoryItemCount(),
        ],
      ),
    );
  }

  Text buildCategoryItemCount() {
    var randomNum = Random().nextInt(100);
    return Text(
      '$randomNum Item',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text buildCategoryItemTitle() {
    return Text(
      'Title - ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black26,
      ),
    );
  }

  Card buildCategoryItemImage(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,
      child: Image.network(
        'https://cdn.pixabay.com/photo/2020/02/23/21/50/donuts-4874737_1280.jpg',
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.35,
        fit: BoxFit.cover,
      ),
      margin: EdgeInsets.all(5),
    );
  }

  Container buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [buildSearchText(), buildSearchButton()],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  SizedBox buildSearchButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.width * 0.12,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black38,
        child: IconButton(
          icon: Icon(Icons.search),
          iconSize: iconSize,
          onPressed: () {},
        ),
      ),
    );
  }

  Text buildSearchText() => Text(
        'What do you want\nto eat today?',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      );

  AppBar buildAppBar() {
    return AppBar(
      leading: buildGoBackButton(),
      actions: [
        buildMenuButton(),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  IconButton buildMenuButton() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
      color: Colors.black,
    );
  }

  IconButton buildGoBackButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {},
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }
}

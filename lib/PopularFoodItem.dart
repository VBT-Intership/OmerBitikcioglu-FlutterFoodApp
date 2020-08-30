import 'package:foodapp/FoodTags.dart';

class PopularFoodItem {
  String _imgPath;
  String _title;
  List<FoodTags> _tags;
  String _description;
  int _price;

  PopularFoodItem(
      this._imgPath, this._title, this._tags, this._description, this._price);

  String get path => _imgPath;
  String get title => _title;
  List<FoodTags> get tags => _tags;
  String get description => _description;
  int get price => _price;
}

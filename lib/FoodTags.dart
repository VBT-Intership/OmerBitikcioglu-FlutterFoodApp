import 'package:flutter/material.dart';

class FoodTags {
  String _tagTitle;
  Color _tagColor;

  FoodTags(this._tagTitle, this._tagColor);

  String get tagTitle => _tagTitle;
  Color get tagColor => _tagColor;
}

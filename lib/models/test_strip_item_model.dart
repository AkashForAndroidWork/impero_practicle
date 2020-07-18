import 'package:flutter/material.dart';
import 'package:impero_practicle/models/test_strip_color_model.dart';

class TestStripItemModel {
  String title;
  String subtitle;
  TestStripColorModel selectedColorModel;
  List<TestStripColorModel> colorModelList;

  TestStripItemModel(
      {@required this.title,
      @required this.subtitle,
      @required this.colorModelList}) {
    if (colorModelList != null && colorModelList.isNotEmpty)
      selectedColorModel = colorModelList[0];
  }

}

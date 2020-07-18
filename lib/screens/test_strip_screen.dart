import 'package:flutter/material.dart';
import 'package:impero_practicle/models/test_strip_color_model.dart';
import 'package:impero_practicle/models/test_strip_item_model.dart';
import 'package:impero_practicle/widgets/list_rows/test_strip_list_row.dart';

class TestStripScreen extends StatefulWidget {
  @override
  _TestStripScreenState createState() => _TestStripScreenState();
}

class _TestStripScreenState extends State<TestStripScreen> {
  ThemeData baseTheme;

  @override
  Widget build(BuildContext context) {
    baseTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        /*actions: <Widget>[
            IconButton(
                icon: Icon(Icons.filter_list, color: Colors.black),
                onPressed: () {}),
          ],*/
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  List<TestStripItemModel> itemModel = [
    TestStripItemModel(
      title: "Total Hardness",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.blue.value, value: 0),
        TestStripColorModel(colorCode: Colors.blueAccent.value, value: 110),
        TestStripColorModel(colorCode: Colors.lightBlue.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.lightBlueAccent.value, value: 500),
        TestStripColorModel(colorCode: Colors.blueGrey.value, value: 1000),
      ],),
    TestStripItemModel(
      title: "Total Chlorine",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.green.value, value: 0),
        TestStripColorModel(colorCode: Colors.greenAccent.value, value: 110),
        TestStripColorModel(colorCode: Colors.lightGreen.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.lightGreenAccent.value, value: 500),
        TestStripColorModel(colorCode: Colors.lightGreenAccent.value, value: 1000),
      ],),
    TestStripItemModel(
      title: "Free Chlorine",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.deepPurple.value, value: 0),
        TestStripColorModel(colorCode: Colors.grey.value, value: 110),
        TestStripColorModel(colorCode: Colors.purple.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.purpleAccent.value, value: 500),
        TestStripColorModel(colorCode: Colors.deepPurpleAccent.value, value: 1000),
      ],),
    TestStripItemModel(
      title: "Ph",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.red.value, value: 0),
        TestStripColorModel(colorCode: Colors.redAccent.value, value: 110),
        TestStripColorModel(colorCode: Colors.deepOrange.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.pink.value, value: 500),
        TestStripColorModel(colorCode: Colors.pinkAccent.value, value: 1000),
      ],),
    TestStripItemModel(
      title: "Total Alkalinity",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.black12.value, value: 0),
        TestStripColorModel(colorCode: Colors.black26.value, value: 110),
        TestStripColorModel(colorCode: Colors.black54.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.black87.value, value: 500),
        TestStripColorModel(colorCode: Colors.black.value, value: 1000),
      ],),
    TestStripItemModel(
      title: "Cyanuric Acid",
      subtitle: "ppm",
      colorModelList: [
        TestStripColorModel(colorCode: Colors.yellow.value, value: 0),
        TestStripColorModel(colorCode: Colors.yellowAccent.value, value: 110),
        TestStripColorModel(colorCode: Colors.amber.value, value: 250),
        TestStripColorModel(
            colorCode: Colors.amberAccent.value, value: 500),
        TestStripColorModel(colorCode: Colors.yellowAccent.value, value: 1000),
      ],),

  ];


  Widget _buildBody(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Test Strip",
              style: baseTheme.textTheme.headline6,
            ),
            Container(
              height: 24,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
//                    height: double.maxFinite,
                    width: 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1
                      ),
                    ),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          key: UniqueKey(),
                          height: 90,
                          child: Container(
                            color: Color(itemModel[index].selectedColorModel.colorCode),
                            margin: const EdgeInsets.only(top: 50),
                          ),
                        );
                      },
                      itemCount: itemModel.length,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 300,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return TestStripListRow(
                            model: itemModel[index],
                            onSelectionChange: (model){
                              setState(() {
                                itemModel[index].selectedColorModel = model;
                              });
                            },
                          );
                        },
                        itemCount: itemModel.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

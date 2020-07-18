import 'package:flutter/material.dart';
import 'package:impero_practicle/models/test_strip_color_model.dart';
import 'package:impero_practicle/models/test_strip_item_model.dart';

class TestStripListRow extends StatefulWidget {
  final TestStripItemModel model;
  final Function(TestStripColorModel selectedColorModel) onSelectionChange;
  const TestStripListRow({Key key, @required this.model, this.onSelectionChange}) : super(key: key);

  @override
  _TestStripListRowState createState() => _TestStripListRowState();
}

class _TestStripListRowState extends State<TestStripListRow> {
  ThemeData baseTheme;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.addListener(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    baseTheme = Theme.of(context);
    _textEditingController.text = widget.model.selectedColorModel.value.toString();
    return Container(
      height: 100,
      width: 300,
      child: Column(
        children: <Widget>[
          Container(
            width: 300,
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Text(widget.model.title, style: baseTheme.textTheme.bodyText1),
                  Text("(${widget.model.subtitle})",
                      style: baseTheme.textTheme.subtitle2),
                  Expanded(child: Container()),
                  Container(
                    width: 100,
                    height: 30,
                    child: TextField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (value){
                        widget.model.colorModelList.asMap().forEach((key, colorModel) {
                          if(value == colorModel.value.toString()){
                            _newColorSelected(colorModel);
                            return;
                          }
                        });
                        setState(() {
                        });
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 5, right: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(style: BorderStyle.none, width: 1))),
                      style: baseTheme.textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 4,),
          Expanded(child: _buildColorList()),
        ],
      ),
    );
  }

  Widget _buildColorList() {
    if(widget.model.colorModelList==null || widget.model.colorModelList.isEmpty){
      return Container();
    }
    return ListView.builder(
      itemBuilder: (context, index){
        var model = widget.model.colorModelList[index];
        return InkWell(
          onTap: (){
            _newColorSelected(model);
          },
          child: Container(
            width: 65,
            key: UniqueKey(),
            child: Column(
              children: <Widget>[
                Container(
                  height: 20,
                  width: 65,
                  margin: const EdgeInsets.only(bottom: 4, right: 4),
                  decoration: BoxDecoration(
                    color: Color(model.colorCode),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Text(model.value.toString(), style: baseTheme.textTheme.subtitle2)
              ],
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: widget.model.colorModelList.length,
    );
  }

  void _newColorSelected(TestStripColorModel model) {
    setState(() {
      widget.model.selectedColorModel = model;
    });
    widget.onSelectionChange?.call(model);
  }
}

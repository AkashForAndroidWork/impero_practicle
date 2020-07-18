import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_practicle/data/repository.dart';
import 'package:impero_practicle/models/product_model.dart';
import 'package:impero_practicle/models/subcategory_model.dart';
import 'package:impero_practicle/widgets/list_rows/product_list_row.dart';

class SubcategoryListRow extends StatefulWidget {
  final SubcategoryModel model;

  const SubcategoryListRow({Key key, this.model}) : super(key: key);

  @override
  _SubcategoryListRowState createState() => _SubcategoryListRowState();
}

class _SubcategoryListRowState extends State<SubcategoryListRow> {
  bool isLoading = false;
  int productPage = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.model.subCategoryName,
              style: Theme.of(context).textTheme.bodyText2),
          Container(
            height: 16,
          ),
          Expanded(child: _buildProductList(widget.model.productModelList)),
        ],
      ),
    );
  }

  Widget _buildProductList(List<ProductModel> productModelList) {
    if (productModelList == null && productModelList.isEmpty) {
      return Container(
        child: Center(
          child: Text("No Product Available"),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _loadProductData();
              }
              return true;
            },
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var model = productModelList[index];
                return ProductListRow(
                  key: UniqueKey(),
                  model: model,
                );
              },
              itemCount: productModelList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Container(
            width: 50.0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Future _loadProductData() async {
    List<ProductModel> list = await Repository.getInstance()
        .getMoreProductData(widget.model.subCategoryId, productPage);
    if (list != null && list.isNotEmpty)
      setState(() {
        widget.model.productModelList.addAll(list);
        productPage++;
        isLoading = false;
      });
  }
}

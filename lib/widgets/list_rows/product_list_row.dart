import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_practicle/models/product_model.dart';
import 'package:impero_practicle/res/color_resources.dart';

class ProductListRow extends StatelessWidget {

  final ProductModel model;

  const ProductListRow({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4)
          ), child: _buildImageView(context),),
          Container(height: 10),
          Flexible(child: Text(model.productName, style: Theme.of(context).textTheme.subtitle2)),
        ],
      ),
    );
  }

  Widget _buildImageView(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(model.productImageUrl, height: 100, width: 100, fit: BoxFit.cover,)),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 4),
          padding: const EdgeInsets.only(left: 4, top: 2, right: 4, bottom: 2),
          decoration: BoxDecoration(
            color: colorAccent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(model.productPriceCode, maxLines: 2, style: Theme.of(context).textTheme.caption.copyWith(
            color: Colors.white
          )),
        ),
      ],
    );
  }
}

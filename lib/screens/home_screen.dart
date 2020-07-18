import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impero_practicle/bloc/dashboard_bloc.dart';
import 'package:impero_practicle/data/repository.dart';
import 'package:impero_practicle/models/category_model.dart';
import 'package:impero_practicle/models/product_model.dart';
import 'package:impero_practicle/models/subcategory_model.dart';
import 'package:impero_practicle/res/color_resources.dart';
import 'package:impero_practicle/widgets/list_rows/subcategory_list_row.dart';

class HomeScreen extends StatefulWidget {
  final List<CategoryModel> categoryModelList;

  const HomeScreen({Key key, this.categoryModelList}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  ThemeData baseTheme;
  bool isLoading = false;
  int subcategoryPage = 2;

  @override
  void initState() {
    _tabController =
        TabController(vsync: this, length: widget.categoryModelList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    baseTheme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
        title: Text(
          "ESP TILES",
          style: baseTheme.textTheme.subtitle2.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();}),
        backgroundColor: colorTextDarkBlue,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {})
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: colorTextLightGray,
          indicatorColor: Colors.white,
          isScrollable: true,
          labelStyle: baseTheme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.w500),
          tabs: _buildTabs(widget.categoryModelList),
          controller: _tabController,
        ));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: TabBarView(
        children: _buildTabScreenViewList(widget.categoryModelList),
        controller: _tabController,
      ),
    );
  }

  List<Widget> _buildTabs(List<CategoryModel> categoryModelList) {
    List<Widget> lisToReturn = List();
    if (categoryModelList != null && categoryModelList.isNotEmpty) {
      categoryModelList.asMap().forEach((key, value) {
        lisToReturn.add(Tab(
          text: value.categoryName,
        ));
      });
    }

    return lisToReturn;
  }

  List<Widget> _buildTabScreenViewList(List<CategoryModel> categoryModelList) {
    List<Widget> lisToReturn = List();
    if (categoryModelList != null && categoryModelList.isNotEmpty) {
      categoryModelList.asMap().forEach((key, value) {
        lisToReturn.add(_buildSubCategoryList(value.subcategoryModelList));
      });
    }

    return lisToReturn;
  }

  Widget _buildSubCategoryList(List<SubcategoryModel> subcategoryModelList) {
    if (subcategoryModelList == null || subcategoryModelList.isEmpty) {
      return Container(
        child: Center(child: Text("No Data")),
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!isLoading && scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                _loadSubCategoryData();
              }
              return true;
            },
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var model = subcategoryModelList[index];
                double topMargin = (index == 0) ? 16 : 0;
                return Container(margin: EdgeInsets.only(top: topMargin),child: SubcategoryListRow(key: UniqueKey(), model: model,));
              },
              itemCount: subcategoryModelList.length,
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Container(
            height: 50.0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Future _loadSubCategoryData() async {

    List<CategoryModel> list= await Repository.getInstance().getMoreSubcategoryData( widget.categoryModelList[0].categoryId, subcategoryPage);
    if(list!=null && list.isNotEmpty)
    setState(() {
      widget.categoryModelList[0].subcategoryModelList.addAll(list[0].subcategoryModelList);
      subcategoryPage++;
      isLoading = false;
    });
  }

}

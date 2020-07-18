import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impero_practicle/bloc/dashboard_bloc.dart';
import 'package:impero_practicle/data/repository.dart';
import 'package:impero_practicle/screens/home_screen.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>DashboardBloc(Repository.getInstance())..add(FetchDashboardData()),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (BuildContext context, state) {

        },
        builder: (BuildContext context, state) {

          if(state is DashboardLoading){
            return Container(color: Colors.white, height: double.maxFinite, width: double.maxFinite, child: Center(child: CircularProgressIndicator()),);
          } else if(state is DashboardDataFetched){
            return HomeScreen(categoryModelList: state.categoryModelList);
          }
          return Container();
        },
      ),
    );
  }
}

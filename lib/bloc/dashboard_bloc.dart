import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:impero_practicle/data/repository.dart';
import 'package:impero_practicle/models/category_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository repository;

  DashboardBloc(this.repository) : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is FetchDashboardData){
      yield DashboardLoading();
      try{
        List<CategoryModel> categoryModelList = await repository.getDashboardData();
        yield DashboardDataFetched(categoryModelList);
      } catch (error) {
        yield DashboardLoadError(error.toString());
        print(error);
      }
    }
  }
}

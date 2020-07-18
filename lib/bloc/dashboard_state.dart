part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardDataFetched extends DashboardState {
  final List<CategoryModel> categoryModelList;
  DashboardDataFetched(this.categoryModelList);

  @override
  List<Object> get props => [categoryModelList];
}

class DashboardLoadError extends DashboardState {
  final String errorMessage;

  DashboardLoadError(this.errorMessage);
}

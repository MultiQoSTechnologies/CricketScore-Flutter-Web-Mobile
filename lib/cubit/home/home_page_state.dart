part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageSuccessState extends HomePageState {}

class HomePageErrorState extends HomePageState {
  final String errorMessage;

  HomePageErrorState(this.errorMessage);
}

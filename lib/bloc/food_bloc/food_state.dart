part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final FoodModel foodModel;
  const FoodLoaded(this.foodModel);
}

class FoodError extends FoodState {
  final String? message;
  const FoodError(this.message);
}

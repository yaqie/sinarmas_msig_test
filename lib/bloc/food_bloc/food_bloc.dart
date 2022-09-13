import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinarmas_msig_test/apis/api_repository.dart';
import 'package:sinarmas_msig_test/models/food.model.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetFoodList>((event, emit) async {
      try {
        emit(FoodLoading());
        final mList = await _apiRepository.fetchFoodList();
        emit(FoodLoaded(mList));
        if (mList.error != null) {
          emit(FoodError(mList.error));
        }
      } on NetworkError {
        emit(const FoodError("Failed to fetch data. is your device online?"));
      }
    });

    on<GetFoodDetail>((event, emit) async {
      try {
        emit(FoodLoading());
        final mList = await _apiRepository.fetchFoodDetail(event.id);
        emit(FoodLoaded(mList));
        if (mList.error != null) {
          emit(FoodError(mList.error));
        }
      } on NetworkError {
        emit(const FoodError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

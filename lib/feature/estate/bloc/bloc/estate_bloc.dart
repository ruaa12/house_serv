import 'package:bloc/bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/data/models/category_service_model.dart';
import 'package:home_serviece/feature/service/data/model/category_prov_model.dart';

import '../../data/data_source/estate_datasource.dart';
import '../../data/models/get_estate_detailes.dart';
import '../../data/models/get_houses.dart';
import '../../data/repo/estate_repo.dart';
import 'package:home_serviece/core/unified_api/status.dart' as api_status;
import 'package:home_serviece/feature/estate/data/models/get_houses.dart' as estate_model;

part 'estate_event.dart';

part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  List<Category> originalListCategories = [];
  List<HouseModel> originalListHouses = [];

  EstateBloc({required EstateDatasource estateDatasource}) : super(EstateState()) {
    on<GetAllEstatesEvent>((event, emit) async {
      emit(state.copyWith(allEstatesStatus: ApiStatus.loading));

      final result = await EstateRepo().getAllEstates();

      result.fold((failure) => emit(state.copyWith(allEstatesStatus: ApiStatus.failed)), (response) {
        print("✅ عدد العقارات المسترجعة: ${response.data!.length}");
        originalListHouses = response.data!;
        emit(
          state.copyWith(
            allEstatesStatus: ApiStatus.success,
            estates: response.data ?? [],
          ),
        );
      });
    });
    on<GetEstateDetailsEvent>((event, emit) async {
      emit(state.copyWith(detailsEstateStatus: ApiStatus.loading));

      final result = await EstateRepo().getEstateDetails(event.estateId);

      result.fold(
        (failure) => emit(state.copyWith(
          detailsEstateStatus: ApiStatus.failed,
          message: failure.message,
        )),
        (response) => emit(state.copyWith(
          detailsEstateStatus: ApiStatus.success,
          estatedetails: response,
        )),
      );
    });
    on<GetAllCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesStatus: ApiStatus.loading));

      final result = await EstateRepo().getAllCategories();

      result.fold(
          (failure) => emit(state.copyWith(
                getCategoriesStatus: ApiStatus.failed,
                message: failure.message,
              )), (response) {
        originalListCategories = response.data!;
        emit(state.copyWith(
          getCategoriesStatus: ApiStatus.success,
          getCategories: response,
        ));
      });
    });
    on<SearchCategoryEvent>((event, emit) {
      if (event.query == '') {
        state.getCategories!.data = originalListCategories;
        emit(state.copyWith(
          getCategories: state.getCategories,
        ));
      } else {
        List<Category> searchedCategory =
            state.getCategories!.data!.where((element) => element.name!.toLowerCase().contains(event.query.toLowerCase())).toList();
        state.getCategories!.data = searchedCategory;
        emit(state.copyWith(
          getCategories: state.getCategories,
        ));
      }
    });
    on<SearchHomeEvent>((event, emit) {
      if (event.query == '') {
        emit(state.copyWith(estates: originalListHouses));
      } else {
        List<HouseModel> searchedHouses = state.estates.where((element) => element.title!.toLowerCase().contains(event.query.toLowerCase())).toList();
        emit(state.copyWith(
          estates: searchedHouses,
        ));
      }
    });
  }
}

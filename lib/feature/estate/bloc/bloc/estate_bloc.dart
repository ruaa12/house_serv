import 'package:bloc/bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/data/models/category_service_model.dart';

import '../../data/data_source/estate_datasource.dart';
import '../../data/models/get_estate_detailes.dart';
import '../../data/models/get_houses.dart';
import '../../data/repo/estate_repo.dart';
import 'package:home_serviece/core/unified_api/status.dart' as api_status;
import 'package:home_serviece/feature/estate/data/models/get_houses.dart' as estate_model;

part 'estate_event.dart';

part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  EstateBloc({required EstateDatasource estateDatasource}) : super(EstateState()) {
    on<GetAllEstatesEvent>((event, emit) async {
      emit(state.copyWith(allEstatesStatus: ApiStatus.loading));

      final result = await EstateRepo().getAllEstates();

      result.fold((failure) => emit(state.copyWith(allEstatesStatus: ApiStatus.failed)), (response) {
        print("✅ عدد العقارات المسترجعة: ${response.data!.length}");
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
        )),
        (response) => emit(state.copyWith(
          getCategoriesStatus: ApiStatus.success,
          getCategories: response,
        )),
      );
    });
  }
}

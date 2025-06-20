import 'package:bloc/bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';

import '../../data/models/get_houses.dart';
import '../../data/repo/estate_repo.dart';
import 'package:home_serviece/core/unified_api/status.dart' as api_status;
import 'package:home_serviece/feature/estate/data/models/get_houses.dart' as estate_model;
part 'estate_event.dart';
part 'estate_state.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  EstateBloc() : super(EstateState()) {
    on<GetAllEstatesEvent>((event, emit) async {
      emit(state.copyWith(allEstatesStatus: ApiStatus.loading));

      final result = await EstateRepo().getAllEstates();

      result.fold(
        (failure) => emit(state.copyWith(allEstatesStatus: ApiStatus.failed)),
        (response) => emit(
          state.copyWith(
            allEstatesStatus: ApiStatus.success,
            estates: response.data ?? [],
          ),
        ),
      );
    });
  }
}

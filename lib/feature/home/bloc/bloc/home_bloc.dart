import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_serviece/core/unified_api/status.dart' as api_status;
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart' as estate_model;
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';import 'package:home_serviece/feature/home/data/models/popular_service_model.dart';
import 'package:home_serviece/feature/home/data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetTrendingEvent>((event, emit) async {
       print('📥 Bloc استلم الحدث GetTrendingEvent');
      emit(state.copyWith(trendingHousesStatus: ApiStatus.loading));
      final result = await HomeRepo().getTrending();
          print('📊 عدد العقارات المسترجعة من السيرفر: ${result.length}');

      result.fold((l) => emit(state.copyWith(trendingHousesStatus:ApiStatus.failed )), 
      (r) => emit(state.copyWith(trendingHousesStatus:ApiStatus.success,
      trendingHouses: r.data, ),)
      );


    });
  }
}

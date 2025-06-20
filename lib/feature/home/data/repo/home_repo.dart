import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/handling_exeption_manager.dart';
import 'package:home_serviece/feature/home/bloc/bloc/home_bloc.dart';
import 'package:home_serviece/feature/home/data/data_source/home_datasource.dart';
import 'package:home_serviece/feature/home/data/models/popular_service_model.dart';
import 'package:home_serviece/feature/home/data/models/trending_houses_model.dart';

class HomeRepo with HandlingExceptionManager {
  Future<Either<Failure, TrendingHousesResponseModel>> getTrending() async {
    print("📢 تم استدعاء getTrending()");

    return await wrapHandling(tryCall: () async {
      try {
        final result = await HomeDatasource().getTrending();
        print("✅ تم جلب البيانات من الـ Datasource");
        return Right(result);
      } catch (e, st) {
        print("🔥 خطأ أثناء تنفيذ getTrending: $e");
        print("🧵 Stack Trace:\n$st");
        rethrow;
      }
    });
  }

  Future<Either<Failure, PopularServiceResponseModel>>
      getPopularServices() async {
    return await wrapHandling(tryCall: () async {
      final result = await HomeDatasource().getPopularServices();
      return Right(result);
    });
  }
}

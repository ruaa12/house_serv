import 'package:dartz/dartz.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/handling_exeption_manager.dart';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

import '../data_source/estate_datasource.dart';

class EstateRepo with HandlingExceptionManager {
  Future<Either<Failure, EstateData>> getAllEstates() async {
    return await wrapHandling(
      tryCall: () async {
        final result = await EstateDatasource().getAllEstates();
        return Right(result);
      },
    );
  }
}

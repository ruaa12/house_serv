import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/get_api.dart';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

class EstateDatasource {
  Future<EstateData> getAllEstates() async {
    final result = GetApi(
      uri: ApiVariabels().getAllhouses(), // تأكدي من اسم الميثود بالرابط
      fromJson: estateDataFromJson,
    );
    return await result.callRequest();
  }
}

import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/get_api.dart';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

import '../models/get_estate_detailes.dart';

class EstateDatasource {
  Future<EstateData> getAllEstates() async {
    final result = GetApi(
      
      uri: ApiVariabels().getAllhouses(), // تأكدي من اسم الميثود بالرابط
      fromJson: estateDataFromJson,
    );
    
    return await result.callRequest();
  }
   Future<EstateDetailsResponseModel> getEstateDetails(int houseId) async {
     print("Sending request...");
    final result = GetApi<EstateDetailsResponseModel>(
      uri: ApiVariabels().getHouseDetails(houseId), // رح نحتاج تضيفي هالطريقة في ApiVariabels
      fromJson:
       estateDetailsResponseModelFromJson
      //  (body) {
      //   // هنا من المفترض response هي JSON يحوي الـ data بتفاصيل العقار
      //   // لأنه من الـ model عندنا EstateDetailsResponseModel
      //   final responseModel = estateDetailsResponseModelFromJson(body);
      //   // ممكن البيانات بداخل data هي عنصر واحد مش ليست، فإذا هي عنصر واحد، نرجعها بقائمة
      //   if (responseModel.data != null) {
      //     return [responseModel.data!];
      //   } else {
      //     return [];
      //   }
      // },
    );

    return await result.callRequest();
  }
}


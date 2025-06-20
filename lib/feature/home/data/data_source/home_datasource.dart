import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/get_api.dart';
import 'package:home_serviece/feature/home/data/models/popular_service_model.dart';
import 'package:home_serviece/feature/home/data/models/trending_houses_model.dart';

class HomeDatasource {

 Future<TrendingHousesResponseModel> getTrending() async{
  final result = GetApi(uri: ApiVariabels().getTrendingHouses(),
   fromJson: trendingHousesResponseModelFromJson);
   return await result.callRequest();
 }

 Future<PopularServiceResponseModel> getPopularServices() async{
  final result = GetApi(uri: ApiVariabels().getPapularServices(),
   fromJson: popularServiceResponseModelFromJson);
   return await result.callRequest();
 }


}
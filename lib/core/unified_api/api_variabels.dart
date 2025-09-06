class ApiVariabels {
  final _scheme = 'https';
  final _host = 'home.mustafafares.com';

  // https://home.mustafafares.com/login

  Uri _main_uri(String path, {Map<String, String>? params}) {
    return Uri(
        host: _host,
        scheme: _scheme,
        path: path,
        queryParameters: params);
  }

  Uri getTrendingHouses() => _main_uri('api/trending-houses');
  Uri getPapularServices() => _main_uri('api/services-popular');
  Uri getPapularProviders() => _main_uri('api/service-providers/popular');
  Uri getAllhouses() => _main_uri('api/houses');
  Uri getHouseDetails(int houseId) => _main_uri('/api/houses/$houseId');
  Uri getAddres() => _main_uri('api/create-address');
  Uri getCategories() => _main_uri('api/categories');
  Uri getCategoryById(int categoryId) =>
      _main_uri('api/categories/$categoryId');
  Uri getServiceById(int serviceId) => _main_uri('api/services/$serviceId');
  Uri getUserorder() => _main_uri('api/user/orders');
  Uri createHouseOrder(int houseId) => _main_uri('api/houses/sign/$houseId');
  Uri getBalance() => _main_uri('api/get-balance');
  Uri makeTransaction() => _main_uri('api/wallet-transaction');
  Uri getPopularServices() => _main_uri('api/services-popular');
  Uri getPopularServicesProviders() =>
      _main_uri('api/service-providers/popular');
  Uri getServiceProviders(int serviceId) =>
      _main_uri('api/services/$serviceId');
  Uri createServOrder(int serviceId) => _main_uri('api/services/sign/$serviceId');
}

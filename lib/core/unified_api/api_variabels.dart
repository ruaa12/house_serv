class ApiVariabels {
  final _scheme = 'http';
  final _host = '10.0.2.2';
  final _port = 8000;

  Uri _main_uri(String path, {Map<String, String>? params}) {
    return Uri(
        host: _host,
        scheme: _scheme,
        port: _port,
        path: path,
        queryParameters: params);
  }

  Uri getTrendingHouses() => _main_uri('api/trending-houses');
  Uri getPapularServices() => _main_uri('api/services-popular');
  Uri getPapularProviders() => _main_uri('api/service-providers/popular');
  Uri getAllhouses() => _main_uri('api/houses');
  Uri getAddres() => _main_uri('api/create-address');
  Uri getCategories() => _main_uri('api/categories');
  Uri getCategoryById(int categoryId) =>
      _main_uri('api/categories/$categoryId');
  Uri getServiceById(int serviceId) => _main_uri('api/services/$serviceId');
  Uri getUserorder() => _main_uri('api/user/orders');
  Uri createHouseOrder(int houseId) => _main_uri('api/orders/house/$houseId');
  Uri getBalance() => _main_uri('api/get-balance');
  Uri makeTransaction() => _main_uri('api/wallet-transaction');
  Uri getPopularServices() => _main_uri('api/services-popular');
  Uri getPopularServicesProviders() =>
      _main_uri('api/service-providers/popular');
  Uri getServiceProviders(int serviceId) =>
      _main_uri('/api/services/$serviceId');
  Uri createServOrder() => _main_uri('api/orders/service-provider');
}

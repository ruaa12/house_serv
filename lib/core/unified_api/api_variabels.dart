class ApiVariabels {
 final _scheme ='http';
 final _host = '10.0.2.2';
 final _port = 8000;

 Uri _main_uri( String path, {Map<String, String>? params} ){return Uri(
  host: _host,
  scheme: _scheme,
  port: _port,
  path: path,
  queryParameters: params

 ) ;
 }
 Uri getTrendingHouses() => _main_uri('api/trending-houses');
 Uri getPapularServices() => _main_uri('api/services-popular');
 Uri getPapularProviders() => _main_uri('api/service-providers/popular');
 Uri getAllhouses() => _main_uri('api/houses');



}
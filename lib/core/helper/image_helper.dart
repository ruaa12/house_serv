String fixImageUrl(String url) {
  if (url.contains('localhost')) {
    return url.replaceAll('localhost', '10.0.2.2');
  }
  return url;
}

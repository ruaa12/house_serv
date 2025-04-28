import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';

class FavoriteManager {
  static List<Estate> favoriteEstates = [];

  static void addFavorite(Estate estate) {
    // نتأكد ما نضيف مرتين نفس العقار
    if (!favoriteEstates.contains(estate)) {
      favoriteEstates.add(estate);
    }
  }

  static void removeFavorite(Estate estate) {
    favoriteEstates.remove(estate);
  }
}

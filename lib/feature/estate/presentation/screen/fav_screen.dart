import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/screen/details_estate.dart';
import 'package:home_serviece/feature/estate/presentation/widget/fav_manger.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required List favoriteEstates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteEstates =
        FavoriteManager.favoriteEstates; // هنا جلبناها مباشرة

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text('Favourite'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              )),
        ),
      ),
      body: favoriteEstates.isEmpty
          ? Center(child: Text('There is no favourites houses'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: favoriteEstates.length,
              itemBuilder: (context, index) {
                final estate = favoriteEstates[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailsEstate(estate: HouseModel())),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            estate.imagePath,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                estate.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    estate.location,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$${estate.price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Estate {
  final String imagePath;
  final String type;
  final String name;
  final String location;
  final num rating;
  final num price;
  final num area;
  final int rooms;

  Estate({
    required this.imagePath,
    required this.type,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.area,
    required this.rooms,
  });
}

final List<Estate> estates = [
  Estate(
    imagePath: 'assets/images/home1.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 1200.0,
    area: 80.0,
    rooms: 3,
  ),
  Estate(
    imagePath: 'assets/images/home2.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 1200.0,
    area: 80.0,
    rooms: 3,
  ),
  Estate(
    imagePath: 'assets/images/home3.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 1200.0,
    area: 80.0,
    rooms: 3,
  ),
  Estate(
    imagePath: 'assets/images/home1.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 2200,
    area: 80,
    rooms: 5,
  ),
  Estate(
    imagePath: 'assets/images/home1.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 3200.0,
    area: 80.0,
    rooms: 2,
  ),
  Estate(
    imagePath: 'assets/images/home3.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 2000.0,
    area: 80.0,
    rooms: 4,
  ),
  Estate(
    imagePath: 'assets/images/home3.jpeg',
    type: 'Apartment',
    name: 'Sunset Residence',
    location: 'Amman',
    rating: 4.5,
    price: 1200.0,
    area: 80.0,
    rooms: 5,
  ),
  Estate(
    imagePath: 'assets/images/home3.jpeg',
    type: 'Villa',
    name: 'Palm Villa',
    location: 'Aqaba',
    rating: 4.8,
    price: 2500.0,
    area: 200.0,
    rooms: 5,
  ),
  Estate(
    imagePath: 'assets/images/home3.jpeg',
    type: 'Studio',
    name: 'City Center Studio',
    location: 'Irbid',
    rating: 4.3,
    price: 750.0,
    area: 45.0,
    rooms: 1,
  ),
];

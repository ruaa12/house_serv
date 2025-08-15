class ServiceProvider {
  final int userId;
  final String name;
  final String hourlyRate;
  final String? address;
  final String? imageUrl;

  ServiceProvider({
    required this.userId,
    required this.name,
    required this.hourlyRate,
    this.address,
    this.imageUrl,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      userId: json['user_id'],
      name: json['name'],
      hourlyRate: json['hourly_rate'],
      address: json['address'],
      imageUrl: json['image'],
    );
  }
}

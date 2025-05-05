import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_card.dart';
import '../../../home/presentation/widget/const.dart';
import '../widget/estate_data.dart';
import 'details_estate.dart';

class AllEstatesScreen extends StatelessWidget {
  final List<Estate> estates;

  const AllEstatesScreen({super.key, required this.estates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('    All estates'),
        backgroundColor: color1,
        foregroundColor: color6,
      ),
      backgroundColor: color6,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: estates.isEmpty
            ? Center(
                child: Text(
                  'لا توجد عقارات لعرضها.',
                  style: TextStyle(fontSize: 16, color: color3),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0, // المسافة بين الصفوف
                  childAspectRatio: 0.60, // تحديد نسبة الطول والعرض لكل كرت
                ),
                itemCount: estates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsEstate(estate: estates[index]),
                          ));
                    },
                    child: EstateCard(estate: estates[index]),
                  );
                },
              ),
      ),
    );
  }
}

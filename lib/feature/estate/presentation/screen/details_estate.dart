import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/widget/fav_manger.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

class DetailsEstate extends StatefulWidget {
  final HouseModel estate;

  const DetailsEstate({super.key, required this.estate});

  @override
  State<DetailsEstate> createState() => _DetailsEstateState();
}

class _DetailsEstateState extends State<DetailsEstate> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      body: SafeArea(
        child: Column(
          children: [
            // ====== صورة العقار ======
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: Image.asset(
                    widget.estate.images!.first,
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: _circleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    children: [
                      _circleButton(
                        icon: Icons.share,
                        onTap: () {}, // لسه ما اضفنا وظيفة
                      ),
                      SizedBox(width: 8),
                      _circleButton(
                        icon: isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : color7,
                        onTap: () {
                          setState(() {
                            isFav = !isFav;
                            // if (isFav) {
                            //   FavoriteManager.favoriteEstates
                            //       .add(widget.estate);
                            // } else {
                            //   FavoriteManager.favoriteEstates
                            //       .remove(widget.estate);
                            // }
                          });
                        },
                      ),
                      // لسه ما اضفنا وظيفة
                    ],
                  ),
                ),
              ],
            ),

            // ====== التفاصيل ======
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان والسعر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.estate.title!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: color1,
                          ),
                        ),
                        Text(
                          '\$${widget.estate.price.toString()}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: color3),
                        SizedBox(width: 4),
                        Text(
                          widget.estate.description!,
                          style: TextStyle(color: color3),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // نوع العقار، عدد الغرف، الطابق إذا شقة
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _infoTag(icon: Icons.home, label: widget.estate.title!),
                        // _infoTag(
                        //     icon: Icons.bed,
                        //     label: '${widget.estate.rooms} غرف'),
                        // if (estate.type.toLowerCase() == 'شقة' || estate.type.toLowerCase() == 'apartment')
                        //   _infoTag(icon: Icons.apartment, label: 'الطابق ${estate.floor}'),
                      ],
                    ),
                    SizedBox(height: 24),

                    // زر عرض صور 360
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/estate360',
                              arguments: widget.estate);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: color4,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.threesixty, color: color1),
                              SizedBox(width: 6),
                              Text(
                                '360° View',
                                style: TextStyle(color: color1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // زر شراء
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/buy',
                              arguments: widget.estate);
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(color: color5, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(
      {required IconData icon, required VoidCallback onTap, Color? color}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? color6,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: color5),
      ),
    );
  }

  Widget _infoTag({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color3),
          SizedBox(width: 6),
          Text(label, style: TextStyle(color: color1)),
        ],
      ),
    );
  }
}

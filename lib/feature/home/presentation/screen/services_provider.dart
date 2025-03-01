// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/package_porovider.dart';

class ServicesProvider extends StatelessWidget {
  final Service servP;
  const ServicesProvider({
    Key? key,
    required this.servP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services Provider'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Electrician Providers'),
              TextButton(onPressed: () {}, child: Text('View all'))
            ],
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => PackagePorovider(
                    packagePro: PackagePro(
                        type: 'type',
                        name: '',
                        rating: '',
                        price: '',
                        photo: '',
                        location: '',
                        phone: 0,
                        experiance: 2,
                        bio: '',
                        Gallery: []))

                // Container(child: Text('data'),)
                ),
          ),
        ],
      ),
    );
  }
}

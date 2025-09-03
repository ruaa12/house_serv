import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/estate/presentation/screen/providers_screen.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_bloc.dart';

import '../../../../core/helper/image_helper.dart';
import '../../../../core/unified_api/status.dart';
import '../../../service/bloc/bloc/service_event.dart';
import '../../../service/bloc/bloc/service_state.dart';
import '../../bloc/bloc/estate_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(GetCategoryDetailsEvent(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الخدمات',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                context.read<ServiceBloc>().add(SearchServiceEvent(query: val));
              },
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                switch (state.categoryDetailsStatus) {
                  case ApiStatus.initial:
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case ApiStatus.success:
                    return state.categoryDetails!.services.isNotEmpty
                        ? ListView.separated(
                            padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ProvidersScreen(serviceId: state.categoryDetails!.services[index].id)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.withAlpha(21),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: MyImageWidget(imagePath: state.categoryDetails!.services[index].imageUrl),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(state.categoryDetails!.services[index].name),
                                        Text('لا يوجد شرح'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: state.categoryDetails!.services.length,
                          )
                        : Center(child: Text('لا يوجد خدمات'));
                  case ApiStatus.failed:
                    return Center(
                      child: Text('حصلت مشكلة ما'),
                    );
                  case ApiStatus.loading:
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

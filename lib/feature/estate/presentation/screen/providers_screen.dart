import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_bloc.dart';

import '../../../../core/helper/image_helper.dart';
import '../../../../core/unified_api/status.dart';
import '../../../service/bloc/bloc/service_event.dart';
import '../../../service/bloc/bloc/service_state.dart';
import '../../bloc/bloc/estate_bloc.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({super.key, required this.serviceId});

  final int serviceId;

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(GetServiceWithProvEvent(serviceId: widget.serviceId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المخدمين',
        ),
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          switch (state.serviceWithProvStatus) {
            case ApiStatus.initial:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ApiStatus.success:
              return state.serviceWithProv!.serviceProviders.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.withAlpha(21),
                        ),
                        child: Row(
                          children: [
                            state.serviceWithProv!.serviceProviders[index].image == null
                                ? SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                        child: Icon(
                                      Icons.person,
                                      size: 40,
                                    )))
                                : SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: MyImageWidget(imagePath: state.serviceWithProv!.serviceProviders[index].image!),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.serviceWithProv!.serviceProviders[index].name),
                                Text(state.serviceWithProv!.serviceProviders[index].phone),
                                Text(state.serviceWithProv!.serviceProviders[index].email),
                                Text(state.serviceWithProv!.serviceProviders[index].hourlyRate),
                              ],
                            )
                          ],
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
    );
  }
}

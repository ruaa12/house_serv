import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/helper/image_helper.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_bloc.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_event.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_state.dart';
import 'package:home_serviece/feature/service/data/data_source/service_datasource.dart';

import 'package:home_serviece/feature/service/presentation/screen/services_provider.dart';

class CategoriesServ extends StatelessWidget {
  static const String id = 'serviceScreen';
  final int categoryId;

  const CategoriesServ({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceBloc(
        dataSource: ServiceDataSource(apiVariabels: ApiVariabels()),
      )..add(GetCategoryDetailsEvent(
          categoryId: categoryId)), // ✅ استدعي التفاصيل حسب الـ ID
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Category Services'),
        ),
        body: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state.categoryDetailsStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.categoryDetailsStatus == ApiStatus.failed) {
              return Center(
                child: Text(state.categoryDetailsFailure?.message ?? 'Error'),
              );
            } else if (state.categoryDetailsStatus == ApiStatus.success) {
              final services = state.categoryDetails?.services ?? [];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceProvidersScreen(
                                    serviceId: service.id,
                                    serviceName: '',
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyImageWidget(
                                imagePath:
                                    'http://10.0.2.2:8000/storage/7/Carpet-Cleaning.jpg'), // عرض الصورة من المسار المحدد

                            const SizedBox(height: 8),
                            Text(
                              service.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

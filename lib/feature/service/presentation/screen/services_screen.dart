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
import 'package:home_serviece/feature/service/data/model/categories.dart';
import 'package:home_serviece/feature/service/presentation/screen/categories_serv.dart';

class ServicesScreen extends StatelessWidget {
  static const String id = 'serviceScreen';

  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceBloc(
        dataSource: ServiceDataSource(apiVariabels: ApiVariabels()),
      )..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Services'),
        ),
        body: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state.categoryStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.categoryStatus == ApiStatus.failed) {
              return Center(
                child: Text(state.categoryFailure?.message ?? 'Error'),
              );
            } else if (state.categoryStatus == ApiStatus.success) {
              final List<CategoryData> categories = state.categories ?? [];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesServ(
                                    categoryId: category.id,
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
                              imagePath: category.mediaUrls,
                            ), // عرض الصورة من المسار المحدد
                            MyImageWidget(
                                imagePath: category
                                    .mediaUrls), // عرض الصورة من المسار المحدد

                            const SizedBox(height: 8),
                            Text(
                              category.name,
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

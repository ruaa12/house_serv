import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_bloc.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_event.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_state.dart';
import 'package:home_serviece/feature/service/presentation/screen/provider_details_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';
import 'package:home_serviece/feature/service/data/data_source/service_datasource.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';

class ServiceProvidersScreen extends StatelessWidget {
  final int serviceId;
  final String serviceName;

  const ServiceProvidersScreen({
    Key? key,
    required this.serviceId,
    required this.serviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceBloc(
        dataSource: ServiceDataSource(apiVariabels: ApiVariabels()),
      )..add(GetServiceWithProvEvent(serviceId: serviceId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('$serviceName Providers'),
          centerTitle: true,
        ),
        body: BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            if (state.serviceWithProvStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.serviceWithProvStatus == ApiStatus.failed) {
              return Center(
                child: Text(state.serviceWithProvFailure?.message ?? 'Error'),
              );
            } else if (state.serviceWithProvStatus == ApiStatus.success) {
              final serviceData = state.serviceWithProv!;
              final providers = serviceData.serviceProviders;

              if (providers.isEmpty) {
                return const Center(child: Text('No providers found.'));
              }

              return ListView.builder(
                itemCount: providers.length,
                itemBuilder: (context, index) {
                  final provider = providers[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: CustomListTile(
                      trailing: Text('Rate: \$${provider.hourlyRate}/hour'),
                      title: provider.name,
                      leading: Image.network(
                        provider.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProviderDetailsScreen(
                              provider: {
                                'id': provider.id,
                                'name': provider.name,
                                'image': provider.imageUrl,
                                'location': provider.location,
                                'hourlyRate': provider.hourlyRate,
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
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

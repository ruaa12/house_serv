import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(LocaleKeys.myOrderScreen_My_order.tr()),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider(
        create: (_) => OrderBloc(
          dataSource: OrderDataSource(apiVariabels: ApiVariabels()),
        )..add(GetUserOrdersEvent(page: 1)),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state.status == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == ApiStatus.failed) {
              return Center(
                child: Text(state.failure?.message ?? 'Error'),
              );
            } else if (state.status == ApiStatus.success) {
              final orders = state.orders ?? [];
              if (orders.isEmpty) {
                return const Center(child: Text('No orders found.'));
              }
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(
                    id: order.id.toString(),
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

class OrderCard extends StatelessWidget {
  final String id;

  const OrderCard({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long, size: 50, color: Colors.blueAccent),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #$id',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

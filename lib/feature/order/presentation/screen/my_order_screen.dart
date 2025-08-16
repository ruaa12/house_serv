import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
<<<<<<< HEAD
import 'package:home_serviece/feature/order/presentation/screen/request_serv_screen.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';
=======
import 'package:home_serviece/feature/order/presentation/screen/contract_form_screen.dart';
import '../../../../generated/locale_keys.g.dart';
>>>>>>> a20141485a376f901dd53047eccdab5f8060d062
import 'request_house_screen.dart'; // تأكد من استيرادها هنا

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          title: Text(LocaleKeys.myOrderScreen_My_order.tr()),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Navbar()),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: const [
              Tab(text: 'Orders'),
              Tab(text: 'House Requests'),
              Tab(text: 'Service Requests'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            OrdersTab(),
            HouseRequestsTab(),
            ServiceRequestsTab(),
          ],
        ),
      ),
    );
  }
}

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderBloc(
        dataSource: OrderDataSource(apiVariabels: ApiVariabels()),
      )..add(GetUserOrdersEvent(page: 1)),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.status == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ApiStatus.failed) {
            return Center(child: Text(state.failure?.message ?? 'Error'));
          } else if (state.status == ApiStatus.success) {
            final orders = state.orders ?? [];
            if (orders.isEmpty) {
              return const Center(child: Text('No orders found.'));
            }
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(id: order.id.toString());
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class HouseRequestsTab extends StatelessWidget {
  const HouseRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CreateHouseOrderContent(
        houseId: 1,
        estate: estates.first,
      ),
    );
  }
}

class ServiceRequestsTab extends StatelessWidget {
  const ServiceRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CreateServiceOrderContent(serviceId: 1));
  }
}

class OrderCard extends StatelessWidget {
  final String id;
  const OrderCard({super.key, required this.id});

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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
          TextButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: 
            (context) => ContractFormScreen(),)
            );

          }, child: Text('توقيع العقد'))
        ],
      ),
    );
  }
}

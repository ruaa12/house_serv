import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_card.dart';
import '../../../../core/unified_api/status.dart';
import '../../../home/presentation/widget/const.dart';
import '../../bloc/bloc/estate_bloc.dart';
import 'details_estate.dart';

class AllEstatesScreen extends StatefulWidget {
  const AllEstatesScreen({Key? key}) : super(key: key);

  @override
  State<AllEstatesScreen> createState() => _AllEstatesScreenState();
}

class _AllEstatesScreenState extends State<AllEstatesScreen> {
  @override
  void initState() {
    super.initState();
    print("🔁 Sending GetTrendingEvent from initState");
    // Future.microtask(() {
    //   context.read<EstateBloc>().add(GetAllEstatesEvent());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EstateBloc()..add(GetAllEstatesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('All estates'),
          centerTitle: true,
          backgroundColor: color1,
          foregroundColor: color6,
        ),
        backgroundColor: color6,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<EstateBloc, EstateState>(
            builder: (context, state) {
              switch (state.allEstatesStatus) {
                case ApiStatus.initial:
                  return Center(child: CircularProgressIndicator());

                case ApiStatus.loading:
                  return Center(child: CircularProgressIndicator());

                case ApiStatus.success:
                  if (state.estates.isEmpty) {
                    return Center(
                      child: Text(
                        'لا توجد عقارات لعرضها.',
                        style: TextStyle(fontSize: 16, color: color3),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: state.estates.length,
                    itemBuilder: (context, index) {
                      final estate = state.estates[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsEstate(estate: estate),
                            ),
                          );
                        },
                        child: EstateCard(estate: estate),
                      );
                    },
                  );

                case ApiStatus.failed:
                  return Center(
                    child: Text(
                      'حدث خطأ أثناء التحميل.',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

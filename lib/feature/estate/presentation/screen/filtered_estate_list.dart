import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/helper/image_helper.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/bloc/bloc/estate_bloc.dart';
import 'package:home_serviece/feature/estate/presentation/screen/services_screen.dart';
import '../widget/estate_data.dart';
import '../widget/estate_card.dart';

class FilteredEstateList extends StatefulWidget {
  static String id = 'searchScreen';

  @override
  _FilteredEstateListState createState() => _FilteredEstateListState();
}

class _FilteredEstateListState extends State<FilteredEstateList> {
  List<Estate> filteredEstates = List.from(estates); // القائمة المُفلترة
  String selectedType = 'All';
  double minPrice = 200;
  double maxPrice = 5000;
  double minArea = 100;
  double maxArea = 1000;
  int minRooms = 2;
  int maxRooms = 10;

  // تحديث الفلاتر
  void applyFilters() {
    setState(() {
      filteredEstates = estates.where((estate) {
        if (estate.price == null || estate.area == null || estate.rooms == null) {
          return false;
        }
        bool matchesType = selectedType == 'All' || estate.type == selectedType;
        bool matchesPrice = estate.price >= minPrice && estate.price <= maxPrice;
        bool matchesArea = estate.area >= minArea && estate.area <= maxArea;
        bool matchesRooms = estate.rooms >= minRooms && estate.rooms <= maxRooms;
        return matchesType && matchesPrice && matchesArea && matchesRooms;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<EstateBloc>().add(GetAllEstatesEvent());
    context.read<EstateBloc>().add(GetAllCategoriesEvent());
  }

  int index = 0;

  List<String> titles = ['عقارات', 'خدمات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtered Estates')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Row(
              spacing: 20,
              children: List.generate(
                2,
                (i) => Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = i;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: i == index ? Colors.cyan : Colors.grey, borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          titles[i],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                index == 1
                    ? context.read<EstateBloc>().add(SearchCategoryEvent(query: val))
                    : context.read<EstateBloc>().add(SearchHomeEvent(query: val));
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          index == 0 ? estateBody() : serviceBody(),
        ],
      ),
    );
  }

  Widget estateBody() => Expanded(child: BlocBuilder<EstateBloc, EstateState>(
        builder: (context, state) {
          switch (state.allEstatesStatus) {
            case ApiStatus.initial:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ApiStatus.success:
              return state.estates.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                      itemBuilder: (context, index) => EstateCard(estate: state.estates[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: state.estates.length,
                    )
                  : Center(child: Text('لا يوجد عقارات'));
            case ApiStatus.failed:
              return Center(
                child: Text(state.message!),
              );
            case ApiStatus.loading:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
          }
        },
      ));

  Widget serviceBody() => Expanded(child: BlocBuilder<EstateBloc, EstateState>(
        builder: (context, state) {
          switch (state.getCategoriesStatus) {
            case null:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ApiStatus.initial:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ApiStatus.success:
              return state.getCategories!.data!.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicesScreen(
                                        categoryId: state.getCategories!.data![index].id!,
                                      )));
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
                                child: MyImageWidget(imagePath: state.getCategories!.data![index].media!),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.getCategories!.data![index].name!),
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
                      itemCount: state.getCategories!.data!.length,
                    )
                  : Center(child: Text('لا يوجد عقارات'));
            case ApiStatus.failed:
              return Center(
                child: Text(state.message!),
              );
            case ApiStatus.loading:
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
          }
        },
      ));
}

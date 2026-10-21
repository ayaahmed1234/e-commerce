import 'package:ecommerce/core/api/app_constants.dart';
import 'package:ecommerce/core/helper/app_field.dart';
import 'package:ecommerce/core/helper/app_text_style.dart';
import 'package:ecommerce/features/home/categorymodel/category_cubit.dart';
import 'package:ecommerce/features/home/model/home_cubit.dart';
import 'package:ecommerce/features/home/widgets/category_item.dart';
import 'package:ecommerce/features/home/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
int selectedinex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeCubit()
            ..getAllProducts(),
        ),
        BlocProvider(
          create: (context) =>CategoryCubit()..getCategories(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's find your \nExclusive Outfit",
                style: AppTextStyle.black_700_24,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    height: 40,
                    child: AppField(
                      hint: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    color: primary,
                    iconSize: 20,

                    onPressed: () {},
                    icon: Icon(
                      Icons.manage_search_rounded,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text("Top Categories", style: AppTextStyle.black56_400_15),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryFailure) {
                    return Center(
                      child: Text(state.msg),
                    );
                  }
                  if (state is CategorySuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final item = state.categories[index];
                            bool isSelected = selectedinex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {

                                  selectedinex = index;
                                  BlocProvider.of<HomeCubit>(context).filterProducts(id: state.categories[index].id??2);
                                });
                              },
                              child: CategoryItem(
                                title: item.categoryName??"omega 3" ,
                                bgColor: isSelected ? primary : Colors.white,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              Row(
                children: [
                  Text("Popular Products", style: AppTextStyle.black56_400_15),
                  Spacer(),
                  Text("View All", style: AppTextStyle.lightGreen_500_15),
                ],
              ),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeFailure) {
                      return Center(child: Text(state.msg));
                    }
                    if (state is HomeSuccess) {
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.model.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .65,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.model[index];

                          return ProductItem(
                            title: product.title ?? "Dennis Lingo",
                            price: product.price ?? 20,
                            image: product.images![0],
                          );
                        },
                      );
                    }

                    return SizedBox(
                      child: Center(child: Text("No Available Items"),),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

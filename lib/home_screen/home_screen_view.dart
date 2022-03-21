import 'package:e_commerce_app/home_screen/drawer.dart';
import 'package:e_commerce_app/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model_class/categories_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    final controller = Get.put(HomeScreenController());
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(child: GetBuilder<HomeScreenController>(builder: (value) {
        if (!value.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Ecommerce App",
              ),
              backgroundColor: Colors.blueAccent,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
            drawer: HomeScreenDrawer(),
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 3.5,
                      width: size.width / 1.05,
                      child: PageView.builder(
                          onPageChanged: controller.changeIndicator,
                          itemCount: controller.bannerData.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          controller.bannerData[index].image))),
                            );
                          })),
                    ),
                    SizedBox(
                        height: size.height / 25,
                        width: size.width,
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < controller.isSelected.length;
                                  i++)
                                indicator(size, controller.isSelected[i].value)
                            ],
                          );
                        })),
                    categoriesTitle(size, "All Categories", () {}),
                    listViewBuilder(size, controller.categoriesData),
                    SizedBox(height: size.height / 25),
                    categoriesTitle(size, "Featured", () {}),
                    listViewBuilder(size, controller.featuredData)
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      })),
    );
  }

  Widget listViewBuilderItems(Size size, CategoriesModel categories) {
    return Container(
      height: size.height / 10,
      width: size.width / 2.2,
      child: Column(
        children: [
          Container(
              height: size.height / 16,
              width: size.width / 2.2,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(categories.image)),
              )),
          Expanded(
              child: SizedBox(
            child: Text(
              categories.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ))
        ],
      ),
    );
  }

  Widget listViewBuilder(Size size, List<CategoriesModel> data) {
    return SizedBox(
      height: size.height / 9,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return listViewBuilderItems(size, data[index]);
        },
      ),
    );
  }

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 17,
      width: size.width / 1.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () => function(),
              child: Text("View More",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                  )))
        ],
      ),
    );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}

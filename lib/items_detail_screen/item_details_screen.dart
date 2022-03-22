import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ItemsScreenDetails extends StatelessWidget {
  const ItemsScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 3.5,
                width: size.width,
                child: PageView.builder(
                  itemCount: 3,
                  // onPageChanged: controller.changeIndicator,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(image),
                            // controller.bannerData[index].image),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // indicator

              SizedBox(
                height: size.height / 25,
                width: size.width,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++) indicator(size, false)
                    ],
                  );
                }),
              ),
              SizedBox(
                height: size.height / 25,
              ),

              SizedBox(
                width: size.width / 1.1,
                child: Text("LED TV",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(height: size.height / 35),

              SizedBox(
                width: size.width / 1.1,
                child: RichText(
                  text: TextSpan(
                    text: "48000",
                    style: const TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough),
                    children: [
                      TextSpan(
                        text: "36,000",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.grey[800],
                            decoration: TextDecoration.none),
                      ),
                      TextSpan(
                        text: "25% off",
                        style: const TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height / 25,
              ),

              SizedBox(
                width: size.width / 1.1,
                child: Text("Description",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: size.height / 50,
              ),

              SizedBox(
                width: size.width / 1.1,
                child: Text("Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}

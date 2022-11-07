 import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:new_e_commerce_app/routes/routes.dart';
import 'package:new_e_commerce_app/utils/theme.dart';
import 'package:new_e_commerce_app/views/widgets/product_details/pick_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class ImageSlider extends StatefulWidget {
  final String imageUrl;
  const ImageSlider({
    required this.imageUrl,
    Key? key}) : super(key: key);
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
    int currentIndex =0;
  int currentColor =0;
  var cartController = Get.find<CartController>();
  final List<Color> colorSelected = [
      kCOlor1,
      kCOlor2,
      kCOlor3,
      kCOlor4,
      kCOlor5,
    ];
   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval:  const Duration(seconds: 2),
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index,reson)
              {
                setState(() {
                  currentIndex = index;
                });
              }
            ),
          itemBuilder:  (context,index,realIndex)
          {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration:   BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl,),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
            left: 180,
            child:AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 3,
          effect: ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Get.isDarkMode? pinkClr :mainColor,
          ),
        )),
        Positioned(
          bottom: 30,
            right: 30,
            child: Container(
          padding:const EdgeInsets.all(8),
          height: 200,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
              child: ListView.separated(
                  itemBuilder: (context,index)
                  {
                    return   GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          currentColor=index;
                        });
                      },
                      child: PickColor(
                        color: colorSelected[index],
                        outerBorder: currentColor==index,
                      ),
                    );
                  },
                  separatorBuilder: (context,index)
                  {
                    return const SizedBox(height: 3,);
                  },
                  itemCount: colorSelected.length,
              ),
        )),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            right: 25,
            left: 25,
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode?
                    pinkClr.withOpacity(0.8) :mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child:   Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Icon( Icons.arrow_back_ios,
                    color:Get.isDarkMode? Colors.black:Colors.white,
                      size: 20,
                    ),
                    ),
                  ),

              ),
              Obx((){
                return Badge(
                  position: BadgePosition.topEnd(top: -10, end: -10),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent:   Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(Routes.cartscreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode?
                        pinkClr.withOpacity(0.8) :mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon( Icons.shopping_cart_outlined,
                        color:Get.isDarkMode? Colors.black:Colors.white,
                        size: 20,
                      ),
                    ),

                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

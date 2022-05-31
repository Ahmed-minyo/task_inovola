import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_inovola/helpers/customs/custom_icon.dart';
import 'package:task_inovola/helpers/customs/resrevation.dart';
import 'package:task_inovola/helpers/customs/slider_images.dart';
import 'package:task_inovola/helpers/styles/colors.dart';
import 'package:task_inovola/helpers/styles/custom_texts.dart';
import 'package:task_inovola/helpers/styles/sizes.dart';
import 'package:task_inovola/models/api_model.dart';
import 'package:task_inovola/services/api_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ApiModel? apiModel;

  @override
  Widget build(BuildContext context) {
    Future<void> futureO() async {
      try {
        apiModel =
            await Provider.of<ApiProvider>(context, listen: false).fetchData();
      } catch (error) {
        rethrow;
      }
    }

    return Scaffold(
      body: FutureBuilder(
          future: futureO(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SliderImages(
                            // slider: apiModel!.img!,
                            slider: [
                              "https://th.bing.com/th/id/OIP.SUlBcO4pg4yIZxkWBjNWmgHaEx?pid=ImgDet&rs=1",
                              "https://th.bing.com/th/id/OIP.SUlBcO4pg4yIZxkWBjNWmgHaEx?pid=ImgDet&rs=1",
                              "https://th.bing.com/th/id/OIP.SUlBcO4pg4yIZxkWBjNWmgHaEx?pid=ImgDet&rs=1"
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 10),
                            child: Row(
                              children: [
                                IconItem(
                                    onPressed: () {},
                                    icon: Icons.arrow_back_ios),
                                const Spacer(),
                                IconItem(onPressed: () {}, icon: Icons.share),
                                IconItem(
                                    onPressed: () {}, icon: Icons.star_border),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: width(context) * 0.035),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              txt: apiModel!.title.toString(),
                              size: 20,
                            ),
                            const CustomText(
                              txt:
                                  "الاسم الكامل للدورة بشكل افتراضي  من اجل اظهار شكل التصميم ",
                              size: 22,
                              weight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_view_day,
                                    color: Colors.grey),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(txt: apiModel!.date.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.grey),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(txt: apiModel!.address.toString())
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: height(context) * 0.07,
                                  width: height(context) * 0.07,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    fit: StackFit.expand,
                                    children: [
                                      CircleAvatar(
                                          backgroundImage: NetworkImage(
                                        // apiModel!.trainerImg.toString(),
                                        "https://media.gettyimages.com/photos/closeup-smiling-male-leader-wearing-eyeglasses-picture-id1179627340?s=2048x2048",
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                CustomText(
                                  txt: apiModel!.trainerName.toString(),
                                  size: 20,
                                  weight: FontWeight.w800,
                                ),
                              ],
                            ),
                            CustomText(
                              txt: apiModel!.trainerInfo.toString(),
                              size: 22,
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const CustomText(
                              txt: "عن الدورة",
                              size: 20,
                              weight: FontWeight.w800,
                            ),
                            CustomText(
                              txt: apiModel!.occasionDetail.toString(),
                              size: 22,
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const CustomText(
                              txt: "تكلفة الدورة",
                              size: 20,
                              weight: FontWeight.w800,
                            ),
                            SizedBox(
                              height: height(context) * 0.1,
                              child: ListView.builder(
                                itemCount: apiModel!.reservTypes.length,
                                itemBuilder: (context, index) {
                                  return CustomReservation(
                                    title: apiModel!.reservTypes[index].name,
                                    price: apiModel!.reservTypes[index].price
                                        .toString(),
                                  );
                                },
                              ),
                            ),
                            const CustomReservation(
                              title: "الحجز المميز",
                              price: "302",
                            ),
                            const CustomReservation(
                              title: "الحجز السريع",
                              price: "302",
                            ),
                            Center(
                                child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              height: height(context) * 0.06,
                              color: AppColors.buttonColor,
                              child: const Center(
                                  child: Text(
                                "قم بالحجز الان",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

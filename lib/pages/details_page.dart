import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal/cubit/app_cubit_states.dart';
import 'package:personal/cubit/app_cubits.dart';
import 'package:personal/misc/colors.dart';
import 'package:personal/wigets/app_buttons.dart';
import 'package:personal/wigets/app_large_text.dart';
import 'package:personal/wigets/app_text.dart';
import 'package:personal/wigets/responsive_btn.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottemStart = 3;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailsState detailPlace = state as DetailsState;

        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 325,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/${detailPlace.place.img}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 15,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detailPlace.place.name,
                              color: Colors.black87,
                            ),
                            AppLargeText(
                              text: '\$${detailPlace.place.price.toString()}',
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: detailPlace.place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: detailPlace.place.stars > index
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detailPlace.place.stars.toString(),
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Number  of people in your group",
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: AppBtn(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    size: 60,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    textBtn: (index + 1).toString(),
                                    //icon: Icons.favorite,
                                    //isICon: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: detailPlace.place.description,
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            AppBtn(
                              color: AppColors.textColor1,
                              size: 60,
                              backgroundColor: Colors.white,
                              borderColor: AppColors.textColor1,
                              isICon: true,
                              icon: Icons.favorite_outline,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: ResponsiveBtn(
                                isResponsive: true,
                                textBtn: 'Book trip Now',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:home_rent_app/models/homeStay.dart';
import 'package:home_rent_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'House';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Gap(24 + MediaQuery.of(context).padding.top),
          header(),
          const Gap(20),
          search(),
          const Gap(20),
          categories(),
          const Gap(20),
          nearFromYou(),
          const Gap(20),
          bestForYou()
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: subTitleText,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const Text(
                      'Jakarta',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: titleText,
                      ),
                    ),
                    const Gap(4),
                    Image.asset(
                      'assets/ic_nav_down.png',
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(
              end: 3,
              top: 3,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: badgeColorNotify,
              padding: EdgeInsets.all(4),
            ),
            child: const ImageIcon(
              AssetImage('assets/ic_notification.png'),
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF7F7F7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_search.png',
                    height: 24,
                    width: 24,
                  ),
                  const Gap(8),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                        hintText: 'Search address, or near you',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: subTitleText,
                        )),
                  ))
                ],
              ),
            ),
          ),
          const Gap(8),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: btnGradient,
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/ic_filter.png',
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget categories() {
    final list = ['House', 'Apartment', 'Hotel', 'Villa', 'Cottage'];
    return SizedBox(
      height: 34,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = list[index];
          bool isActive = selectedCategory == category;
          return GestureDetector(
            onTap: () {
              selectedCategory = category;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 10,
                right: index == list.length - 1 ? 20 : 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isActive ? null : const Color(0xffF7F7F7),
                gradient: isActive ? btnGradient : null,
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                  color: Color(isActive ? 0xffFFFFFF : 0xff858585),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget nearFromYou() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near From You',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: titleText,
                ),
              ),
              Text(
                'See more',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: subTitleText,
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        SizedBox(
          height: 272,
          child: ListView.builder(
            itemCount: listNearHomeStay.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              HomeStay homeStay = listNearHomeStay[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: index == listNearHomeStay.length - 1 ? 20 : 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detailHomeStay',
                        arguments: homeStay);
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          homeStay.imageCover,
                          fit: BoxFit.cover,
                          width: 222,
                          height: 272,
                        ),
                      ),
                      Container(
                        width: 222,
                        height: 272,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              stops: [0.38, 1],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff0D0D0D).withOpacity(0),
                                Color(0xff000000).withOpacity(0.8),
                              ],
                            )),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeStay.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textImg,
                              ),
                            ),
                            Text(
                              homeStay.address,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: textImg,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 4, 10, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff000000).withOpacity(0.24),
                          ),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage('assets/ic_location.png'),
                                size: 16,
                                color: Colors.white,
                              ),
                              Gap(4),
                              Text(
                                '1.8 km',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xffFFFFFF),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget bestForYou() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best For You',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: titleText,
                ),
              ),
              Text(
                'See more',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: subTitleText,
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        ListView.builder(
          itemCount: listBestHomeStay.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            HomeStay homeStay = listBestHomeStay[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detailHomeStay',
                    arguments: homeStay);
              },
              child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        homeStay.imageCover,
                        fit: BoxFit.cover,
                        width: 74,
                        height: 70,
                      ),
                    ),
                    Gap(24),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeStay.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: titleText,
                          ),
                        ),
                        Gap(4),
                        Text(
                          'Rp. ${homeStay.price} / Year',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: textPrice,
                          ),
                        ),
                        Gap(4),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/ic_bed.png'),
                                    size: 24,
                                    color: subTitleText,
                                  ),
                                  Gap(8),
                                  Text(
                                    "${homeStay.bedroom} Bedroom",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: subTitleText,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('assets/ic_bath.png'),
                                    size: 24,
                                    color: subTitleText,
                                  ),
                                  Gap(8),
                                  Text(
                                    "${homeStay.bathroom} Bathroom",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: subTitleText,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

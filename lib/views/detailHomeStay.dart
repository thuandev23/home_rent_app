import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';
import 'package:home_rent_app/models/homeStay.dart';
import 'package:home_rent_app/utils/constants.dart';


class DetailHomeStay extends StatelessWidget {
  const DetailHomeStay({super.key, required this.homeStay});
  final HomeStay homeStay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Gap(20 + MediaQuery.of(context).padding.top),
          mainInfo(context),
          Gap(5),
          description(),
          Gap(24),
          owner(),
          Gap(16),
          gallery(),
          Gap(24),
          map(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: buttonPrice(),
    );
  }

  Widget mainInfo(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              homeStay.imageCover,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 304,
            ),
          ),
          Container(
            width: double.infinity,
            height: 304,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  stops: [0.38, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff0D0D0D).withOpacity(0),
                    Color(0xff000000).withOpacity(0.6),
                  ],
                )),
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeStay.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Gap(8),
                Text(
                  '${homeStay.address}, ${homeStay.city}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/ic_bed.png'),
                            size: 24,
                            color: Colors.white,
                          ),
                          Gap(8),
                          Text(
                            "${homeStay.bedroom} Bedroom",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white,
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
                            color: Colors.white,
                          ),
                          Gap(8),
                          Text(
                            "${homeStay.bathroom} Bathroom",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Gap(20),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.black.withOpacity(0.24),
                    ),
                  ),
                  icon: ImageIcon(
                    AssetImage('assets/ic_nav_back.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                IconButton.filled(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.black.withOpacity(0.24),
                    ),
                  ),
                  icon: ImageIcon(
                    AssetImage('assets/ic_bookmark.png'),
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget description() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const Gap(20),
        ReadMoreText(
          homeStay.description,
          trimLength: 100,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: subTitleText,
          ),
          lessStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: textPrice,
          ),
          moreStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: textPrice,
          ),
        ),
      ],
    );
  }

  Widget owner() {
    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/profile.png',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeStay.owner,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: titleText,
                    ),
                  ),
                  Gap(4),
                  Text(
                    'Owner',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: subTitleText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  'assets/ic_phone.png',
                  'assets/ic_message_filled.png',
                ].map((e) {
                  return Container(
                    width: 28,
                    height: 28,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: textPrice.withOpacity(0.5),
                    ),
                    child: Image.asset(
                      e,
                      width: 24,
                      height: 24,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }

  Widget gallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gallery",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(homeStay.gallery.length, (index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.asset(
                    homeStay.gallery[index],
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                  if (index == 3)
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '+5',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    )
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget map() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/map.png',
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buttonPrice() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.28,
                0.62
              ],
              colors: [
                Color(0xffFFFFFF).withOpacity(0),
                Color(0xffFFFFFF),
              ])),
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: subTitleText,
                  ),
                ),
                const Gap(8),
                Text(
                  'Rp. ${homeStay.price} / Year',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: titleText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: btnGradient,
            ),
            child: Text(
              'Rent Now',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

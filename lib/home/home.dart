import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:sizer/sizer.dart';
import 'package:travelapp/gen/assets.gen.dart';
import 'package:travelapp/models.dart/model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TravelList> travelList = [];
  int selectedIndex = 0;
  double imageSize = Adaptive.h(8);

  @override
  void initState() {
    super.initState();
    _getTravelList();
  }

  void _getTravelList() {
    travelList = TravelList.getModels();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: Adaptive.h(55),
                child: Stack(
                  children: [
                    //! bg container
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: Adaptive.h(42),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(75, 22, 22, 22),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: const Color.fromARGB(255, 217, 217, 217),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(travelList[selectedIndex].image),
                          ),
                        ),
                      ),
                    ),
                    //! app bar section
                    Positioned(
                      top: 22,
                      left: 28,
                      right: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //? appbar Container 1
                          Container(
                            height: Adaptive.h(5.7),
                            width: Adaptive.w(12),
                            decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.hardLight,
                              color: const Color.fromARGB(200, 177, 177, 177),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(Assets.icons.backIcon.path),
                          ),
                          //?appbar Container 2
                          Container(
                            height: Adaptive.h(5.7),
                            width: Adaptive.w(12),
                            decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.hardLight,
                              color: const Color.fromARGB(200, 177, 177, 177),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(Assets.icons.heartIcon.path),
                          ),
                        ],
                      ),
                    ),
                    //! Image List
                    Positioned(
                      top: 90,
                      right: 15,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: 100,

                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ImageItems(index);
                          },
                          itemCount:
                              travelList.length, // Use travelList.length here
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 16);
                          },
                        ),
                      ),
                    ),
                    //!back Cont6ainer
                    Positioned(
                      bottom: Adaptive.w(31),
                      left: Adaptive.w(7.5),
                      child: Container(
                        height: Adaptive.h(7.2),
                        width: Adaptive.w(53),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(96, 27, 27, 27),
                          backgroundBlendMode: BlendMode.darken,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    //! text & place
                    Positioned(
                      bottom: Adaptive.w(31),
                      left: Adaptive.w(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelList[selectedIndex].title,
                            style: TextStyle(
                              fontFamily: "dana",
                              fontSize: Adaptive.sw(6.5),
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(color: Colors.white, blurRadius: 6),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.map, color: Colors.white),
                              Text(
                                "${travelList[selectedIndex].subtitle} ${travelList[selectedIndex].location}",
                                style: TextStyle(
                                  fontFamily: "dana",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: Adaptive.sw(3.3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: RowBoxWidgetInformations(),
                    ),
                    //! description feild
                    descriptionFeild(),
                    //! action & price feild
                    actionFeild(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding actionFeild() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                "${travelList[selectedIndex].prise}\$",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                overlayColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              label: Text(
                "Buy Ticket",
                style: TextStyle(
                  fontFamily: "dana",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: Icon(Icons.shop_2_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Padding descriptionFeild() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 36, left: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontFamily: "dana",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          ExpandableText(
            travelList[selectedIndex].description,
            expandText: "show more",

            maxLines: 2,
            collapseText: "show less",
            animation: true,
            animationCurve: ElasticInCurve(),
            style: TextStyle(fontFamily: "dana"),
            collapseOnTextTap: true,
          ),
        ],
      ),
    );
  }

  Row RowBoxWidgetInformations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          color: const Color.fromARGB(255, 237, 237, 237),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: const Color.fromARGB(255, 126, 126, 126),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 90,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Distance",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "dana",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${travelList[selectedIndex].distance} km",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 237, 237, 237),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: const Color.fromARGB(255, 126, 126, 126),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 90,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Temp",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "dana",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${travelList[selectedIndex].temp}° C",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 237, 237, 237),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: const Color.fromARGB(255, 126, 126, 126),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 90,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Rate",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "dana",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${travelList[selectedIndex].rate} km",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //! Image list
  Widget ImageItems(int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            height: selectedIndex == index ? imageSize + 15 : imageSize,
            width: selectedIndex == index ? imageSize + 15 : imageSize,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    selectedIndex == index
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(255, 228, 228, 228),
                width: selectedIndex == index ? 3 : 2,
              ),
              color: const Color.fromARGB(255, 100, 100, 100),
              borderRadius:
                  selectedIndex == index
                      ? BorderRadius.circular(16)
                      : BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(travelList[index].image),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(90, 61, 61, 61),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            duration: Duration(milliseconds: 500),
          ),
        ),
      ],
    );
  }
}

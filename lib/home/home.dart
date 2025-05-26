import 'package:flutter/material.dart';
import 'package:travelapp/gen/assets.gen.dart';
import 'package:travelapp/models.dart/model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TravelList> travelList = [];
  int selectedIndex = 0; // <--- Moved selectedIndex to be a state variable
  double imageSize =
      70; // <--- Good to also make this a state variable if its value doesn't change based on build context

  @override
  void initState() {
    super.initState();
    _getTravelList(); // Initialize travelList here
  }

  void _getTravelList() {
    travelList = TravelList.getModels();
  }

  @override
  Widget build(BuildContext context) {
    // No need to call _getTravelList() here every build, call it in initState
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height / 1.9,
              child: Stack(
                children: [
                  //! bg container
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 360,
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
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.hardLight,
                            color: const Color.fromARGB(200, 177, 177, 177),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(Assets.icons.backIcon.path),
                        ),
                        //?appbar Container 2
                        Container(
                          height: 50,
                          width: 50,
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
                    top: 100,
                    right: 20,
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
                    bottom: size.height / 7,
                    left: size.width / 14,
                    child: Container(
                      height: 60,
                      width: 220,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(92, 27, 27, 27),
                        backgroundBlendMode: BlendMode.darken,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  //! text & place
                  Positioned(
                    bottom: size.height / 7,
                    left: size.width / 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          travelList[selectedIndex].title,
                          style: TextStyle(
                            fontFamily: "dana",
                            fontSize: 24,
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
                                fontSize: 14,
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
            Expanded(
              child: Container(
                width: double.infinity,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

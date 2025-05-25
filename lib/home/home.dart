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
                  //? app bar section
                  Positioned(
                    top: 22,
                    left: 28,
                    right: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //? appbar Container 2
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
                        //appbar Container 2
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 217, 217, 217),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
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
                width: 2,
              ),
              color: const Color.fromARGB(255, 100, 100, 100),
              borderRadius: BorderRadius.circular(16),
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

import 'package:travelapp/gen/assets.gen.dart';

class TravelList {
  String title;
  String image;
  String subtitle;
  String location;
  String description;
  String prise;
  String distance;
  String temp;
  double rate;

  TravelList({
    required this.title,
    required this.image,
    required this.subtitle,
    required this.location,
    required this.description,
    required this.prise,
    required this.distance,
    required this.temp,
    required this.rate,
  });

  static List<TravelList> getModels() {
    List<TravelList> travelList = [];

    travelList.add(
      TravelList(
        title: "Esfahan",
        image: Assets.images.esfahan.path,
        subtitle: "Si-o-se-pol",
        location: "Esfahan - Iran",
        description:
            "Si-o-se-pol was built between 1599 and 1602, under the reign of Abbas the Great, the fifth shah of Safavid Iran. It was constructed under the supervision of Allahverdi Khan Undiladze, the commander-in-chief of the armies, who was of Georgian origin, and was also named after him. The bridge served particularly as a connection between the mansions of the elite, as well as a link to the city's vital Armenian neighborhood of New Julfa.",
        prise: "324",
        distance: "30",
        temp: "29",
        rate: 4.9,
      ),
    );
    travelList.add(
      TravelList(
        title: "Yazd",
        image: Assets.images.yazd.path,
        subtitle: "Windcatcher",
        location: "Yazd - Iran",
        description:
            "Yazd is a city in the Central District of Yazd County, Yazd province, Iran, serving as capital of the province, the county, and the district. At the 2016 census, its population was 529,673. Since 2017, the historical city of Yazd is recognized as a World Heritage Site by UNESCO. Because of generations of adaptations to its desert surroundings, Yazd is known for its Persian architecture. It is nicknamed the 'City of Windcatchers' (شهر بادگیرها Shahr-e Badgirha) from its many examples",
        prise: "465",
        distance: "70",
        temp: "39",
        rate: 4.7,
      ),
    );
    travelList.add(
      TravelList(
        title: "Zahedan",
        image: Assets.images.zahedan.path,
        subtitle: "Makki",
        location: "Zahedan - Iran",
        description:
            "The Jameh Mosque of Makki, officially the Grand Makki Mosque of Zahedan, also known as the Makki Mosque, is one of the world's largest Hanafi mosques, and the largest Sunni Friday mosque in Iran, located in the center of Zahedan, the capital of the Sistan and Baluchestan province. The mosque has a capacity of over 60,000 worshippers at any time.The founder of the mosque was Abdul Aziz Malazada who, until his death in 1987, had the most important Sunni religious authority of the Baloch in Sistan-Balochistan in Iran.",
        prise: "100",
        distance: "20",
        temp: "41",
        rate: 4.5,
      ),
    );
    travelList.add(
      TravelList(
        title: "Shiraz",
        image: Assets.images.shiraz.path,
        subtitle: "Tomb of Hafez",
        location: "Shiraz - Iran",
        description:
            "Shiraz is the fifth-most-populous city of Iran and the capital of Fars province, which has been historically known as Pars and Persis.The Tomb of Hafez , commonly known as Hāfezieh, are two memorial structures erected in the northern edge of Shiraz, Iran, in memory of the celebrated Persian poet Hafez. The open pavilion structures are situated in the Musalla Gardens on the north bank of a seasonal river and house the marble tomb of Hafez. The present buildings, built in 1935 and designed by the French architect and archaeologist André Godard, are at the site of previous structures, the best-known of which was built in 1773. The tomb, its gardens, and the surrounding memorials to other great figures are a focus of tourism in Shiraz.",
        prise: "500",
        distance: "40",
        temp: "28",
        rate: 4.9,
      ),
    );

    return travelList;
  }
}
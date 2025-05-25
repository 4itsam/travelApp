import 'package:travelapp/gen/assets.gen.dart';

class TravelList {
  String title;
  String image;
  String subtitle;
  String location;
  String description;
  String prise;

  TravelList({
    required this.title,
    required this.image,
    required this.subtitle,
    required this.location,
    required this.description,
    required this.prise,
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
      ),
    );
    travelList.add(
      TravelList(
        title: "Esfahan",
        image: Assets.images.yazd.path,
        subtitle: "Yazd",
        location: "Yazd - Iran",
        description:
            "Si-o-se-pol was built between 1599 and 1602, under the reign of Abbas the Great, the fifth shah of Safavid Iran. It was constructed under the supervision of Allahverdi Khan Undiladze, the commander-in-chief of the armies, who was of Georgian origin, and was also named after him. The bridge served particularly as a connection between the mansions of the elite, as well as a link to the city's vital Armenian neighborhood of New Julfa.",
        prise: "465",
      ),
    );
    travelList.add(
      TravelList(
        title: "Zahedan",
        image: Assets.images.zahedan.path,
        subtitle: "makii",
        location: "Zahedan - Iran",
        description:
            "Si-o-se-pol was built between 1599 and 1602, under the reign of Abbas the Great, the fifth shah of Safavid Iran. It was constructed under the supervision of Allahverdi Khan Undiladze, the commander-in-chief of the armies, who was of Georgian origin, and was also named after him. The bridge served particularly as a connection between the mansions of the elite, as well as a link to the city's vital Armenian neighborhood of New Julfa.",
        prise: "100",
      ),
    );
    travelList.add(
      TravelList(
        title: "Shiraz",
        image: Assets.images.shiraz.path,
        subtitle: "Hafez",
        location: "Shiraz - Iran",
        description:
            "Si-o-se-pol was built between 1599 and 1602, under the reign of Abbas the Great, the fifth shah of Safavid Iran. It was constructed under the supervision of Allahverdi Khan Undiladze, the commander-in-chief of the armies, who was of Georgian origin, and was also named after him. The bridge served particularly as a connection between the mansions of the elite, as well as a link to the city's vital Armenian neighborhood of New Julfa.",
        prise: "500",
      ),
    );

    return travelList;
  }
}

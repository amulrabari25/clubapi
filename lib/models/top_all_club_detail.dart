import 'package:clubapicall/models/club.dart';

class TopAllClubDetails {
  List<Club>? topClubDetails;
  List<Club>? allClubDetails;

  TopAllClubDetails();

  TopAllClubDetails.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      topClubDetails = jsonMap['TopClubDetails'] != null &&
              (jsonMap['TopClubDetails'] as List).isNotEmpty
          ? List.from(jsonMap['TopClubDetails'])
              .map((element) => Club.fromJsonMap(element))
              .toSet()
              .toList()
          : null;

      allClubDetails = jsonMap['AllClubDetails'] != null &&
              (jsonMap['AllClubDetails'] as List).isNotEmpty
          ? List.from(jsonMap['AllClubDetails'])
              .map((element) => Club.fromJsonMap(element))
              .toSet()
              .toList()
          : null;
    } catch (e) {
      topClubDetails = [];
      allClubDetails = [];
    }
  }
}

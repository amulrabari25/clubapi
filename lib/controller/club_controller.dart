import 'dart:ffi';

import 'package:clubapicall/models/club.dart';
import 'package:clubapicall/models/top_all_club_detail.dart';
import 'package:clubapicall/repository/club_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ClubController extends ControllerMVC {
  final ClubRepository clubRepository = ClubRepository();
  TopAllClubDetails topAllClubDetails = TopAllClubDetails();
  List<Club> topClubDetails = [];
  List<Club> allClubDetails = [];

  Future<TopAllClubDetails> getClubListApi() async {
    topClubDetails.clear();
    allClubDetails.clear();
    topAllClubDetails.topClubDetails?.clear();
    topAllClubDetails.allClubDetails?.clear();

    topAllClubDetails = await clubRepository.getClubListApi();

    if (topAllClubDetails.topClubDetails?.isNotEmpty == true) {
      topClubDetails = topAllClubDetails.topClubDetails!;
    }

    if (topAllClubDetails.allClubDetails?.isNotEmpty == true) {
      allClubDetails = topAllClubDetails.allClubDetails!;
    }

    print("allClub=${allClubDetails.length}");
    print("topClub=${topClubDetails.length}");

    return topAllClubDetails;
  }

  Future<String> deleteClubApi(int clubId) async {
    return await clubRepository.deleteClubApi(clubId);
  }
}

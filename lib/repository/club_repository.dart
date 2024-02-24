import 'dart:convert';
import 'dart:ffi';

import 'package:clubapicall/models/top_all_club_detail.dart';

import '../util/constant/api_url.dart';
import 'package:http/http.dart' as http;

import '../util/helper/helper.dart';

class ClubRepository {
  Future<TopAllClubDetails> getClubListApi() async {
    final client = http.Client();
    final response = await client.get(Uri.parse(APIUrl.clubListApi),
        headers: Helper().getHeaders());

    if (response.statusCode == 200) {
      print("Response body=${response.body}");
      final parsed = json.decode(response.body);
      TopAllClubDetails topAllClubDetails = TopAllClubDetails();
      topAllClubDetails = TopAllClubDetails.fromJSON(parsed);
      return topAllClubDetails;
    } else {
      if (json.decode(response.body)['message'] != null) {
        return Future.error(json.decode(response.body)['message'] as String);
      } else {
        return Future.error("Something went wrong!");
      }
    }
  }

  Future<String> deleteClubApi(int clubId) async {
    const String url = APIUrl.clubDeleteApi;
    final client = http.Client();
    final response = await client.delete(
      Uri.parse(url),
      headers: Helper().getHeaders(),
      body: json.encode({
        "ClubID": clubId,
        "UpdatedBy": 2,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      if (json.decode(response.body)['message'] != null) {
        return json.decode(response.body)['message'] as String;
      } else {
        return "Successfully deleted club";
      }
    } else {
      if (json.decode(response.body)['message'] != null) {
        return Future.error(json.decode(response.body)['message'] as String);
      } else {
        return Future.error("Something went wrong!");
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gig_test/features/team/models/user_model.dart';

final appRepository = Provider<TeamRepository>(
  (ref) {
    return TeamRepository();
  },
);

class TeamRepository {
  Future<List<User>> getUsers() async {
    final res = await Dio().get('https://jsonplaceholder.typicode.com/users');

    if (res.statusCode != null && res.statusCode == 200) {
      return (res.data as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [];
  }
}

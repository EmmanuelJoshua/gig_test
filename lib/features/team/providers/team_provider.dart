// Controller for shipping
import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gig_test/features/team/models/user_model.dart';
import 'package:gig_test/features/team/repositories/team_repository.dart';

final teamProvider = AsyncNotifierProvider<TeamProvider, List<User>>(() {
  return TeamProvider();
});

class TeamProvider extends AsyncNotifier<List<User>> {
  @override
  FutureOr<List<User>> build() {
    return ref.read(appRepository).getUsers();
  }

  String? catchprase;
  void generateRandomCatchphrase() {
    final random = Random();
    final randomIndex = random.nextInt(state.value!.length);
    catchprase = state.value![randomIndex].company!.catchPhrase!;
    ref.notifyListeners();
  }
}

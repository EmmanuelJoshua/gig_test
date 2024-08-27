import 'package:flutter/material.dart';
import 'package:gig_test/features/dashboard/bottom_nav.dart';
import 'package:gig_test/features/team/screens/team.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TeamPage(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

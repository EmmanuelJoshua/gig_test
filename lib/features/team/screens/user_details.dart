import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gig_test/features/team/models/user_model.dart';
import 'package:gig_test/features/team/providers/team_provider.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Consumer(
          builder: (context, ref, child) {
            return InkWell(
              onTap: () {
                ref.read(teamProvider.notifier).generateRandomCatchphrase();
                Navigator.pop(context);
              },
              child: const Icon(
                FeatherIcons.arrowLeft,
              ),
            );
          },
        ),
        title: Text(
          user.name!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(
              left: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              FeatherIcons.user,
              color: Colors.white,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  user.phone!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          Divider(
            color: Colors.grey.withOpacity(.3),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Website',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  user.website!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          Divider(
            color: Colors.grey.withOpacity(.3),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  user.username!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          Divider(
            color: Colors.grey.withOpacity(.3),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Company',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  user.company!.name!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          Divider(
            color: Colors.grey.withOpacity(.3),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Street',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  user.address!.street!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

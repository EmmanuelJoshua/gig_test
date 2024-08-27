import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gig_test/features/team/providers/team_provider.dart';
import 'package:gig_test/features/team/screens/user_details.dart';

class TeamPage extends ConsumerWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(teamProvider);
    final catchphrase = ref.watch(teamProvider.notifier).catchprase;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Team',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.lightBlue,
            ),
            child: const Row(
              children: [
                Icon(
                  FeatherIcons.users,
                  size: 15,
                  color: Colors.white,
                ),
                Gap(6),
                Text(
                  '34',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          IconButton.filled(
            color: Colors.blue,
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const Gap(10),
        ],
      ),
      body: Column(
        children: [
          const Gap(24),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              border: Border.all(
                color: Colors.grey.withOpacity(.2),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            child: Row(
              children: [
                Icon(
                  FeatherIcons.search,
                  color: Colors.grey.withOpacity(.9),
                  size: 17,
                ),
                const Gap(5),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration.collapsed(
                        hintText: 'Search for messages or users',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.9))),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          users.when(
            data: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text('Empty data'),
                );
              }

              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailsPage(user: user),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                FeatherIcons.user,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.name!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  user.company!.name!,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Column(
                    children: [
                      const Gap(15),
                      Divider(
                        color: Colors.grey.withOpacity(.3),
                      ),
                      const Gap(15),
                    ],
                  ),
                  itemCount: 10,
                ),
              );
            },
            error: (error, stackTrace) {
              return MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Try again',
                ),
              );
            },
            loading: () => const CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
          const Gap(10),
          if (catchphrase != null) Text('Catchphrase: $catchphrase'),
          const Gap(5),
        ],
      ),
    );
  }
}

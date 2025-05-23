import 'package:ally/pages/actions/actions.dart';

import 'package:ally/pages/home/home.dart';
import 'package:ally/pages/me/me.dart';
import 'package:ally/pages/primary/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryPage extends ConsumerStatefulWidget {
  const PrimaryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends ConsumerState<PrimaryPage> {
  PageController primaryPageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    primaryPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    final currentPage = ref.watch(primaryPageIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: currentPage == 0
            ? Text('Home')
            : currentPage == 1
                ? Text("Actions")
                : Text("Me"),
        centerTitle: true,

        ///
        actions: [
          IconButton(
            onPressed: () {
              print("notifications");
            },
            icon: Icon(
              Icons.notifications_none_rounded,
            ),
          ),
        ],
      ),

      ///
      body: PageView.builder(
        controller: primaryPageController,
        itemCount: 3,
        onPageChanged: (value) async {
          ref.read(primaryPageIndexProvider.notifier).setIndex(value);
        },
        itemBuilder: ((context, index) => const [
              HomePage(),
              ActionsPage(),
              MePage(),
            ].elementAt(index)),
      ),

      ///
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          // jump to page
          ref.read(primaryPageIndexProvider.notifier).setIndex(index);
          primaryPageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDetailsPage;
  const MyAppBar({super.key, required this.isDetailsPage});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      titleSpacing: 8,
      leading: isDetailsPage
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ))
          : null,
      backgroundColor: const Color(0xFF285555),
      title: Row(
          mainAxisAlignment: isDetailsPage
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceBetween,
          children: [
            if (!isDetailsPage)
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white)),
          ]),
    );
  }
}

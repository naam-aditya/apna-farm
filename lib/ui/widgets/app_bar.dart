import 'package:flutter/material.dart';

class ApnaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ApnaAppBar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      // title: Column(children: [Text('My App')]),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Row(
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(backgroundColor),
                ),
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(58);
}

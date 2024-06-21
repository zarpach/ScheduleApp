import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String title;
  final String subtitle;
  final IconData leadingIcon;

  const CustomListTile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(25) : const Radius.circular(5),
          topRight: isFirst ? const Radius.circular(25) : const Radius.circular(5),
          bottomLeft: isLast ? const Radius.circular(25) : const Radius.circular(5),
          bottomRight: isLast ? const Radius.circular(25) : const Radius.circular(5),
        ),
      ),
      tileColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.15),
      splashColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.10),
      leading: Icon(leadingIcon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class CustomListTile extends StatelessWidget {
  // ignore: use_super_parameters
  const CustomListTile({
    Key? key,
    required this.title,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      tileColor: color4,
      title: Padding(
        padding: EdgeInsets.only(left: 80),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

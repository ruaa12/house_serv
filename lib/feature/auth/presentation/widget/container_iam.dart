// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class ContainerIam extends StatelessWidget {
  const ContainerIam({
    super.key,
    required this.label,
    required this.text,
    required this.onpressed,
  });
  final String? label;
  final String? text;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 1700,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: color4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                label!,
                style: const TextStyle(
                  fontSize: 24,
                  color: color2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                text!,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 4,
          ),
          IconButton(
              onPressed: onpressed,
              icon: const Icon(
                Icons.check,
                color: color3,
                size: 35,
                shadows: [
                  BoxShadow(
                    color: color1,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

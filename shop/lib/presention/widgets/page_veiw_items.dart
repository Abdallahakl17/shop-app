import 'package:flutter/material.dart';
import 'package:shop/presention/widgets/custom_veiw.dart';

Widget buildBoarding(BuildContext context, CustomVeiw boarding) {
  return Column(
    children: [
      Expanded(child: Image.asset(boarding.image)),
      const SizedBox(
        height: 50,
      ),
      Text(
        boarding.head,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          boarding.title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ],
  );
}

import 'package:dotted_border/dotted_border.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.title});
  final String title;

  Color? colorScheme(String title) {
    switch (title) {
      case 'Expense':
        return const Color(0xFFFD3C4A);
      case 'Income':
        return const Color(0xFF00A86B);
      case 'Tranfer':
        return const Color(0xFF0077FF);
      default:
        Colors.amber;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Transsaction',
          style: $styles.text.quote2.copyWith(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                size: 24,
              ))
        ],
      ),
      body: SeparatedColumn(
        padding: const EdgeInsets.all(16),
        separatorBuilder: () => const Gap(16),
        children: [
          Container(
            height: 282,
            decoration: BoxDecoration(
              color: colorScheme(title) ?? Colors.amber,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    child: Text(
                      '\$120',
                      style: $styles.text.quote1,
                    ),
                  ),
                  Text(
                    'Buy some grocery',
                    style: $styles.text.body,
                  ),
                  Text(
                    'Saturday 4 June 2021 16:20',
                    style: $styles.text.body,
                  ),
                ],
              ),
            ),
          ),
          DottedBorder(child: const Divider()),
          Text(
            'Description',
            style: $styles.text.bodyBold,
          ),
          SizedBox(
            height: 76,
            child: Text(
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
              style: $styles.text.body,
              textAlign: TextAlign.justify,
              maxLines: 5,
            ),
          ),
          Text(
            'Attachment',
            style: $styles.text.bodyBold,
          ),
          Container(
            height: 116,
            decoration: BoxDecoration(
              color: $styles.colors.accent1,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const Spacer(),
          MyButton(
            title: 'Edit',
            color: $styles.colors.accent1,
          )
        ],
      ),
    );
  }
}

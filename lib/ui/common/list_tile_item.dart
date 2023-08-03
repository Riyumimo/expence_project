import 'package:intl/intl.dart';

import '../../commons_libs.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    this.ontap,
    this.category,
    this.description,
    this.amount,
    this.type,
    this.createAt,
  });
  final Function()? ontap;
  final String? category;
  final String? description;
  final double? amount;
  final String? type;
  final DateTime? createAt;
  Color? _colorIcon(String category) {
    switch (category) {
      case "Food":
        return const Color(0xFFFDD5D7);
      case "Subcriptions":
        return const Color(0xFFEEE5FF);
      case "Shoping":
        return const Color(0xFFFCEED4);
      case "Salary":
        return const Color(0xFFCFFAEA);
      case "Bussines":
        return const Color(0xFFEEE5FF);
      case "Monthly":
        return const Color(0xFFBDDCFF);
      default:
    }
    return Colors.amber;
  }

  String? _getIcon(String category) {
    switch (category) {
      case "Food":
        return 'assets/icons/restaurant.svg';
      case "Subcriptions":
        return 'assets/icons/recurring-bill.svg';
      case "Shoping":
        return 'assets/icons/shopping-bag.svg';
      case "Salary":
        return 'assets/icons/salary.svg';
      case "Bussines":
        return 'assets/icons/recurring-bill.svg';

      case "Monthly":
        return 'assets/icons/car.svg';
      default:
    }
    return null;
  }

  String _getDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: $styles.colors.accent1.withOpacity(.3),
        hoverColor: $styles.colors.accent1.withOpacity(.3),
        onTap: ontap,
        child: SizedBox(
          width: double.infinity,
          height: height * 0.1099,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: _colorIcon(category ?? '') ?? Colors.accents[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _getIcon(category ?? '') == null
                    ? Icon(
                        Icons.shopping_bag_rounded,
                        size: 40,
                        color: $styles.colors.accent1,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          _getIcon(category!)!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const Gap(9),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          category ?? '',
                          style: $styles.text.bodyBold,
                        ),
                        const Spacer(),
                        Text(
                            '\$ ${type == 'income' ? "+" : "-"}${amount ?? ''}',
                            style: $styles.text.bodyBold.copyWith(
                                color: type == "income"
                                    ? Colors.green[800]
                                    : Colors.red[800]))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          description ?? '',
                          maxLines: 1,
                          style: $styles.text.body,
                        ),
                        const Spacer(),
                        Text(
                          _getDateTime(createAt ?? DateTime.now()),
                          style: $styles.text.body,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

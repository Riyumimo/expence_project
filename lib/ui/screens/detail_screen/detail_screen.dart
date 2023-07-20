import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/my_button.dart';

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
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SeparatedColumn(
            // padding: const EdgeInsets.only(bottom),
            separatorBuilder: () => const Gap(16),
            children: [
              Container(
                height: height * .34,
                decoration: BoxDecoration(
                  color: colorScheme(title) ?? Colors.amber,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: height * .0788,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Colors.white,
                              ),
                              Text(
                                'Detail Transaction',
                                textAlign: TextAlign.center,
                                style: $styles.text.quote2.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: 0),
                              ),
                              const Icon(
                                Icons.delete_forever,
                                size: 32,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const Gap(16),
                        SizedBox(
                          height: height * .08,
                          child: Text(
                            '\$120',
                            style: $styles.text.quote1.copyWith(
                              height: 1,
                              fontSize: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Buy some grocery',
                          style: $styles.text.body.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Saturday 4 June 2021 16:20',
                          style: $styles.text.body.copyWith(
                            fontSize: 13,
                            color: const Color(0xFFFCFCFC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Gap(16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SeparatedColumn(
                    separatorBuilder: () => const Gap(16),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 2,
                        color: $styles.colors.greyMedium,
                      ),
                      Text(
                        'Description',
                        style: $styles.text.bodyBold,
                      ),
                      SizedBox(
                        height: height * .0936,
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: height / 2 - height * .1847,
            // left: width / 2 - 50,
            child: Container(
              height: 70,
              width: width * .914,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: const Color(0xFFF1F1FA))),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                              color: const Color(0xFF91919F), fontSize: 14),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        )
                      ],
                    ),
                    // const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                              color: const Color(0xFF91919F), fontSize: 14),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        )
                      ],
                    ),
                    // const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                              color: const Color(0xFF91919F), fontSize: 14),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/logic/permission/camera_permission.dart';
import 'package:expence_project/logic/permission/galery_permission.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/account_model.dart';
import '../../../logic/account_bloc/account_bloc.dart';

part './widgets/attachment_widget.dart';
part './widgets/input_record.dart';
part './widgets/item_bottom_sheet.dart';
part './widgets/record_button.dart';

class RecordKeppingScreen extends StatefulWidget {
  final String? title;
  const RecordKeppingScreen({super.key, this.title});

  @override
  State<RecordKeppingScreen> createState() => _RecordKeppingScreenState();
}

class _RecordKeppingScreenState extends State<RecordKeppingScreen> {
  final TextEditingController _textMoneyController = TextEditingController();
  final TextEditingController _textDescController = TextEditingController();
  bool _isRepeat = false;
  String _hintCategory = 'Category';
  String _hintWallet = 'Wallet';
  List<String> categoryListExpense = [
    "Food",
    "Subcriptions",
    "Shoping",
    "Monthly"
  ];
  List<String> categoryListIncome = [
    "Salary",
    "Bussines",
    "Divide",
  ];
  List<String> walletList = [];
  String? uid;

  File? _image;
  CameraImagePickerHandler? cameraImagePickerHandler;
  GaleryPermissionHandler? galeryPermissionHandler;
  String? capturedImagePath;

  @override
  void dispose() {
    _textMoneyController.dispose();
    _textDescController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<AccountBloc>(context).add(AccountEvent.started());
    cameraImagePickerHandler = CameraImagePickerHandler();
    galeryPermissionHandler = GaleryPermissionHandler();
    super.initState();
  }

  String? getUid(List<Account> list, String name) {
    String? uid;
    for (var element in list) {
      if (name == element.name) {
        uid = element.uid;
        continue;
      }
    }
    print(uid);
    return uid;
  }

  Future<void> _pickImage() async {
    final hasPermission =
        await galeryPermissionHandler!.requestGalleryPermission();
    if (!hasPermission) return;
    final picker = ImagePicker();
    final pickImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }
  }

  Future<void> _takePickture() async {
    final hasPermission =
        await cameraImagePickerHandler!.requestCameraPermision();
    if (!hasPermission) return;
    final imagePath = await appRoute.push(ScreenPaths.camera);

    try {
      if (imagePath != null) {
        setState(() {
          _image = File(imagePath.toString());
        });
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  IconData? categoryIcon(String category) {
    switch (category) {
      case "Food":
        return Icons.food_bank_outlined;
      case "Subcriptions":
        return Icons.table_view_rounded;
      case "Shoping":
        return Icons.shopping_bag_rounded;
      case "Monthly":
        return Icons.calendar_month;
      default:
    }
    return null;
  }

  IconData? walletIcon(String wallet) {
    switch (wallet) {
      case "Bank":
        return Icons.wallet;
      case "E-Money":
        return Icons.paypal;
      case "Cash":
        return Icons.money;
      default:
    }
    return null;
  }

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
    // print(_image);
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              colorScheme(widget.title!) ?? $styles.colors.offWhite,
          centerTitle: true,
          title: Text(widget.title ?? " "),
        ),
        backgroundColor: colorScheme(widget.title!) ?? $styles.colors.offWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                'How Much?',
                style: $styles.text.body
                    .copyWith(color: $styles.colors.offWhite.withOpacity(.7)),
              ),
            ),
            const Gap(13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                children: [
                  Text(
                    '\$',
                    style: $styles.text.h1.copyWith(color: Colors.white),
                  ),
                  Expanded(
                    child: RecordInputField(
                        textMoneyController: _textMoneyController),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
              ),
              child: SeparatedColumn(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                separatorBuilder: () => const Gap(12),
                children: [
                  MyInputField(
                    colorText: _hintCategory == "Category" ? false : true,
                    hint: _hintCategory,
                    color: $styles.colors.white,
                    widget: DropdownButton(
                      dropdownColor: Colors.white,
                      iconSize: 32,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/icons/arrow-down.svg',
                        ),
                      ),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          _hintCategory = value!;
                        });
                      },
                      elevation: 4,
                      items: widget.title == 'Income'
                          ? categoryListIncome
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Icon(categoryIcon(value),
                                          color: $styles.colors.greyStrong),
                                      const Gap(5),
                                      Text(
                                        value,
                                        style: $styles.text.bodyBold.copyWith(
                                            color: $styles.colors.greyStrong),
                                      ),
                                    ],
                                  ));
                            }).toList()
                          : categoryListExpense
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Icon(categoryIcon(value),
                                          color: $styles.colors.greyStrong),
                                      const Gap(5),
                                      Text(
                                        value,
                                        style: $styles.text.bodyBold.copyWith(
                                            color: $styles.colors.greyStrong),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                    ),
                  ),
                  //Description
                  MyInputField(
                    colorText:
                        _textDescController.value.text != '' ? true : false,
                    textEditingController: _textDescController,
                    hint: 'Description',
                    color: $styles.colors.white,
                  ),

                  //Wallet
                  BlocBuilder<AccountBloc, AccountState>(
                    builder: (context, state) {
                      return state.map(initial: (initial) {
                        return const CircularProgressIndicator();
                      }, loading: (loading) {
                        return const CircularProgressIndicator();
                      }, loaded: (loaded) {
                        final List<String> name = [];
                        for (var element in loaded.listAccount) {
                          name.add(element.name!);
                        }
                        walletList = name;
                        return MyInputField(
                          colorText: _hintWallet == 'Wallet' ? false : true,
                          hint: _hintWallet,
                          color: $styles.colors.white,
                          widget: DropdownButton(
                            dropdownColor: Colors.white,
                            iconSize: 32,
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/arrow-down.svg',
                              ),
                            ),
                            underline: Container(),
                            onChanged: (value) {
                              setState(() {
                                _hintWallet = value!;
                                uid = getUid(loaded.listAccount, value);
                              });
                              // print(uid);Fcon
                            },
                            elevation: 4,
                            items: walletList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      Icon(walletIcon(value),
                                          color: $styles.colors.greyStrong),
                                      const Gap(5),
                                      Text(
                                        value,
                                        style: $styles.text.bodyBold.copyWith(
                                            color: $styles.colors.greyStrong),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          ),
                        );
                      }, error: (error) {
                        return const CircularProgressIndicator();
                      });
                    },
                  ),

                  _image == null
                      ? AttachmentWidget(
                          ontap: () {
                            bottomSheet(context);
                          },
                        )
                      : Row(
                          children: [
                            SizedBox(
                              width: 112,
                              height: 112,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -15,
                                      right: -15,
                                      child: IconButton(
                                        iconSize: 16,
                                        onPressed: () async {
                                          setState(() {
                                            if (_image!.existsSync()) {
                                              _image!.deleteSync();
                                              _image = null;
                                              print(
                                                  'File deleted successfully');
                                            } else {
                                              print('File not found');
                                            }
                                          });
                                          print(_image?.existsSync());
                                        },
                                        icon: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                                color: $styles.colors.greyMedium
                                                    .withOpacity(.7),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 59,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Repeat',
                                  style: $styles.text.bodyBold,
                                ),
                                Text(
                                  'Repeat transaction',
                                  style: $styles.text.bodySmall.copyWith(
                                      height: 0,
                                      color: $styles.colors.textWhite),
                                )
                              ],
                            ),
                          ),
                          Switch(
                              value: _isRepeat,
                              onChanged: (value) {
                                setState(() {
                                  _isRepeat = value;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  RecordButton(
                    onpressed: () {
                      print(uid);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // Method //

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (contex) {
          return Container(
              height: 200,
              // color: Colors.white,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: $styles.colors.greyMedium),
                    ),
                    const Spacer(),
                    Expanded(
                        child: SeparatedRow(
                      separatorBuilder: () => const Gap(8),
                      children: [
                        ItemBottomSheet(
                          title: 'Camera',
                          icon: Icons.camera_enhance_rounded,
                          ontap: () async {
                            appRoute.pop();
                            await _takePickture();
                          },
                        ),
                        ItemBottomSheet(
                          title: 'Image',
                          icon: Icons.image_rounded,
                          ontap: () async {
                            appRoute.pop();
                            await _pickImage();
                          },
                        ),
                        ItemBottomSheet(
                          title: 'Dokument',
                          icon: Icons.file_upload,
                          ontap: () {},
                        ),
                      ],
                    ))
                  ],
                ),
              ));
        });
  }
}

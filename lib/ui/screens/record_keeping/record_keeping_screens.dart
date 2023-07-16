import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/logic/permission/camera_permission.dart';
import 'package:expence_project/logic/permission/galery_permission.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/input_field.dart';
import 'package:image_picker/image_picker.dart';

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
  List<String> categoryList = ["Food", "Subcriptions", "Shoping", "Monthly"];
  List<String> walletList = ["Bank", "E-Money", "Cash"];
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
    cameraImagePickerHandler = CameraImagePickerHandler();
    galeryPermissionHandler = GaleryPermissionHandler();
    super.initState();
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
    print(_image);
    switch (widget.title) {
      case 'Income':
        break;
      default:
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme(widget.title!) ?? $styles.colors.offWhite,
        centerTitle: true,
        title: Text(widget.title ?? " "),
      ),
      backgroundColor: colorScheme(widget.title!) ?? $styles.colors.offWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Text(
              'How Much?',
              style: $styles.text.body
                  .copyWith(color: $styles.colors.offWhite.withOpacity(.7)),
            ),
          ),
          Gap(13),
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
          Gap(16),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            ),
            child: SeparatedColumn(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              separatorBuilder: () => Gap(12),
              children: [
                MyInputField(
                  colorText: _hintCategory == "Category" ? false : true,
                  hint: _hintCategory,
                  color: $styles.colors.white,
                  widget: DropdownButton(
                    dropdownColor: Colors.white,
                    iconSize: 32,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        //
                        color: Color(0xFF91919F),
                      ),
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      setState(() {
                        _hintCategory = value!;
                      });
                    },
                    elevation: 4,
                    items: categoryList
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
                                style: $styles.text.bodyBold
                                    .copyWith(color: $styles.colors.greyStrong),
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
                MyInputField(
                  colorText: _hintWallet == 'Wallet' ? false : true,
                  hint: _hintWallet,
                  color: $styles.colors.white,
                  widget: DropdownButton(
                    dropdownColor: Colors.white,
                    iconSize: 32,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        //
                        color: Color(0xFF91919F),
                      ),
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      setState(() {
                        _hintWallet = value!;
                      });
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
                              Gap(5),
                              Text(
                                value,
                                style: $styles.text.bodyBold
                                    .copyWith(color: $styles.colors.greyStrong),
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                ),

                _image == null
                    ? AttachmentWidget(
                        ontap: () {
                          bottomSheet(context);
                        },
                      )
                    : Row(
                        children: [
                          Container(
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
                                            print('File deleted successfully');
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
                  child: Container(
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
                                    height: 0, color: $styles.colors.textWhite),
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
                RecordButton()
              ],
            ),
          )
        ],
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
                    Spacer(),
                    Expanded(
                        child: SeparatedRow(
                      separatorBuilder: () => Gap(8),
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

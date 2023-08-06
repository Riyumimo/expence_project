import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/logic/account_bloc/account_bloc.dart';
import 'package:expence_project/logic/auth_bloc/authentication_bloc.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  // bool isBorder = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            appBar(width, height),
            Gap(height * .04),
            GestureDetector(
                onTap: () {
                  appRoute.push(ScreenPaths.account);
                },
                child: listTile(height, width, true,
                    icon: Icons.account_balance_wallet, name: 'Account')),
            listTile(height, width, false,
                icon: Icons.settings, name: 'Setting'),
            listTile(height, width, false,
                icon: Icons.upload_file, name: 'Export Data'),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        title: const Text('Log Out'),
                        content: const Text('Are You Sure Quit?'),
                        actions: [
                          FilledButton(
                              onPressed: () {
                                context
                                    .read<AccountBloc>()
                                    .add(const AccountEvent.delete());

                                context
                                    .read<TransactionBloc>()
                                    .add(const TransactionBlocEvent.delete());
                                context
                                    .read<AuthenticationBloc>()
                                    .add(const AuthenticationEvent.signOut());
                                appRoute.pop();
                              },
                              child: const Text('Ok')),
                          FilledButton(
                              onPressed: () {
                                appRoute.pop();
                              },
                              child: const Text('Cancel'))
                        ],
                      );
                    });
              },
              child: listTile(height, width, true,
                  isBottom: false, icon: Icons.logout, name: 'Logout'),
            )
          ],
        ),
      ),
    );
  }

  Container listTile(double height, double width, bool isBoders,
      {bool isBottom = true, String? name, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: height * .1099,
      width: width * .896,
      // cdecolor: Colors.amber,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isBoders
              ? isBottom
                  ? const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24))
                  : const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(24),
                      bottomEnd: Radius.circular(24))
              : null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            height: height * .062,
            width: width * .1386,
            decoration: BoxDecoration(
                color: const Color(0xFFEEE5FF),
                borderRadius: BorderRadius.circular(16)),
            child: Icon(
              icon,
              size: 32,
              color: const Color(0xFF7F3DFF),
            ),
          ),
          const Gap(9),
          Text(
            name ?? '',
            style: $styles.text.bodyBold,
          )
        ],
      ),
    );
  }

  Padding appBar(double width, double height) {
    return Padding(
      padding: EdgeInsets.only(left: width * .09, top: 30, right: 16),
      child: SizedBox(
        height: height * .0985,
        // color: Colors.amber,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: height * .0985,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFC4C4C4),
                  foregroundColor: Colors.black,
                  radius: height * .0985,
                  foregroundImage: const AssetImage(
                    'assets/images/verification.png',
                  ),
                ),
              ),
            ),
            const Gap(8),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.map(error: (value) {
                  return const CircularProgressIndicator();
                }, initial: (value) {
                  return const CircularProgressIndicator();
                }, loaded: (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          value.userModel.email,
                          maxLines: 2,
                          style: $styles.text.body,
                        ),
                      ),
                      Text(
                        value.userModel.name,
                        style: $styles.text.quote2
                            .copyWith(color: const Color(0xFF161719)),
                      ),
                    ],
                  );
                });
              },
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}

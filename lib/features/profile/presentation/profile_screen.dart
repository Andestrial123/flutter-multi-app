import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button.dart';
import 'package:flutter_multi_app/shared/widgets/buttons/next_button_outlined.dart';
import 'package:flutter_multi_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final infoStyle = TextStyle(
    fontSize: ScreenUtil().setHeight(14),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.cupcakeBakeryShop.tr(),
                style: TextStyle(
                  color: CustomColors.brownDark,
                  fontSize: ScreenUtil().setHeight(16),
                  fontFamily: 'CustomFont',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                LocaleKeys.profile.tr(),
                style: TextStyle(
                  color: CustomColors.lightRedColor,
                  fontSize: ScreenUtil().setHeight(14),
                  fontFamily: 'CustomFont',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: CustomColors.whiteColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_basket_outlined),
              iconSize: 34,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  radius: 85,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.userName.tr(),
              style: TextStyle(
                fontSize: ScreenUtil().setHeight(16),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              //will be dynamic
              'username@gmail.com',
              style: TextStyle(
                fontSize: ScreenUtil().setHeight(14),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Row(
                      children: [
                        Text(
                          //language will be dynamic
                          '${LocaleKeys.language.tr()}: English',
                          style: TextStyle(
                              fontSize: ScreenUtil().setHeight(14),
                              fontWeight: FontWeight.w900),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right_outlined,
                          color: CustomColors.brownDark,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    LocaleKeys.personalInformation.tr(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setHeight(14),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                    child: Divider(
                      thickness: 3,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${LocaleKeys.email.tr()}:  username@gmail.com',
                    style: infoStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${LocaleKeys.phone.tr()}:  123123123',
                    style: infoStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${LocaleKeys.gender.tr()}:  male',
                    style: infoStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${LocaleKeys.dateOfBirth.tr()}:  12.12.1912',
                    style: infoStyle,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    LocaleKeys.security.tr(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setHeight(14),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
                    child: Divider(
                      thickness: 3,
                      color: Colors.black54,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.changePassword.tr(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setHeight(14),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right_outlined,
                          color: CustomColors.brownDark,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.deleteAccount.tr(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setHeight(14),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right_outlined,
                          color: CustomColors.brownDark,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: NextButtonOutlined(
                          onPressed: () {},
                          text: LocaleKeys.editProfile.tr(),
                          textColor: CustomColors.brownDark,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: NextButton(onPressed: () {}, text: LocaleKeys.logout.tr()),
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

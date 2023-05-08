import 'package:shop_test/core/utils/exports.dart';

class DashMenus extends StatelessWidget {
  const DashMenus({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: HexColor('#F6F6F6'),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SvgPicture.asset(icon.svg),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14.sp,
                color: BrandColors.textColor,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

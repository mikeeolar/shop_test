import 'package:shop_test/core/utils/exports.dart';

BottomNavigationBarItem bottomBarItem({
  required String name,
  required String icon,
  required String activeIcon,
  required int cIndex,
  required int index,
  required BuildContext context,
  double? height,
  double? width,
}) {
  return BottomNavigationBarItem(
    label: name,
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SvgPicture.asset(
        icon,
        height: height ?? 20.h,
        width: width ?? 20.h,
        colorFilter: ColorFilter.mode(
            HexColor('#4DAB96').withOpacity(0.6), BlendMode.srcIn),
        fit: BoxFit.fill,
      ),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SvgPicture.asset(
        activeIcon,
        height: height ?? 20.h,
        width: width ?? 20.h,
        colorFilter: ColorFilter.mode(HexColor('#4DAB96'), BlendMode.srcIn),
      ),
    ),
  );
}

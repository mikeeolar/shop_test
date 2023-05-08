import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/dashboard/dashboard_viewmodel.dart';

class StoreListItems extends StatelessWidget {
  const StoreListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, viewModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                viewModel.navigateToDashItemView();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'clothe1'.jpg,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 5,
                          right: 10,
                          child: SvgPicture.asset(
                            'love'.svg,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shirt',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: BrandColors.textColor,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Essentials Men\'s Short-\nSleeve Crewnect T-shirt',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: HexColor('#F6A341'),
                                  size: 15,
                                ),
                                Text(
                                  '4.9 | 2356',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 14.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                '\$12.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: HexColor('#4DAB96'),
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                viewModel.navigateToDashItemView();
              },
              child: Column(
                children: [
                  SizedBox(
                    width: 180,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'clothe2'.jpg,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 5,
                          right: 10,
                          child: SvgPicture.asset(
                            'love'.svg,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shirt',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: BrandColors.textColor,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Essentials Men\'s Short-\nSleeve Crewnect T-shirt',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: HexColor('#F6A341'),
                                  size: 15,
                                ),
                                Text(
                                  '4.9 | 2356',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 14.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                '\$12.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: HexColor('#4DAB96'),
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

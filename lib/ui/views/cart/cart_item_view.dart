import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/cart/cart_item_viewmodel.dart';

class CartItemView extends StatefulWidget {
  const CartItemView({super.key});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartItemViewModel>.reactive(
      viewModelBuilder: () => CartItemViewModel(),
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async {
          locator<UtilityService>().setShowNav(true);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                locator<UtilityService>().setShowNav(true);
                                locator<NavigationService>().back();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 10, left: 20.w, top: 10, bottom: 10),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black.withOpacity(0.5),
                                  weight: 0.1,
                                  fill: 0.1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset('love'.svg),
                        SizedBox(
                          width: 20.w,
                        ),
                        SvgPicture.asset('share'.svg),
                        SizedBox(
                          width: 20.w,
                        ),
                        SvgPicture.asset(
                          'cart'.svg,
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 9,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: HexColor('#E55986'),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '1',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 320.h,
                          decoration: BoxDecoration(
                            color: HexColor('#F7F7F7'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              Image.asset('clothe2'.jpg),
                              Positioned(
                                top: 20,
                                left: 10,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E9EBEA'),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Image.asset(
                                        'thumb1'.jpg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E9EBEA'),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Image.asset(
                                        'thumb2'.jpg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E9EBEA'),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Image.asset(
                                        'thumb3'.jpg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E9EBEA'),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Image.asset(
                                        'thumb4'.jpg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'tok'.svg,
                              height: 12,
                              colorFilter: const ColorFilter.mode(
                                  BrandColors.textColor, BlendMode.srcIn),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'tokobaju.id',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 15.sp,
                                      color: BrandColors.textColor,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Essentials Men\'s Short-Sleeve Crewnect T-shirt',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 20.sp,
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
                                  size: 20,
                                ),
                                Text(
                                  '4.9 Ratings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.circle,
                              color: BrandColors.textColor,
                              size: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '2.3k + Reviews',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.circle,
                              color: BrandColors.textColor,
                              size: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '2.9k + Sold',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(right: 100.w),
                          height: 32.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ))),
                          child: DefaultTabController(
                            length: 2,
                            child: TabBar(
                              controller: _controller,
                              indicatorColor: HexColor('#4DAB96'),
                              indicatorPadding: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.zero,
                              labelColor: HexColor('#4DAB96'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    width: 2.0, color: HexColor('#4DAB96')),
                                insets:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                              ),
                              tabs: const [
                                Tab(
                                  text: 'About Item',
                                ),
                                Tab(
                                  text: 'Reviews',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Brand:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      'ChArmkpR',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Text(
                                      'Category:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      'Casual Shirt',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Text(
                                      'Condition:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      'New',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Color:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      'Aprikot',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Text(
                                      'Material:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      'Polyester',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Text(
                                      'Heavy:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      '200g',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const Divider(
                          thickness: 1,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Description:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Icon(
                                      Icons.circle,
                                      color: BrandColors.textColor,
                                      size: 5,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      'Long-sleeve dress shirt in classic fit featuring button-down color',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: BrandColors.textColor,
                                    size: 5,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      'Patch Pocket on Left Chest',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: BrandColors.textColor,
                                    size: 5,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      'Durable Combination Cotton Fabric',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: BrandColors.textColor,
                                    size: 5,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      'Confortable and quality dress shirt',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Icon(
                                      Icons.circle,
                                      color: BrandColors.textColor,
                                      size: 5,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      'Go to classic button-down dress shirt for all special occassions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'Check us if there is anything you need to ask about the product',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 12.sp,
                                color: BrandColors.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'See more',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: BrandColors.textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.expand_less,
                              color: BrandColors.textColor,
                              size: 15,
                            )
                          ],
                        ),
                        SizedBox(height: 25.h),
                        const Divider(
                          thickness: 1,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'Shipping Information',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        SizedBox(height: 25.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Delivery:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  'Shipping from Jarkata, Indonesia',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  'Shipping:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  'FREE International Shipping:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  'Arrive:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: BrandColors.textColor,
                                          fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  'Estimated arrival on 25 - 27 Oct 2022',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const Divider(thickness: 1),
                            SizedBox(height: 25.h),
                            Text(
                              'Seller Information:',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: HexColor('#EEEFF1'),
                                  child: Text(
                                    'Thrifting\nStores',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Thrifting_Store',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        'Active 5 Mins ago | 96.7% Positive Feedback',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontSize: 12.sp,
                                                color: BrandColors.textColor,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 8.h),
                                      OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              maximumSize: const Size(140, 40),
                                              side: BorderSide(
                                                width: 1.5,
                                                color: HexColor('#4DAB96'),
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'tok'.svg,
                                                height: 15,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        BrandColors.textColor,
                                                        BlendMode.srcIn),
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                'Visit Store',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                        fontSize: 15.sp,
                                                        color: BrandColors
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h),
                            const Divider(thickness: 1),
                            SizedBox(height: 20.h),
                            Text(
                              'Reviews & Ratings',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '4.9',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 35.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            '  / 5.0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                    fontSize: 15.sp,
                                                    color:
                                                        BrandColors.textColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25.h),
                                    Text(
                                      '2.3k + Reviews',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 15.sp,
                                            color: BrandColors.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 15,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '5',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 1.w),
                                        LinearPercentIndicator(
                                          width: 120,
                                          animation: true,
                                          lineHeight: 7.0,
                                          animationDuration: 2500,
                                          percent: 0.8,
                                          barRadius: const Radius.circular(10),
                                          progressColor: HexColor('#4DAB96'),
                                        ),
                                        Text(
                                          '1.5k',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 15,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '4',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 1.w),
                                        LinearPercentIndicator(
                                          width: 120,
                                          animation: true,
                                          lineHeight: 7.0,
                                          animationDuration: 2500,
                                          percent: 0.5,
                                          barRadius: const Radius.circular(10),
                                          progressColor: HexColor('#4DAB96'),
                                        ),
                                        Text(
                                          '710',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 15,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '3',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 1.w),
                                        LinearPercentIndicator(
                                          width: 120,
                                          animation: true,
                                          lineHeight: 7.0,
                                          animationDuration: 2500,
                                          percent: 0.1,
                                          barRadius: const Radius.circular(10),
                                          progressColor: HexColor('#4DAB96'),
                                        ),
                                        Text(
                                          '140',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 15,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '2',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 1.w),
                                        LinearPercentIndicator(
                                          width: 120,
                                          animation: true,
                                          lineHeight: 7.0,
                                          animationDuration: 2500,
                                          percent: 0.05,
                                          barRadius: const Radius.circular(10),
                                          progressColor: HexColor('#4DAB96'),
                                        ),
                                        Text(
                                          '10',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: HexColor('#F6A341'),
                                          size: 15,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '1',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(width: 1.w),
                                        LinearPercentIndicator(
                                          width: 120,
                                          animation: true,
                                          lineHeight: 7.0,
                                          animationDuration: 2500,
                                          percent: 0.02,
                                          barRadius: const Radius.circular(10),
                                          progressColor: HexColor('#4DAB96'),
                                        ),
                                        Text(
                                          '4',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 35.h),
                            Text(
                              'Reviews with images & videos',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: HexColor('#E9EBEA'),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'thumb1'.jpg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: HexColor('#E9EBEA'),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'thumb2'.jpg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: HexColor('#E9EBEA'),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'thumb3'.jpg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: HexColor('#E9EBEA'),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'thumb4'.jpg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Top Reviews',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      'Showing 3 of 2.3k + reviews',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: BrandColors.textColor,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: HexColor('#EEEFF1'),
                                    border: Border.all(
                                      color: HexColor('#4DAB96'),
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Popular',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      const Icon(
                                        Icons.expand_more,
                                        color: BrandColors.textColor,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Column(
                                children: List.generate(
                              5,
                              (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 15,
                                            child: Icon(Icons.person),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Eren Y****r',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: HexColor('#F6A341'),
                                            size: 15,
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            '5.0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          SizedBox(width: 15.w),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              '****',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: HexColor('#EEEFF1'),
                                            border: Border.all(
                                              color: HexColor('#4DAB96'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            'Product in good condition',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: HexColor('#EEEFF1'),
                                            border: Border.all(
                                              color: HexColor('#4DAB96'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            'Very fast delivery',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                            color: HexColor('#EEEFF1'),
                                            border: Border.all(
                                              color: HexColor('#4DAB96'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            'Fast wallet transfer',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    'According to my expectation. This is the best\nThank you.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up,
                                            color: HexColor('#4DAB96'),
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            'Helpful ?',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 12.sp,
                                                  color: HexColor('#4DAB96'),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Yesterday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontSize: 12.sp,
                                              color: HexColor('#4DAB96'),
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  const Divider(thickness: 1),
                                  SizedBox(height: 15.h),
                                ],
                              ),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: HexColor('#EEEFF1'),
                                      radius: 13,
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      '1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: HexColor('#4DAB96'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Text(
                                      '2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: HexColor('#4DAB96'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Text(
                                      '3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: HexColor('#4DAB96'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Text(
                                      '....',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: HexColor('#4DAB96'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(width: 20.w),
                                    CircleAvatar(
                                      backgroundColor: HexColor('#EEEFF1'),
                                      radius: 13,
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See reviews',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 12.sp,
                                        color: HexColor('#4DAB96'),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recommendation',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  'See more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 12.sp,
                                        color: HexColor('#4DAB96'),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Recommendations(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: HexColor('#EEEFF1'),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price:',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 12.sp,
                                color: BrandColors.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '\$18.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 20.sp,
                                color: HexColor('#4DAB96'),
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: HexColor('#4DAB96'),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'cart'.svg,
                                height: 15,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '1',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )),
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
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

class Recommendations extends StatelessWidget {
  const Recommendations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Essentials Men\'s Short-Sleeve Crewnect T-shirt',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
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
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 12,
                                        color: BrandColors.textColor,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            '\$12.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 16,
                                    color: HexColor('#4DAB96'),
                                    fontWeight: FontWeight.w700),
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
          width: 15.w,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Essentials Men\'s Short-Sleeve Crewnect T-shirt',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
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
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 12,
                                        color: BrandColors.textColor,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            '\$12.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 16,
                                    color: HexColor('#4DAB96'),
                                    fontWeight: FontWeight.w700),
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
    );
  }
}

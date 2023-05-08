import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:shop_test/ui/views/dashboard/widgets/dashboard_menu.dart';
import 'package:shop_test/ui/views/dashboard/widgets/store_list_items.dart';
import 'package:shop_test/ui/views/main/main_viewmodel.dart';
import 'package:shop_test/ui/widgets/custom_textfield.dart';
import 'package:shop_test/ui/widgets/partial_builds.dart';
import 'package:shop_test/ui/widgets/remove_glow.dart';
import 'package:shop_test/ui/widgets/custom_button.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Color _theme;

  @override
  void initState() {
    super.initState();

    _theme = HexColor('#E7E9E8');
    _scrollController = ScrollController()
      ..addListener(
        () => _isAppBarExpanded
            ? setState(() => _theme = Colors.white)
            : setState(() => _theme = HexColor('#E7E9E8')),
      );
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<MainViewModel>(
      builderr: (context, model) =>
          ViewModelBuilder<DashboardViewModel>.reactive(
        onViewModelReady: (model) =>
            SchedulerBinding.instance.addPostFrameCallback((_) {}),
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, dashModel, child) => Stack(
          children: [
            Scaffold(
              body: RemoveGlow(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: _theme,
                      title: CustomTextField(
                        inputType: TextInputType.text,
                        enabled: true,
                        hintText: 'Search...',
                        prefixImage: 'search'.svg,
                      ),
                      actions: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'cart'.svg,
                                  height: 20.h,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SvgPicture.asset(
                                  'notification'.svg,
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 9,
                              right: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5.w),
                                decoration: BoxDecoration(
                                  color: HexColor('#E55986'),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '9+',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 10.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 50,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8.w),
                                decoration: BoxDecoration(
                                  color: HexColor('#E55986'),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 10.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      floating: true,
                      pinned: true,
                      snap: true,
                      expandedHeight: 382.h,
                      flexibleSpace: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CarouselSlider(
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        height: 275,
                                        animateToClosest: true,
                                        initialPage: 0,
                                        pageSnapping: true,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      items: [
                                        SizedBox(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 90,
                                                child: Image.asset(
                                                  'store1'.jpg,
                                                  height: 230,
                                                  fit: BoxFit.fitHeight,
                                                  // width: double.infinity,
                                                  // fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              Positioned(
                                                top: 100,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '# FASHION DAY',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineSmall!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14.sp,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Text(
                                                        '80% OFF',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                                fontSize: 30.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        'Discover fashion that suits\nto your style',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineMedium!
                                                            .copyWith(
                                                                fontSize: 14.sp,
                                                                color: HexColor(
                                                                    '#349B82'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      CustomButton(
                                                        onTap: () {},
                                                        width: 125.w,
                                                        height: 35,
                                                        borderRadius: 7,
                                                        color: Colors.black,
                                                        child: Text(
                                                          'Check this out',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium!
                                                              .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 100,
                                                right: 20,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 15,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      width: 3,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#349B82'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      width: 3,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#349B82'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 500,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 90,
                                                child: Image.asset(
                                                  'store2'.jpg,
                                                  height: 250,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                              Positioned(
                                                top: 105,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '# BEAUTYSALE',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineSmall!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14.sp,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Text(
                                                        'DISCOVER OUR\nBEAUTY SELECTION',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                                fontSize: 25.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                      ),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      CustomButton(
                                                        onTap: () {},
                                                        width: 125.w,
                                                        height: 35,
                                                        borderRadius: 7,
                                                        color: Colors.black,
                                                        child: Text(
                                                          'Check this out',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium!
                                                              .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 105,
                                                right: 20,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 15,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      width: 3,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#349B82'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      width: 3,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#349B82'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 10.h),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              DashMenus(
                                                icon: 'category',
                                                title: 'Category',
                                                onTap: () {},
                                              ),
                                              DashMenus(
                                                icon: 'flight',
                                                title: 'Flight',
                                                onTap: () {},
                                              ),
                                              DashMenus(
                                                icon: 'bill',
                                                title: 'Bill',
                                                onTap: () {},
                                              ),
                                              DashMenus(
                                                icon: 'web',
                                                title: 'Data plan',
                                                onTap: () {},
                                              ),
                                              DashMenus(
                                                icon: 'coin',
                                                title: 'Top up',
                                                onTap: () {},
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#349B82'),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#349B82'),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                          ),
                        ],
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(double.infinity, 100.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          color: HexColor('#F6F6F6'),
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Best Sale Product',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'See more',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        color: BrandColors.textColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                          bottom: 50.h, right: 20.w, left: 20.w),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, index) => const StoreListItems(),
                          childCount: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

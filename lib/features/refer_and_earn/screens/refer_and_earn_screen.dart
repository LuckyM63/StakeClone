import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_app_bar_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/profile/controllers/profile_contrroller.dart';
import 'package:flutter_sixvalley_ecommerce/features/refer_and_earn/widgets/refer_hint_view.dart';
import 'package:flutter_sixvalley_ecommerce/features/splash/controllers/splash_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  final tooltipController = JustTheController();
  @override
  Widget build(BuildContext context) {
    var profileController =
        Provider.of<ProfileController>(context, listen: false);
    final List<String> shareItem = [Images.share];
    final List<String> hintList = [
      getTranslated("invite_your_friends", context) ?? "",
      '${getTranslated('they_register', context)} ${AppConstants.appName} ${getTranslated('with_special_offer', context)}',
      '${getTranslated('you_made_your_earning', context)}'
    ];
    return Scaffold(
      appBar: CustomAppBar(title: 'Rewards'),
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault),
              child: Column(children: [
                // Padding(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: Dimensions.paddingSizeExtraLarge),
                //     child: Image.asset(Images.referAndEarn,
                //         height: MediaQuery.of(context).size.height * 0.2)),
                // const SizedBox(
                //   height: Dimensions.paddingSizeDefault,
                // ),
                // Stake Intro Tier Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeSmall,
                      horizontal: Dimensions.paddingSizeDefault,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with Icon
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(
                            Icons
                                .stacked_line_chart, // Replace with any relatable icon you prefer
                            color: Colors.greenAccent,
                            size: 28,
                          ),
                          title: Text(
                            "Stake Intro Tier",
                            style: robotoBold.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Tier 1", // Replace with dynamic data if available
                                style: robotoBold.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: () {
                            // Navigate to stake tier details page
                          },
                        ),

                        // Progress Bar
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
                          "Progress",
                          style: textRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value:
                              0.3, // Replace this value with the actual progress (0.0 - 1.0)
                          backgroundColor: Colors.grey[300],
                          color: Colors.greenAccent, // Customize the color
                          minHeight: 8,
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),

                        // "Start Investing" Row with Icon
                        GestureDetector(
                          onTap: () {
                            // Implement "Start Investing" action here
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .trending_up, // Replace with any relatable icon for "Start Investing"
                                color: Colors.green,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Start investing",
                                style: robotoBold.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeLarge),
                // My Earnings Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeSmall,
                      horizontal: Dimensions.paddingSizeDefault,
                    ),
                    title: Text(
                      'My earnings',
                      style: robotoBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "AED ",
                          style: robotoBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigate to earnings details page
                    },
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeLarge),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF33BB97), // Greenish shade background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on, // Icon representing earnings
                            color: Colors.white,
                            size: Dimensions.fontSizeOverLarge +
                                5, // Adjust size to match the text
                          ),
                          const SizedBox(
                              width:
                                  8), // Add spacing between the icon and the text
                          Text(
                            'Refer and Earn',
                            textAlign: TextAlign.center,
                            style: robotoBold.copyWith(
                              fontSize: Dimensions.fontSizeOverLarge,
                              color: Colors.white, // White text for the title
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              8), // Add some spacing between the title and the description
                      Text(
                        'Earn 100 rupees for every referral',
                        textAlign: TextAlign.center,
                        style: robotoBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          color: Colors.black, // Black text for the description
                        ),
                      ),
                    ],
                  ),
                ),

                // Text('${getTranslated('copy_your_code', context)}',
                //     textAlign: TextAlign.center,
                //     style: textRegular.copyWith(
                //         fontSize: Dimensions.fontSizeDefault)),
                const SizedBox(
                  height: Dimensions.paddingSizeLarge,
                ),
                //
                // Text(
                //   '${getTranslated('your_personal_code', context)}',
                //   textAlign: TextAlign.center,
                //   style: titilliumSemiBold.copyWith(
                //       fontSize: Dimensions.fontSizeDefault,
                //       color:
                //           Provider.of<ThemeController>(context, listen: false)
                //                   .darkTheme
                //               ? Theme.of(context).hintColor
                //               : Theme.of(context).primaryColor.withOpacity(.5)),
                // ),
                // const SizedBox(
                //   height: Dimensions.paddingSizeLarge,
                // ),
                // DottedBorder(
                //     padding: const EdgeInsets.all(3),
                //     borderType: BorderType.RRect,
                //     radius: const Radius.circular(20),
                //     dashPattern: const [5, 5],
                //     color: Provider.of<ThemeController>(context, listen: false)
                //             .darkTheme
                //         ? Colors.grey
                //         : Theme.of(context)
                //             .colorScheme
                //             .primary
                //             .withOpacity(0.5),
                //     strokeWidth: 1,
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //               child: Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal:
                //                           Dimensions.paddingSizeDefault),
                //                   child: Text(
                //                       Provider.of<ProfileController>(context,
                //                                   listen: false)
                //                               .userInfoModel
                //                               ?.referCode ??
                //                           '',
                //                       style: textRegular.copyWith(
                //                           fontSize:
                //                               Dimensions.fontSizeLarge)))),
                //           JustTheTooltip(
                //             backgroundColor: Colors.black87,
                //             controller: tooltipController,
                //             preferredDirection: AxisDirection.down,
                //             tailLength: 10,
                //             tailBaseWidth: 20,
                //             content: Container(
                //                 width: 90,
                //                 padding: const EdgeInsets.all(
                //                     Dimensions.paddingSizeSmall),
                //                 child: Text(getTranslated('copied', context)!,
                //                     style: textRegular.copyWith(
                //                         color: Colors.white,
                //                         fontSize: Dimensions.fontSizeDefault))),
                //             child: GestureDetector(
                //                 onTap: () async {
                //                   tooltipController.showTooltip();
                //                   await Clipboard.setData(ClipboardData(
                //                       text: profileController
                //                               .userInfoModel?.referCode ??
                //                           ''));
                //                 },
                //                 child: Container(
                //                     width: 85,
                //                     height: 40,
                //                     alignment: Alignment.center,
                //                     decoration: BoxDecoration(
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .primary,
                //                         borderRadius:
                //                             BorderRadius.circular(60)),
                //                     child: Text(
                //                         '${getTranslated('copy', context)}',
                //                         style: textRegular.copyWith(
                //                             fontSize:
                //                                 Dimensions.fontSizeExtraLarge,
                //                             color: Colors.white
                //                                 .withOpacity(0.9))))),
                //           )
                //         ])),
                // const SizedBox(
                //   height: Dimensions.paddingSizeExtraLarge,
                // ),
                // Text('${getTranslated('or_share', context)}',
                //     style: textRegular.copyWith(
                //         fontSize: Dimensions.fontSizeLarge)),
                const SizedBox(
                  height: Dimensions.paddingSizeLarge,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Share.share(
                          'Greetings, ${AppConstants.appName} is the best e-commerce platform in the country. If you are new to this website don’t forget to use "${Provider.of<ProfileController>(context, listen: false).userInfoModel?.referCode ?? ''}" as the referral code while sign up into  ${AppConstants.appName}. ${'${Provider.of<SplashController>(context, listen: false).configModel?.refSignup}${Provider.of<ProfileController>(context, listen: false).userInfoModel?.referCode ?? ''}'}',
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeExtraSmall),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.black, // black background color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.share,
                                  color: Colors.white), // Share icon
                              SizedBox(width: 8),
                              Text(
                                'Share and earn',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            maxChildSize: (hintList.length + 1.0) * 0.1,
            minChildSize: 0.1,
            builder: (context, scrollController) => ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return ReferHintView(hintList: hintList);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/details/destination_detail_screen.dart';
import 'package:travel_app/features/home/home_view_model.dart';
import 'package:travel_app/widgets/custom_destination_card.dart';
import 'package:travel_app/widgets/custom_searchbar.dart';
import 'package:travel_app/widgets/custom_tabbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),

                const SizedBox(height: 20),

                CustomSearchBar(
                  hintText: "Search destinations...",
                  onChanged: (value) {},
                  onFilterTap: () {},
                ),

                const SizedBox(height: 10),

                const Text(
                  "Select Your Next Trip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                /// Regions Selector
                CustomTabBar(
                  tabs: provider.regions,
                  selectedIndex: provider.selectedIndex,
                  onTap: (index) {
                    provider.setSelectedIndex(index);
                  },
                ),

                SizedBox(
                  height: 400,
                  child: CardSwiper(
                    cardsCount: provider.destinations.length,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(0, 40),
                    padding: const EdgeInsets.all(0),
                    cardBuilder:
                        (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) {
                          return CustomDestinationCard(
                            isFav: provider.isFav,
                            destination: provider.destinations[index],
                            onTap: () {
                              Get.to(
                                transition: Transition.fade,
                                duration: Duration(microseconds: 4000),
                                DestinationDetailScreen(
                                  destinations: provider.destinations[index],
                                ),
                              );
                            },
                            onFavoriteTap: () {
                              provider.isFavTaped();
                            },
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, Talal Rafiq",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("Welcome To Pak Travels", style: TextStyle(fontSize: 12)),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('me.jpg'),
        ),
      ],
    );
  }
}

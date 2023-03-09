import 'package:bee_recruiter/constant/app_strings.dart';
import 'package:bee_recruiter/modules/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../widgets/recommended_job_item.dart';
import '../../widgets/search_bar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: screenWidth / 8,
                      decoration: BoxDecoration(
                          color: AppColors.iconBackground,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.blackColor,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://th.bing.com/th/id/OIP.dQfdAm3rBigcg3itwhodTQHaKh?w=203&h=288&c=7&r=0&o=5&dpr=1.3&pid=1.7")),
                ],
              ),
              SizedBox(
                height: screenWidth / 30,
              ),
              Text(
                AppStrings.profileBasedJobs,
                style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor),
              ),
              SizedBox(
                height: screenWidth / 30,
              ),
              const CustomSearchBar(),
              SizedBox(
                height: screenWidth / 30,
              ),
              Text(
                "${controller.jobsList.length.toString()} Results",
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: screenWidth / 30,
              ),
              Container(
                height: screenHeight,
                width: screenWidth,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.jobsList.length,
                  itemBuilder: (context, index) {
                    return RecommendedItem(
                        jobItem: controller.jobsList.elementAt(index));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: screenWidth / 30,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

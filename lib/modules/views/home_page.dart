import 'package:bee_recruiter/modules/controller/home_page_controller.dart';
import 'package:bee_recruiter/widgets/custom_options_list.dart';
import 'package:bee_recruiter/widgets/recommended_job_item.dart';
import 'package:bee_recruiter/widgets/search_bar.dart';
import 'package:bee_recruiter/widgets/search_dailog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    final controller =Provider.of<HomePageController>(context);
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu_outlined)),
                    Spacer(),
                    CircleAvatar(foregroundImage: NetworkImage("https://th.bing.com/th/id/OIP.dQfdAm3rBigcg3itwhodTQHaKh?w=203&h=288&c=7&r=0&o=5&dpr=1.3&pid=1.7")),
        
                  ],
                ),
                Text("  Hello Ayat!",style: GoogleFonts.nunito(fontSize: 22,fontWeight:FontWeight.w800,color: AppColors.signupFontColor),),
                SizedBox(height: screenWidth/30,),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return SearchDailog();
                    },);

                  },
                  child: const CustomSearchBar()),
                SizedBox(height: screenWidth/30,),
                Row(
                  children: [
                    Text("Recommendation",style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.textColor),),
                    const Spacer(),
                    Text("See all",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.skyBlueColor),),



                  ],
                ),
                SizedBox(height: screenWidth/30,),
                SizedBox(
                  height: screenHeight/4,
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: controller.jobsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return  RecommendedItem(jobItem: controller.jobsList.elementAt(index));
                    }, separatorBuilder: (BuildContext context, int index) { 
                      return SizedBox(width: 10,);
                     }, 
                  ),
                ),
                SizedBox(height: screenWidth/30,),
                Row(
                  children: [
                    Text("Recent Jobs",style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.textColor),),
                    const Spacer(),
                    Text("Show all",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.skyBlueColor),),

                  ],
                ),
                SizedBox(height: screenWidth/30,),
                CustomOptionsList(list: controller.filterList,selctedList: controller.selctedList,onTapCallback: (){
                  controller.addToSelected("All");
                },),
                SizedBox(height: screenWidth/30,),
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.jobsList.length,
                    itemBuilder: (context, index) {
                    return  RecommendedItem(jobItem: controller.jobsList.elementAt(index));
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(height: screenWidth/30,);
                   },),
                )
              ],
            ),
          ),
        ) ),
    );
  }

  void popupAlert(
    BuildContext context,
    title,
    Function onTapofYes,
  ) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.05),
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (dialogContext, anim1, anim2) {
        return SizedBox();
      },
      transitionBuilder: (dialogContext, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (40.0),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Material(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:  (24.0),
                        vertical:  (23.0),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.pop(dialogContext);
                            //   },
                            //   child: Align(
                            //     alignment: Alignment.topRight,
                            //     child: Icon(
                            //       Icons.close,
                            //       color: Colors.black,
                            //       size: ScreenUtil().setSp(20.0),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(30.0),
                            // ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                title ?? "",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: (21.0),
                            ),
                            Text("Mention your ID"),
                           SizedBox(
                              height: (5.0),
                            ),
                            TextField(
                              //controller: _textFieldController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                                hintText: '',
                              ),
                            ),
                            SizedBox(
                              height:  (10.0),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                  horizontal: (10.0),
                                  vertical: (13.0),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:  (10.0),
                            ),
                            Text("Note:"),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed blandit vitae mauris eu malesuada. Morbi facilisis nulla vel dolor malesuada efficitur. Nulla faucibus pellentesque tortor, id finibus diam dignissim non. Sed pretium ante nunc, vitae viverra lectus porta in. Sed suscipit libero quis mi sagittis scelerisque. Curabitur rutrum faucibus porttitor. Morbi pretium nisi nec eros posuere pretium. Aliquam a arcu magna.")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
  
   
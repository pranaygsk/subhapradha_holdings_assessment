import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subhapradha_holdings_assessment/components/bottom_item.dart';
import 'package:subhapradha_holdings_assessment/components/error_description.dart';
import 'package:subhapradha_holdings_assessment/components/height_spacer.dart';
import 'package:subhapradha_holdings_assessment/components/list_item.dart';
import 'package:subhapradha_holdings_assessment/components/my_button.dart';
import 'package:subhapradha_holdings_assessment/components/recent_list_item.dart';
import 'package:subhapradha_holdings_assessment/constants/my_colors.dart';
import 'package:subhapradha_holdings_assessment/constants/styles.dart';

import '../components/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  bool dropDown = false;
  bool dropDown1 = false;
  bool dropDown2= false;
  String textFieldText =
      'I need your expertise in formualtion questions for an upcoming cross-examination. Our focus is on challenging the opposing party\'s witness regarding the alleged breach of contract in the formulate questions with legal brilliance';
  bool showAndHideContents = false;
  bool infoClicked = false;
  String petitionerText =
      "What evidence exists to demonstrate that the prerequisites for the emergence of an order of the Government have been complied with?";
  String dropDownText =
      "This question seeks to establish the existence of evidence that supports compliance with the prerequisites for the emergence of a government order, strengthening the plaintiff's case.";

  // late TabController _tabController;

  startPressed() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      loading = false;
      showAndHideContents = true;
    });
  }

  infoPressed() {
    setState(() {
      infoClicked = !infoClicked;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cross examination', style: Styles.appBarTextStyle),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              infoPressed();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (!infoClicked ? initialScreen(w, h) : infoScreen(w, h)),
    );
  }

  Widget initialScreen(double w, double h) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Top Container
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25),
              width: w,
              // height: h / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              //Inner Container Widgets
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Row
                  Row(
                    children: [
                      //Icon
                      const Icon(
                        Icons.switch_account_outlined,
                        size: 36,
                        color: Colors.blue,
                      ),
                      WSpacer(width: 15),
                      //Heading Text
                      Expanded(
                        child: Text(
                          'Formulate questions that resonate with legal brilliance.',
                          style: Styles.headingTextStyle,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  HSpacer(height: 10),
                  //TextField
                  TextField(
                    maxLength: 80,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText:
                          'Describe the scenario/context of the case and your strategy for proceedings.',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                  //Row with Upload File and Icon
                  Visibility(
                    visible: !showAndHideContents,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Upload Pressed');
                            }
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  width: w,
                                  height: h / 3.5,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //topbar of bottomsheet
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.arrow_back_ios_new),
                                          Text(
                                            'Select',
                                            style: Styles.headingTextStyle,
                                          ),
                                          WSpacer(width: 5),
                                        ],
                                      ),
                                      //Folders and Icons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BottomItem(
                                              icon: Icons.folder_outlined,
                                              iconText: "File Manager"),
                                          WSpacer(width: 10),
                                          BottomItem(
                                              icon: Icons.camera_alt_outlined,
                                              iconText: "Camera"),
                                        ],
                                      ),
                                      HSpacer(height: 10),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.upload_file,
                                color: Colors.blue,
                              ),
                              WSpacer(width: 2),
                              const Text(
                                "Upload case file",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        HSpacer(height: 5),
                        //Text
                        const Text(
                          '(Criteria : less than 40 pages in English)',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  HSpacer(height: 5.0),
                  Visibility(
                    visible: showAndHideContents,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Uploaded Files',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Container(
                                        padding: const EdgeInsets.all(30),
                                        height: 300,
                                        decoration: BoxDecoration(
                                          gradient: MyColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white,
                                              ),
                                              child: const Text(
                                                '1/5',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            HSpacer(height: 30),
                                            const Text(
                                              "Analysing file",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            HSpacer(height: 10),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons.video_file_outlined,
                                                      color: Colors.red),
                                                  WSpacer(width: 10),
                                                  const Text('Agreement.pdf'),
                                                ],
                                              ),
                                            ),
                                            HSpacer(height: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.yellow,
                                                ),
                                                WSpacer(width: 10),
                                                const Text(
                                                  'Less than 40 pages',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            HSpacer(height: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.cancel,
                                                  color: Colors.red,
                                                ),
                                                WSpacer(width: 10),
                                                const Text(
                                                  'Language is in English',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('5/10'),
                              ),
                            ),
                          ],
                        ),
                        HSpacer(height: 10),
                        ListItem(
                            iconColor: Colors.red, itemText: "Agreement.pdf"),
                        HSpacer(height: 10),
                        ListItem(
                          iconColor: Colors.blue,
                          itemText: "Complaint.jpg",
                        ),
                        HSpacer(height: 2),
                        ErrorMessage(
                          errorText: "Incompatible language",
                          visible: true,
                        ),
                        ListItem(
                          iconColor: Colors.blue.shade700,
                          itemText: "Leaseagreement.docx",
                        ),
                        HSpacer(height: 2),
                        ErrorMessage(
                          errorText: "Pages count exceeded",
                          visible: false,
                        ),
                      ],
                    ),
                  ),
                  HSpacer(height: 10),
                  //Custom Button Start
                  MyButton(
                      btnText: 'Start',
                      onTap: () {
                        startPressed();
                      }),
                ],
              ),
            ),
            //Bottom Image
            Visibility(
              visible: !showAndHideContents,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/bottom_image.svg",
                      height: h / 3,
                      width: w,
                    ),
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                          text: 'Craft persuasive ',
                          style: Styles.biggerHeadingBlue,
                          children: [
                            TextSpan(
                                text: 'questions that strike a chord with ',
                                style: Styles.biggerHeadingBlack),
                            TextSpan(
                                text: 'legal finesse',
                                style: Styles.biggerHeadingBlue)
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            HSpacer(height: 15),
            //Bottom Hidden
            Visibility(
              visible: showAndHideContents,
              child: Container(
                width: w,
                // height: h/3.5,
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent analysis",
                      style: Styles.headingTextStyle,
                    ),
                    HSpacer(height: 15),
                    RecentListItem(
                        title: 'The Cyberbullying Conspiracy',
                        subTitle: '10 minutes',
                        statusColor: Colors.green,
                        statusText: 'Completed',
                        containerColor: Colors.green.shade50,
                        iconData: Icons.check_circle),
                    const Divider(),
                    RecentListItem(
                      title: 'The Cyberbullying Conspiracy',
                      subTitle: '1 day ago',
                      statusColor: Colors.deepOrange,
                      statusText: 'In progress',
                      iconData: Icons.timelapse,
                      containerColor: Colors.deepOrange.shade50,
                    ),
                    const Divider(),
                    RecentListItem(
                      title: 'The Data Breach Dilemma',
                      subTitle: '2 days ago',
                      statusColor: Colors.red,
                      statusText: 'Failed',
                      containerColor: Colors.red.shade50,
                      iconData: Icons.error_outline,
                    ),
                    const Divider(),
                    RecentListItem(
                      title: 'The Green Tech Scandal',
                      subTitle: '1 week ago',
                      statusColor: Colors.green,
                      statusText: 'Completed',
                      containerColor: Colors.green.shade50,
                      iconData: Icons.check_circle,
                    ),
                    const Divider(),
                    HSpacer(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoScreen(double width, double height) {
    var w = width;
    var h = height;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                dividerHeight: 0,
                splashBorderRadius: BorderRadius.circular(50),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Petitioner',
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Respondent',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                petitionerTab(w, h),
                petitionerTab(w, h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget petitionerTab(double w, double h) {
    return Container(
      color: MyColors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left:15.0,right:15.0,top: 5.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:25,right: 25,top: 25),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: w - 20,
                    height: dropDown ? h/3.4: h / 5.5,
                    child: Column(
                      children: [
                        Text(petitionerText),
                        HSpacer(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Intention",
                              style: TextStyle(color: dropDown ? Colors.blue:Colors.grey,fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  dropDown = !dropDown;
                                });
                              },
                              child: Icon(
                                dropDown?  Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: dropDown,
                          child: Text(
                            dropDownText,
                            style: const TextStyle(color: Colors.grey),
                            // maxLines: dropDown ? 1 : 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Q",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left:15.0,right:15.0,top: 5.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:25,right: 25,top: 25),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: w - 20,
                    height: dropDown1 ? h/3.4: h / 5.5,
                    child: Column(
                      children: [
                        Text(petitionerText),
                        HSpacer(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Intention",
                              style: TextStyle(color: dropDown1 ? Colors.blue:Colors.grey,fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  dropDown1 = !dropDown1;
                                });
                              },
                              child: Icon(
                                dropDown1?  Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: dropDown1,
                          child: Text(
                            dropDownText,
                            style: const TextStyle(color: Colors.grey),
                            // maxLines: dropDown ? 1 : 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Q",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left:15.0,right:15.0,top: 5.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:25,right: 25,top: 25),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: w - 20,
                    height: dropDown2 ? h/3.4: h / 5.5,
                    child: Column(
                      children: [
                        Text(petitionerText),
                        HSpacer(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Intention",
                              style: TextStyle(color: dropDown2 ? Colors.blue:Colors.grey,fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  dropDown2 = !dropDown2;
                                });
                              },
                              child: Icon(
                                dropDown2?  Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: dropDown2,
                          child: Text(
                            dropDownText,
                            style: const TextStyle(color: Colors.grey),
                            // maxLines: dropDown ? 1 : 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Q",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

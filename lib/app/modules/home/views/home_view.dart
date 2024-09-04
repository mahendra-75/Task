
import 'package:cartgreek/app/data/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  final _advancedDrawerController = AdvancedDrawerController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return  AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,

          color: Colors.white70

     ,
      ),
    controller: _advancedDrawerController,
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,

    child:Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: 'Packages',

          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Bookings',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
        selectedItemColor: primarySecondColor,
        // Color for selected item
        unselectedItemColor: Colors.grey,
        // Color for unselected items
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        // Style for selected label
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration:     BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20)),
            
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(3, 1),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 25, left: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed:_handleMenuButtonPressed,
                        icon: Icon(Icons.menu, color: primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            image: const DecorationImage(image: NetworkImage(
                                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
                                fit: BoxFit.fill
                            ),
                            shape: BoxShape.circle
                        ),
                        // child:Image.network ,
                      ),

                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Welcome',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            'Emily Cyrus',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Nanny Services Section
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 155,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  'Nanny And',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: BlueColor),
                                ),
                                Text(
                                  'Babysitting Services',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: BlueColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Book Now action
                                  },
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                   style:  ElevatedButton.styleFrom(
                                    backgroundColor: BlueColor,
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                        top: -45,
                        right: -30,
                        child:
                        Image.asset(
                          'assets/img2.png',
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your Current Booking',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 220,
                    child: Obx(
                            () {
                          if (controller.isBooking.value) {
                            return Center(child: CircularProgressIndicator(
                              color: primarySecondColor,
                            ),);
                          } else if (controller.BookingList1.isEmpty) {
                            return Center(child: Text('No current bookings',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.grey)));
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.BookingList1.value.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 220,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 50,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            '${controller.BookingList1
                                                .value[index].title}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: primaryColor),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Start action
                                            },
                                            child: const Text(
                                              'Start',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primarySecondColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              const Text('From'),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(Icons
                                                      .calendar_today_outlined,
                                                      color: primaryColor),
                                                  const SizedBox(width: 5),
                                                  Text('${controller.BookingList1
                                                      .value[index].fromDate}'),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(Icons.access_time,
                                                      color: primaryColor),
                                                  const SizedBox(width: 5),
                                                  Text('${controller.BookingList1
                                                      .value[index].fromTime}'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              const Text('To'),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(Icons
                                                      .calendar_today_outlined,
                                                      color: primaryColor),
                                                  const SizedBox(width: 5),
                                                  Text('${controller.BookingList1
                                                      .value[index].toDate}'),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(Icons.access_time,
                                                      color: primaryColor),
                                                  const SizedBox(width: 5),
                                                  Text('${controller.BookingList1
                                                      .value[index].toTime}'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(top: 5,
                                                bottom: 5,
                                                left: 10,
                                                right: 10),
                                            decoration: BoxDecoration(
                                              color: BlueColor,
                                              // Button background color
                                              border: Border.all(
                                                  color: BlueColor),
                                              // Border color
                                              borderRadius: BorderRadius.circular(
                                                  30), // Optional: To make the button rounded
                                            ),
                                            child:
                                            const Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(Icons.star,
                                                      color: Colors.white,
                                                      size: 15),
                                                  Center(
                                                    child: Text(
                                                      'Rate Us',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            )
                                            ,
                                          ),
                                          const SizedBox(height: 8),
                                          // Space between buttons
                                          Container(
                                            padding: const EdgeInsets.only(top: 5,
                                                bottom: 5,
                                                left: 10,
                                                right: 10),

                                            decoration: BoxDecoration(
                                              color: BlueColor,
                                              // Button background color
                                              border: Border.all(
                                                  color: BlueColor),
                                              // Border color
                                              borderRadius: BorderRadius.circular(
                                                  30),
                                              // Optional: To make the button rounded
                                            ),
                                            child:
                                            const Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(Icons.location_on_outlined,
                                                      color: Colors.white,
                                                      size: 15),
                                                  Center(
                                                    child: Text(
                                                      'Geolocation',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            )
                                            ,
                                          ),
                                          const SizedBox(height: 8),
                                          // Space between buttons
                                          Container(
                                            padding: const EdgeInsets.only(top: 5,
                                                bottom: 5,
                                                left: 10,
                                                right: 10),
            decoration: BoxDecoration(
                                              color: BlueColor,
                                              border: Border.all(
                                                  color: BlueColor),
                                              borderRadius: BorderRadius.circular(
                                                  30),
                                            ),
                                            child:
                                            const Center(
                                              child: const Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Icon(Icons
                                                      .surround_sound_outlined,
                                                      color: Colors.white,
                                                      size: 15),
                                                  SizedBox(width: 1,),
                                                  Center(
                                                    child: Text(
                                                      'Survillence',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            )
                                            ,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        }
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Packages Section
                  Text(
                    'Packages',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                          () {
                        return controller.isPackage.value ? Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Center(child: CircularProgressIndicator(
                            color: primarySecondColor,
                          )),
                        ) : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.PackageList1.value.length,

                          itemBuilder: (context, index) {
                            final package = controller.PackageList1.value[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(

                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: (index % 2 == 0)
                                      ? PackageContainerColor
                                      : PackageContainerColor2,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                         Icon(
                                          Icons.calendar_month_rounded, size: 45,
                                          color: (index % 2 == 0)
                                              ? primarySecondColor
                                              : Colors.white,),
                                         Container(
                                            decoration: BoxDecoration(
                                                color: (index % 2 == 0)
                                                    ? primarySecondColor
                                                    : BookNowButtonCOlor,
                                                borderRadius: BorderRadius
                                                    .circular(30)
                                            ),
                                            child: TextButton(onPressed: () {},
                                                child: Center(
                                                  child: const Text("Book Now",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),),
                                                )))
                                      ],
                                    ),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("One Days Package", style: TextStyle(
                                            color: DaysTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),),
                                        Text("₹ ${package.price}",
                                          style: TextStyle(color: DaysTextColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),),
                                      ],),
                                    const SizedBox(height: 15,),

                                    const Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(color: Colors.black,fontSize: 12),)


                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),),
      drawer: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white70.withOpacity(0.2)],
                      ),




                    ),
          child: ListTileTheme(
            textColor: Colors.black,
            iconColor: Color(0xFF000080), // Dark Blue Color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.04,),

                Center(
                  child:   Container(
                    height: 70,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        image: const DecorationImage(image: NetworkImage(
                            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
                            fit: BoxFit.fill
                        ),
                        shape: BoxShape.circle
                    ),
                    // child:Image.network ,
                  ),

                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Emily Cyrus',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildDrawerItem('true', 'Home', context),
                _buildDrawerItem('true', 'Book A Nanny', context),
                _buildDrawerItem('true', 'How It Works', context),
                _buildDrawerItem('true', 'Why Nanny Vanny', context),
                _buildDrawerItem('true', 'My Bookings', context),
                _buildDrawerItem('true', 'My Profile', context),
                _buildDrawerItem('false', 'Support', context),
              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget _buildDrawerItem(String borderValue,String title, BuildContext context) {
    return Container(
      decoration: borderValue=='true'? BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.2,color: Colors.pink)),
      ):null,
      child: ListTile(
        // leading: Icon(icon),
        title: Text(
          title,
          style:    GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: BlueColor),


        ),
        onTap: () {
          // _advancedDrawerController.showDrawer();
          _advancedDrawerController.toggleDrawer();
        },
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

}









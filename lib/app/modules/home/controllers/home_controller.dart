import 'package:get/get.dart';

import '../../../data/BookingList.dart';
import '../../../data/api_service.dart';
import '../../../data/packagelIstJson.dart';
import 'dart:convert' as JSON;
class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var isBooking = false.obs;
  var isPackage = false.obs;
  var PackageList1=<PackageLIst>[].obs;
  var BookingList1=<BookingList>[].obs;
  @override
  void onInit() {
    PacklistFetch();
    BookingListFetch();
    print("mahendra");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void PacklistFetch()async{
    try{
      isPackage.value = true;
      RestApi restApi = RestApi();
      var response = await  restApi.postApi("https://www.cgprojects.in/lens8/api/dummy/packages_list", "");
      var responseJson = JSON.json.decode(response.body);
      if(responseJson['status']=="success"){
        isPackage.value = false;

        PackageList1.value = packageLIstFromJson(response.body);
        print("${PackageList1.value.length}");
        print("${response.body}");

      }else{
        isPackage.value = false;

      }

    }catch (e){
      isPackage.value = false;

      print(e);

    }
    isPackage.value = false;

  }
  void BookingListFetch()async{
   try{
     isBooking.value = true;
     RestApi restApi = RestApi();
     var response = await  restApi.postApi("https://www.cgprojects.in/lens8/api/dummy/current_booking_list","");
     var responseJson = JSON.json.decode(response.body);
     if(responseJson['status']=="success"){
       isBooking.value = false;
       BookingList1.value = bookingListFromJson(response.body);
     }else{
       isBooking.value = false;
     }
   }catch(e){
     isBooking.value = false;
     print(e);
   }
   isBooking.value = false;
  }
}

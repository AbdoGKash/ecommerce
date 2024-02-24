import '../class/Staterequest.dart';

handlingData(response) {
  if (response is StateRequest) {
    return response; // لان الريسبونص شايل جواه حالته
  }
  // في الحاله دي هيكون نوعه ماب
  else {
    return StateRequest.success; // لانه ف الحاله دي ماب يعني نجح
  }
}

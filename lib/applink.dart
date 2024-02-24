class AppLink {
  static const String linkserver = "http://192.168.1.3/ecommerce";
  // static const String test = "$linkserver/test.php";
  static const String imageserver = "http://192.168.1.3/ecommerce/upload";
  // =================================================== Auth =================================================== //
  static const String signUp = "$linkserver/auth/signup.php";
  static const String login = "$linkserver/auth/login.php";
  static const String verifyCode = "$linkserver/auth/verifycode.php";
  // =================================================== ResetPassword =================================================== //
  static const String checkEmail = "$linkserver/forgetpassword/chechemail.php";
  static const String verifyCodeForgetPasword =
      "$linkserver/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$linkserver/forgetpassword/resetpassword.php";
  // =================================================== Home =================================================== //
  static const String home = "$linkserver/home.php";
  // =================================================== image =================================================== //
  static const String imagecategories = "$imageserver/categories";
  static const String imageitems = "$imageserver/items";
  // =================================================== items =================================================== //
  static const String items = "$linkserver/items/items.php";
  static const String search = "$linkserver/items/search.php";
  // =================================================== favorite =================================================== //
  static const String favoriteAdd = "$linkserver/favorite/add.php";
  static const String favoriteRemove = "$linkserver/favorite/remove.php";
  static const String myFavorite = "$linkserver/favorite/view.php";
  static const String removeMyFavorite =
      "$linkserver/favorite/removefrommyfavorite.php";
  // =================================================== cart =================================================== //
  static const String cartView = "$linkserver/cart/view.php";
  static const String cartAdd = "$linkserver/cart/add.php";
  static const String cartRemove = "$linkserver/cart/remove.php";
}

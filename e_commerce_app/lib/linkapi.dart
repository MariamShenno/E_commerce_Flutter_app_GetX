class AppLink {
  static const String server =
      "";

  static const String test = "$server/test.php";

//************************** Notification*****************************//
 static const String notification = "$server/notification.php";


  static const String imageststatic =
      "";
      
//************************** Image*****************************//
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";

//**************************Auth*****************************//

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiyCodeSignUp = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

//**************************ForgetPassword*****************************//

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

//**************************Home*****************************//

  static const String homepage = "$server/home.php";

//**************************Items*****************************//

  static const String items = "$server/items/items.php";
  static const String searchitems ="$server/items/search.php";

//**************************Favorite*****************************//

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite = "$server/favorite/deletefromfavroite.php";

   //**************************Cart*****************************//

   static const String cartview  = "$server/cart/view.php";
   static const String cartadd  = "$server/cart/add.php";
   static const String cartdelete  = "$server/cart/delete.php";
   static const String cartgetcountitems  = "$server/cart/getcountitems.php";

 //**************************Address*****************************//

    static const String addresstview  = "$server/address/view.php";
   static const String addressAdd  = "$server/address/add.php";
   static const String addressDelete  = "$server/address/delete.php";
   static const String addressEdit  = "$server/address/edit.php";

   //**************************Coupon*****************************//

    static const String checkcoupon  = "$server/coupon/checkcoupon.php";

    //**************************Checkout*****************************//

    static const String checkout  = "$server/orders/checkout.php";
    static const String ordersarchive = "$server/orders/archive.php";
    static const String ordersdelete = "$server/orders/delete.php";
    static const String ordersdetails  = "$server/orders/details.php";
    static const String pendingorders  = "$server/orders/pending.php"; 

    //**************************Offers*****************************//

    static const String offers  = "$server/offers.php";

     //**************************Rating*****************************//

      static const String rating  = "$server/rating.php";

}

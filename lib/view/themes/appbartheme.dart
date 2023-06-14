import 'package:hydromart/view/cart_view.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
    String title;
    CustomAppBar(this.title) : preferredSize = Size(AppBar().preferredSize.width, AppBar().preferredSize.height);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
    @override
    Widget build(BuildContext context) {
        return AppBar(
      title: Text(widget.title,style: GoogleFonts.bebasNeue(
        fontSize: 25,color: Colors.black

      ),),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(onPressed: 
      (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
    );
    }
}
class CustomAppBar2 extends StatefulWidget implements PreferredSizeWidget {
    String title;
    CustomAppBar2(this.title) : preferredSize = Size(AppBar().preferredSize.width, AppBar().preferredSize.height);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _CustomAppBar2State createState() => _CustomAppBar2State();
}

class _CustomAppBar2State extends State<CustomAppBar2>{
    @override
    Widget build(BuildContext context) {
        return AppBar(
          title: Text(widget.title,style: GoogleFonts.bebasNeue(
                  fontSize: 25,color: Colors.black
                  ),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  Get.to(() => CartView());
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: secondaryColor,
                ),
              ),
            ),
          ],
        );
    }
}
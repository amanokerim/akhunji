import 'package:akhunji/providers/homeP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeV extends StatefulWidget {
  @override
  _HomeVState createState() => _HomeVState();
}

Color kPrimary = Color(0xFF121C1D);

class _HomeVState extends State<HomeV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Image.asset(
          "assets/logo.jpg",
          height: 50.0,
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [_buildCallButton()],
      ),
      body: Consumer<HomeP>(
        builder: (_, home, __) => ListView(
          children: [
            SizedBox(height: 20.0),
            _buildCategoies(home),
            SizedBox(height: 10.0),
            _buildProductImages(home),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  IconButton _buildCallButton() {
    return IconButton(
      icon: Icon(Icons.phone),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(),
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 160.0,
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Text("Telefonlarymyz:"),
                SizedBox(height: 10.0),
                OutlineButton(
                  onPressed: () {
                    _call("+99365314252");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10.0),
                      Text("+993 65 314252"),
                    ],
                  ),
                ),
                OutlineButton(
                  onPressed: () {
                    _call("+99364483147");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10.0),
                      Text("+993 64 483147"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _call(String phone) async {
    if (await canLaunch("tel:$phone")) await launch("tel:$phone");
  }

  ListView _buildProductImages(HomeP home) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: home.selectedList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: kPrimary,
            offset: Offset(0, 5.0),
            spreadRadius: -5,
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(home.selectedList[index]),
        ),
      ),
    );
  }

  Container _buildCategoies(HomeP home) {
    return Container(
      height: 40.0,
      child: ListView.builder(
        itemCount: home.categoryNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _categoryChip(index, home),
      ),
    );
  }

  Widget _categoryChip(int index, HomeP home) {
    return GestureDetector(
      onTap: () => home.selectedCategory = index,
      child: Container(
        margin: EdgeInsets.only(
          left: 10.0,
          right: index == home.categoryNames.length - 1 ? 10.0 : 0.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: index == home.selectedCategory
              ? kPrimary.withOpacity(.95)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          home.categoryNames[index],
          style: TextStyle(
            color: index == home.selectedCategory ? Colors.white : kPrimary,
          ),
        ),
      ),
    );
  }
}

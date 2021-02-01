import 'package:akhunji/providers/homeP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeV extends StatefulWidget {
  @override
  _HomeVState createState() => _HomeVState();
}

class _HomeVState extends State<HomeV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ak Hünji"),
        centerTitle: true,
      ),
      body: Consumer<HomeP>(
        builder: (_, home, __) => ListView(
          children: [
            SizedBox(height: 20.0),
            Container(
              height: 40.0,
              child: ListView.builder(
                itemCount: home.categoryNames.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _buildCategoryChip(index, home),
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: home.selectedList.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.grey,
                    offset: Offset(0, 5.0),
                    spreadRadius: -10,
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(home.selectedList[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(int index, HomeP home) {
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
              ? Colors.black87
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          home.categoryNames[index],
          style: TextStyle(
            color:
                index == home.selectedCategory ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

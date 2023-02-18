import 'package:flutter/material.dart';

class DrowerScreen extends StatelessWidget {
  Function onDrawerSelected;

  DrowerScreen(this.onDrawerSelected);
  static const int CATEGORIES=1;
  static const int SETTINGS=2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'News App!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: (){
                onDrawerSelected(CATEGORIES);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.grid_view_rounded),
                    SizedBox(width: 6,),
                    Text('Categories',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                onDrawerSelected(SETTINGS);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.settings,),
                    SizedBox(width: 6,),
                    Text('Settings',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

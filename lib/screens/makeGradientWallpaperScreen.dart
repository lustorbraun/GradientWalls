import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeGradientWallpaperScreen extends StatefulWidget {
  @override
  _MakeGradientWallpaperScreenState createState() => _MakeGradientWallpaperScreenState();
}

class _MakeGradientWallpaperScreenState extends State<MakeGradientWallpaperScreen> {
  Color primaryColor;
  Color secondaryColor;
  Alignment beginAlignment;
  Alignment endAlignment;
  bool isediting=false;
  double primaryRedSliderValue=1;
  double primaryGreenSliderValue=255;
  double primaryblueSliderValue=255;
  double secondaryRedSliderValue=255;
  double secondaryGreenSliderValue=255;
  double secondaryBlueSliderValue=1;
  int pageIndex=0;
  PageController pageController=PageController();

  @override
  void initState() {
    primaryColor=Color.fromRGBO(primaryRedSliderValue.floor(), primaryGreenSliderValue.floor(), primaryblueSliderValue.floor(), 1);
    secondaryColor=Color.fromRGBO(secondaryRedSliderValue.floor(), secondaryGreenSliderValue.floor(), secondaryBlueSliderValue.floor(), 1);
    beginAlignment=Alignment.bottomLeft;
    endAlignment=Alignment.topCenter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: Colors.red,
      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
          padding: EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Text(
            'This is a gradient wallpaper app by which u can make beautiful gradient wallpaper.\n\n Currently wallpaper save option is not available please take screenshot and then set wallpaper manually\n\n we are working on more features stay tuned'
            ,style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: true,
      endDrawer: Drawer(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Thanks for using this application\n\n\n\n\n\n with ♥ from Sumit'
            ,style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          ),
        ),
      ),
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          wallpaper(
            context: context,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            beginAlignment: beginAlignment,
            endAlignment: endAlignment,
          ),
          Positioned(
            bottom: isediting?15:-300,
            child: editingSheet(),
          ),
          editingButton(),
        ],
      ),
    );
  }

  Widget editingButton(){
    return GestureDetector(
      onTap: (){
        setState(() {
          isediting= !isediting;
        });
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: isediting?10.5:50,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.elliptical(60, 30))
          ),
          child: Icon(
            isediting?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
            color: Colors.white60,
            size: 30,
          ),
        ),
      ),
    );
  }
  
  Widget editingSheet(){
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width*.9,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10,),
              tileTitle(text: 'Primary Color',index: 0),
              SizedBox(width: 10,),
              tileTitle(text: 'Secondary Color',index: 1),
              SizedBox(width: 10,),
              tileTitle(text: 'Alignment',index: 2),
              SizedBox(width: 10,),
            ],
          )
        ),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width*.95,
          height: 170,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: PageView(
            controller: pageController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    trailing: Text(
                      '${primaryRedSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.red,
                      value: primaryRedSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          primaryRedSliderValue=newValue;
                          primaryColor=Color.fromRGBO(primaryRedSliderValue.floor(), primaryGreenSliderValue.floor(), primaryblueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    trailing: Text(
                      '${primaryGreenSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.green,
                      value: primaryGreenSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          primaryGreenSliderValue=newValue;
                          primaryColor=Color.fromRGBO(primaryRedSliderValue.floor(), primaryGreenSliderValue.floor(), primaryblueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    trailing: Text(
                      '${primaryblueSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.blue,
                      value: primaryblueSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          primaryblueSliderValue=newValue;
                          primaryColor=Color.fromRGBO(primaryRedSliderValue.floor(), primaryGreenSliderValue.floor(), primaryblueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    trailing: Text(
                      '${secondaryRedSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.red,
                      value: secondaryRedSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          secondaryRedSliderValue=newValue;
                          secondaryColor=Color.fromRGBO(secondaryRedSliderValue.floor(), secondaryGreenSliderValue.floor(), secondaryBlueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    trailing: Text(
                      '${secondaryGreenSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.green,
                      value: secondaryGreenSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          secondaryGreenSliderValue=newValue;
                          secondaryColor=Color.fromRGBO(secondaryRedSliderValue.floor(), secondaryGreenSliderValue.floor(), secondaryBlueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    trailing: Text(
                      '${secondaryBlueSliderValue.floor()}',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    title: Slider(
                      max: 255,
                      min: 1,
                      activeColor: Colors.blue,
                      value: secondaryBlueSliderValue,
                      onChanged: (newValue){
                        setState(() {
                          secondaryBlueSliderValue=newValue;
                          secondaryColor=Color.fromRGBO(secondaryRedSliderValue.floor(), secondaryGreenSliderValue.floor(), secondaryBlueSliderValue.floor(), 1);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DropdownButton(
                      value: beginAlignment,
                      dropdownColor: Colors.white30,
                      onChanged: (newValue){
                        setState(() {
                          beginAlignment=newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem(value: Alignment.center,child: Text('center'),),
                        DropdownMenuItem(value: Alignment.centerRight,child: Text('centerRight'),),
                        DropdownMenuItem(value: Alignment.centerLeft,child: Text('centerLeft'),),
                        DropdownMenuItem(value: Alignment.topCenter,child: Text('topCenter'),),
                        DropdownMenuItem(value: Alignment.topRight,child: Text('topRight'),),
                        DropdownMenuItem(value: Alignment.topLeft,child: Text('topLeft'),),
                        DropdownMenuItem(value: Alignment.bottomCenter,child: Text('bottomCenter'),),
                        DropdownMenuItem(value: Alignment.bottomRight,child: Text('bottomRight'),),
                        DropdownMenuItem(value: Alignment.bottomLeft,child: Text('bottomLeft'),),
                      ],
                    ),
                    DropdownButton(
                      value: endAlignment,
                      dropdownColor: Colors.white30,
                      onChanged: (newValue){
                        setState(() {
                          endAlignment=newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem(value: Alignment.center,child: Text('center'),),
                        DropdownMenuItem(value: Alignment.centerRight,child: Text('centerRight'),),
                        DropdownMenuItem(value: Alignment.centerLeft,child: Text('centerLeft'),),
                        DropdownMenuItem(value: Alignment.topCenter,child: Text('topCenter'),),
                        DropdownMenuItem(value: Alignment.topRight,child: Text('topRight'),),
                        DropdownMenuItem(value: Alignment.topLeft,child: Text('topLeft'),),
                        DropdownMenuItem(value: Alignment.bottomCenter,child: Text('bottomCenter'),),
                        DropdownMenuItem(value: Alignment.bottomRight,child: Text('bottomRight'),),
                        DropdownMenuItem(value: Alignment.bottomLeft,child: Text('bottomLeft'),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tileTitle({String text,int index}){
    return GestureDetector(
      onTap: (){
        setState(() {
          pageIndex=index;
          pageController.animateToPage(
              pageIndex,
              duration: Duration(microseconds: 600),
              curve: Curves.decelerate);
        });
      },
      child: Align(
          alignment:Alignment.center,
          child: Text(
            '$text',
            style: TextStyle(
                fontWeight: pageIndex==index?FontWeight.w900:FontWeight.w500,
                fontSize: pageIndex==index?22:16,
                color: pageIndex==index?Colors.black87:Colors.black45,
            ),
          ),
      ),
    );
  }

  Widget wallpaper({context,primaryColor,secondaryColor,beginAlignment,endAlignment}){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor,secondaryColor],
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
    );
  }
  
}
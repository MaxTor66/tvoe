import 'package:flutter/material.dart';


import 'home.dart';

class PrimaryPage extends StatefulWidget {

 PrimaryPage({Key? key}) : super(key: key);

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int _selectedIndex = 0;

  void _onItemTapped(index) {

    setState(() {

      _selectedIndex = index;

    });
  }
  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    Center(child: Text("Second page", style:TextStyle(color:Colors.white))),
    Center(child: Text("Third page", style:TextStyle(color:Colors.white))),
    Center(child: Text("Fourth page", style:TextStyle(color:Colors.white))),
    Center(child: Text("Fifth page", style:TextStyle(color:Colors.white))),

  ];
  @override
  Widget build(BuildContext context){
    PageController controller = PageController(initialPage: 0);
    return  Scaffold(

      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body:

      Stack(
          children: [


            PageView(        /// Wrapping the tabs with PageView
              controller: controller,
              children: widgetOptions,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex= index;     /// Switching bottom tabs
                });
              },
            ),



          ]
      ),


      bottomNavigationBar:  SizedBox(height: 90,
        child: BottomNavigationBar(

          backgroundColor: Color(0xFF232326),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home,shadows: <Shadow>[
              Shadow(color: Colors.purpleAccent, blurRadius: 50.0, offset: Offset(0, 0))
            ],),
            label: 'Главная',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.movie),
            activeIcon: Icon(Icons.movie,shadows: <Shadow>[
              Shadow(color: Colors.purpleAccent, blurRadius: 50.0, offset: Offset(0, 0))
            ],),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite_outline,shadows: <Shadow>[
              Shadow(color: Colors.purpleAccent, blurRadius: 50.0, offset: Offset(0, 0))
            ],),

            label: 'Моё',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            activeIcon: Icon(Icons.tv,shadows: <Shadow>[
              Shadow(color: Colors.purpleAccent, blurRadius: 50.0, offset: Offset(0, 0))
            ],),
            label: 'ТВ-каналы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2_outlined,shadows: <Shadow>[
              Shadow(color: Colors.purpleAccent, blurRadius: 50.0, offset: Offset(0, 0))
            ],),
            label: 'Профиль',
          ),

        ],
        // currentIndex: _selectedIndex,
        currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: (index){
          controller.jumpToPage(index);
          _onItemTapped(index);


        },

    ),
      ),

    );
}
}


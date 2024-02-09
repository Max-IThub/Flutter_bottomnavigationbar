import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> openBottomSheet(BuildContext context) async{
    final res = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return  SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [const Text('1234'),

          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop('1234');
            },
            child: const Text('tap me'),
          )
            ],
          ),
        );
      },
    );
    print(res);
  }


Future<void> openAlertDialog(BuildContext context) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('1234'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
            }, 
            child: const Text('YES')),
            TextButton(
              onPressed: () {
              Navigator.of(context).pop(false);
            }, 
            child: const Text('NO')),
          ],
        );
      },
    );
    print(res);
  }

  int selectedIndex = 0;

  List<Widget> widgets =  [
    Scaffold(
    appBar: AppBar(
      title: const Text('home'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: Center(
      child: Column(
        children: [
        ElevatedButton(
          onPressed: () {
            openAlertDialog(context);
          },child: const Text('Привет!'),
        )
        ]
      ),
    ),
   ),
   Scaffold(
    appBar: AppBar(
      title: const Text('work'),
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
    ),

   ),
   Scaffold(
    appBar: AppBar(
      title: const Text('profile'),
      centerTitle: true,
      backgroundColor: Colors.yellow,
    ),

   ),
  ];

  void changeIndex (int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     body: widgets[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        onTap: (value) => changeIndex(value),
      ),

    );
  }
}

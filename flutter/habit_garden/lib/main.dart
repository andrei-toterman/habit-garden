import 'package:flutter/material.dart';
import 'listItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem<String>> list;

  @override
  void initState(){
    super.initState();
    populateData();
  }

  void populateData(){
    list = [];
    list.add(ListItem<String>("Read more"));
    list.add(ListItem<String>("Exercise"));
    list.add(ListItem<String>("Less social media"));
    list.add(ListItem<String>("Eat healthier"));
    list.add(ListItem<String>("Quit smoking"));
    list.add(ListItem<String>("Practice a skill"));
    list.add(ListItem<String>("Drink water"));
    list.add(ListItem<String>("Get enough sleep"));
    list.add(ListItem<String>("Don't skip breakfast"));
    list.add(ListItem<String>("Spend money wisely"));
    list.add(ListItem<String>("Learn something new everyday"));
    list.add(ListItem<String>("Spend more time with your family/friends"));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text("Habits"),

    ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: _getListItemTile,
      ),
    );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          list[index].isSelected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        color: list[index].isSelected ? Colors.red[100] : Colors.white,
        child: ListTile(
          title: Text(list[index].data),
        ),
      ),
    );
  }
}

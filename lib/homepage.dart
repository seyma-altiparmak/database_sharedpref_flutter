import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  Future<void> test() async{
    var sp = await SharedPreferences.getInstance();
    
    sp.setString(("name"), "Seyma");
    sp.setInt("age", 22);
    sp.setDouble("boy", 1.68);
    sp.setBool("she", true);

    var friends = <String>[];
    friends.add(("mehmet"));
    friends.add(("fatma"));

    sp.setStringList("friendsList", friends);

    String name_ = sp.getString("name") ?? "noname";
    int age_ = sp.getInt("age") ?? 0;
    double boy_ = sp.getDouble("boy") ?? 0;
    bool she_ = sp.getBool("she") ?? false;

    print("name : $name_");
    print("age : $age_");
    print("boy : $boy_");
    print("she : $she_");

    var friendsList = sp.getStringList("friendsList");

    if(friendsList != null){
      for(var i in friendsList){
        print("my friend : $i");
      }
    }

    sp.remove("name");
    print("name : $name_");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Database S.P."),),
      body: 
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Home page",style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}

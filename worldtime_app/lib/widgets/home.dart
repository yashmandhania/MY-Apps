import 'package:flutter/material.dart';
//import 'package:worldtime_app/services/world_time.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map  data={};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    // set background image
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    var bgColor = data['isDaytime'] ? Colors.white70 : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'isDaytime':result['isDaytime'],
                          'flag':result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.tealAccent,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color:  Colors.teal,
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color:  Colors.teal,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                    data['time'],
                    style: TextStyle(
                      color:  Colors.teal,
                      fontSize: 66.0,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

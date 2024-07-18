import 'package:aimsprojectmanagement/project_info_page.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map> projects = [
    {
      'name' : 'MV - AN NISA',
      'description' : 'PRODUCTION OF MV AN NISA',
      'image' : 'https://www.dagangnews.com/sites/default/files/inline-images/WhatsApp%20Image%202022-09-12%20at%207.18.27%20AM.jpeg'
    },
    {
      'name' : 'MV - AISHAH AIMS 4',
      'description' : 'TENDER WITH PETRONAS',
      'image' : 'https://photos.marinetraffic.com/ais/showphoto.aspx?shipid=708052'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        centerTitle: true,
      ),
      body: ListView.builder(
        //gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 600),
        itemBuilder: (BuildContext context, int index) {
          return GFCard(
            color: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(0),
            title: GFListTile(
              titleText: projects[index]['name'],
              subTitleText: projects[index]['description'],
            ),
            content: InkWell(
              child:  Column(
                children: [
                  Image.network(projects[index]['image'], height: 200, width:MediaQuery.of(context).size.width, fit: BoxFit.cover,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Text('Progress', style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            CircularPercentIndicator(
                              radius: 30.0,
                              lineWidth: 7.0,
                              percent: 0.5,
                              center: Text("50%"),
                              progressColor: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      Container(height: 30, child: VerticalDivider(color: Colors.grey, thickness: 2,)),
                      SizedBox(width: 5,),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Aims Global Holdings Sdn. Bhd.', style: TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis)),

                            ],
                          )
                      )
                    ],
                  )
                ],
              ),
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProjectInfoPage()));
              },
            ),
          );
        },
        itemCount: projects.length,
      ),
    );
  }
}

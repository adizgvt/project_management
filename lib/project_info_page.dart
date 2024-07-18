import 'package:aimsprojectmanagement/project_reports_page.dart';
import 'package:aimsprojectmanagement/purchase_record_page.dart';
import 'package:aimsprojectmanagement/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({Key? key}) : super(key: key);

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GFListTile(
              avatar: GFAvatar(backgroundImage: NetworkImage('https://www.dagangnews.com/sites/default/files/inline-images/WhatsApp%20Image%202022-09-12%20at%207.18.27%20AM.jpeg'),),
              titleText: "MV- AN NISA",
              subTitleText: "Production Of MV AN NISA",
            ),
            Container(
              height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 600),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: GFCard(
                        color: Colors.yellow.shade200,
                        elevation: 0,
                        padding: EdgeInsets.all(0),
                        title: GFListTile(
                          titleText: '10/12/2023',
                          subTitleText: 'WAN MUHAMMAD IZZUDDIN submitted a new report',
                        ),
                      ),
                    );
                  },
                  itemCount: 2,
                )
            ),
            Expanded(
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: [
                  MenuCard(
                    text: 'Detailed info',
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/214/214340.png',
                    subtitle: 'management',
                    onPressed: () {  },
                  ),
                  MenuCard(
                    text: 'Purchase order',
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/214/214348.png',
                    subtitle: 'procurement',
                    onPressed: () {  },
                  ),
                  MenuCard(
                    text: 'Delivery order',
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/214/214335.png',
                    subtitle: 'procurement',
                    onPressed: () {  },
                  ),
                  MenuCard(
                    text: 'Job reports',
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/214/214287.png',
                    subtitle: 'operation',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProjectReportsPage()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

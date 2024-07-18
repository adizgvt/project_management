import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProjectReportsPage extends StatefulWidget {
  const ProjectReportsPage({Key? key}) : super(key: key);

  @override
  State<ProjectReportsPage> createState() => _ProjectReportsPageState();
}

class _ProjectReportsPageState extends State<ProjectReportsPage> {

  List<Map> projects = [
    {
      'name' : 'IZZUDDIN',
      'description' : 'sample report',
      'details' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dictum nisi ipsum, et luctus sapien imperdiet eu. Vestibulum id enim et dui volutpat luctus non nec tortor. Phasellus tristique vel lectus eget tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus congue, augue vel lacinia efficitur,',
      'image' : 'https://www.dagangnews.com/sites/default/files/inline-images/WhatsApp%20Image%202022-09-12%20at%207.18.27%20AM.jpeg'
    },
    {
      'name' : 'AIZAT',
      'description' : 'sample report 2',
      'details' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dictum nisi ipsum, et luctus sapien imperdiet eu. Vestibulum id enim et dui volutpat luctus non nec tortor. Phasellus tristique vel lectus eget tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus congue, augue vel lacinia efficitur,',
      'image' : 'https://photos.marinetraffic.com/ais/showphoto.aspx?shipid=708052'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Reports'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                child: SfDateRangePicker(
                  headerStyle: const DateRangePickerHeaderStyle(textStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  monthCellStyle: const DateRangePickerMonthCellStyle(textStyle: TextStyle(color: Colors.orange)),
                  yearCellStyle: const DateRangePickerYearCellStyle(textStyle: TextStyle(color: Colors.orange)),
                  headerHeight: 75,
                  backgroundColor: Colors.transparent,
                  selectionTextStyle:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  rangeTextStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: Colors.orange,
                  startRangeSelectionColor: Colors.orange,
                  endRangeSelectionColor: Colors.orange,
                  todayHighlightColor: Colors.orange,
                  rangeSelectionColor: Colors.orange,
                  initialSelectedDate: DateTime.now(),
                  onSelectionChanged: (value) async {
                    context.loaderOverlay.show();
                    if(mounted) context.loaderOverlay.hide();
                  },
                ),
              )
          ),
          Expanded(
            flex: 7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 600),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: GFCard(
                      color: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.all(0),
                      title: GFListTile(
                        titleText: projects[index]['name'],
                        subTitleText: projects[index]['description'],
                        icon: InkWell(
                          child: Icon(
                            Icons.info,
                            color: GFColors.DARK,
                            size: 20,
                          ),
                          onTap: () {
                          },
                        ),
                      ),
                      content: InkWell(
                        child: Column(
                          children: [
                            Image.network(projects[index]['image'], height: 150, width:MediaQuery.of(context).size.width, fit: BoxFit.cover,),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  projects[index]['details'],
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                )
                            )
                          ],
                        ),
                        onTap: () async {
                          context.loaderOverlay.show();
                          //await createFileOfPdfUrl(url: Domain + '/aims' + companyDocumentList[index].documentUrl,).then((f) => remotePDFpath = f.path);
                          context.loaderOverlay.hide();
                          //Navigator.of(context).push(MaterialPageRoute(builder: (_) => PDFScreen(path: remotePDFpath, documentName: companyDocumentList[index].documentTitle)));
                        },
                      ),
                    ),
                  );
                },
                itemCount: projects.length,
              )
          )
        ],
      ),
    );
  }
}
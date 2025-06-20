import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/routes/routes_name.dart';
import '../../../../core/theming/colors_app.dart';
import '../../../scanner/presentation/ui/scanner_view.dart';

class optionsforapplication extends StatelessWidget {
  final List<String> texts = ['Store', 'Scan Now', 'Skin Diseases', 'History'];
  List<Map<String,String>> data = [
    {'text':'Medicines','image':'assets/images/store.jpg','navigator':'${RoutesName.medicinesview}'},
    {'text':'Scan Now','image':'assets/images/scan.png','navigator':'${RoutesName.scannerView}'},
    {'text':'Skin Diseases','image':'assets/images/skin diseases.jpg','navigator':'${RoutesName.categoryView}'},
    {'text':'History','image':'assets/images/history.jpg','navigator':'${RoutesName.historyView}'},
  ] ;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () async {
            //in case of camera
            if(index==1){
              final List<CameraDescription> cameras;
              cameras = await availableCameras();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScannerView(cameras: cameras),
                ),
              );
            }
            else {
              Navigator.pushNamed(
                context,
                data[index]['navigator'] ?? '',
              );
            }
          },
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        '${data[index]['image']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsApp.mainBlue.withOpacity(0.3), // Adjust opacity as needed
                    ),
                  ),
                ],
              ),

              Center(child: Text('${data[index]['text']}',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
            ],
          ),
        );
      }),
    );


  }
}

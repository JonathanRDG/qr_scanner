import 'package:flutter/material.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';
class Maps_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getAllScans(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ScanModel>> snapshot) {

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator()  );
        }

        final scans = snapshot.data;

        if(scans.length == 0){
          return Center(child: Text('no info'));
        }

        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) => ListTile(
              leading: Icon(Icons.cloud_queue,
                            color: Theme.of(context).primaryColor,),
              title:  Text(scans[i].value),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            )
        );
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../Login.dart';

class somefuntionsmentor{

  Future<List<List<String>>> studentssessionlistupcoming() async {

    List<List<String>> temp =[];
    DateTime date = DateTime.now();
    int value = (date.hour.toDouble()+(date.minute.toDouble() / 60)).toInt();
    final QuerySnapshot snap =  await FirebaseFirestore.instance.collection("SessionDetails").doc(Email).collection("UniqueDetails").where('CompValue',isGreaterThanOrEqualTo: value).get();
    List<DocumentSnapshot> results =snap.docs;
    
    bool nextsession = false;
    for( var result in results){
      if(!nextsession){
        nextsession= true;
        continue;
      }
      List<String> obj =[];
      String name = result.data()['Name'];
      String sub = result.data()['Subselected'];
      String date1 = result.data()['SessionDate'];
      String timelap = result.data()['Duration'];
      obj.add(name);
      obj.add(sub);
      obj.add(date1);
      obj.add(timelap);
      temp.add(obj);
    }
    return temp;
}
  Future<List<List<String>>> studentssessionlistprevious() async{

    List<List<String>> temp =[];
    DateTime date = DateTime.now();
    int value = (date.hour.toDouble()+(date.minute.toDouble() / 60)).toInt();
    final QuerySnapshot snap =  await FirebaseFirestore.instance.collection("SessionDetails").doc(Email).collection("UniqueDetails").where('CompValue',isLessThan: value).get();
    List<DocumentSnapshot> results =snap.docs;

    bool nextsession = false;
    for( var result in results){
      if(!nextsession){
        nextsession= true;
        continue;
      }
      List<String> obj =[];
      String name = result.data()['Name'];
      String sub = result.data()['Subselected'];
      String date1 = result.data()['SessionDate'];
      String timelap = result.data()['Duration'];
      obj.add(name);
      obj.add(sub);
      obj.add(date1);
      obj.add(timelap);
      temp.add(obj);
    }
    return temp;
  }
  Future<List<String>> currentsession() async {
    DateTime date = DateTime.now();
    int value = (date.hour.toDouble()+(date.minute.toDouble() / 60)).toInt();
    final QuerySnapshot snap =  await FirebaseFirestore.instance.collection("SessionDetails").doc(Email).collection("UniqueDetails").where('CompValue',isGreaterThanOrEqualTo: value).get();
    List<DocumentSnapshot> results =snap.docs;
    var result = results[0];
    List<String> obj =[];
    String name = result.data()['Name'];
    String sub = result.data()['Subselected'];
    String date1 = result.data()['SessionDate'];
    String timelap = result.data()['Duration'];
    obj.add(name);
    obj.add(sub);
    obj.add(date1);
    obj.add(timelap);
    return obj;

  }

}
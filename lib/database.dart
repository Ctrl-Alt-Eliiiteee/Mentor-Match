import 'package:cloud_firestore/cloud_firestore.dart';

class MenteeDatabaseService {
  final String uid;
  final String email;
  final String name;
  final String number;
  final String school;
  final String hobbies;
  final String tvShow;
  final String futureStream;
  final String time;
  final String birthdate;
  final String gender;
  final String board;
  final String studyclass;
  final String studySession;
  final String sessionLength;

  final CollectionReference userCollection =
      Firestore.instance.collection('MentorMentee');

  MenteeDatabaseService(
      this.uid,
      this.email,
      this.name,
      this.number,
      this.school,
      this.hobbies,
      this.tvShow,
      this.futureStream,
      this.time,
      this.birthdate,
      this.gender,
      this.board,
      this.studyclass,
      this.studySession,
      this.sessionLength);

  Future updateMenteeData() async {
    return await userCollection.doc(uid).set({
      'Email': email,
      'name': name,
      'number': number,
      'school': school,
      'hobbies': hobbies,
      'tvShow': tvShow,
      'futureStream': futureStream,
      'time': time,
      'birthdate': birthdate,
      'gender': gender,
      'board': board,
      'studyClass': studyclass,
      'studySession': studySession,
      'sessionLength': sessionLength,
    });
  }
}

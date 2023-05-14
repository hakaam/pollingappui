import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DbProvider extends ChangeNotifier {
  String _message = '';
  bool _status = false;

  String get message => _message;
  bool get status => _status;

  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference pollCollection =
      FirebaseFirestore.instance.collection('polls');

  void addPoll(
      {required String question,
      required String duration,
      required List<Map> options}) async {
    _status = true;
    notifyListeners();
    try {
      final data = {
        'author': {
          'uid': user!.uid,
          'profileImage': user!.photoURL,
          'name': user!.displayName,
        },
        'dateCreated': DateTime.now(),
        'poll': {
          'total_votes': 0,
          'voters': <Map>[],
          'question': question,
          'duration': duration,
          'options': options,
        }
      };
      await pollCollection.add(data);
      _message ='Poll Created';
      _status=false;
      notifyListeners();
    }

    on FirebaseException catch (e) {
      _message = e.message!;
      _status = false;

      notifyListeners();
    } catch (e) {
      _message = 'Please try again....';
      _status = false;

      notifyListeners();
    }
  }
  void clear(){
    _message='';
    notifyListeners();


  }
}

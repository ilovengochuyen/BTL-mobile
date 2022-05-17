import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manga/model/ComicModel.dart';

class UserProvider with ChangeNotifier {
    String _userId = "ha";

    getUser() => _userId;
    setUser(String userId) => _userId = userId;
}
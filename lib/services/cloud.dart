import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/models/users.dart';

class Cloud {
  final cloudFirestore = Firestore.instance;
  DateTime time = DateTime.now();

  Future<void> saveUsers({id, userName, email, photoImg = ""}) async {
    await cloudFirestore.collection("users").document(id).setData({
      "userName": userName,
      "email": email,
      "photoImg": photoImg,
      "time": time,
    });
   
  }

   Future<Users> getUsers(id) async {
      DocumentSnapshot snapshot =
          await cloudFirestore.collection("users").document(id).get();
      if (snapshot.exists) {
        Users users = Users.createCloud(snapshot);
        return users;
      }
      return null;
    }
}

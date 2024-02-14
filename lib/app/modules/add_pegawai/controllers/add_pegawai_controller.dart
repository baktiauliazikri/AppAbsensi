import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddPegawaiController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController nipC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addPegawai() async{
    if (nameC.text.isNotEmpty && nipC.text.isNotEmpty && emailC.text.isNotEmpty){
      try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailC.text,
        password: "password"
      );

      if (userCredential.user != null){
        String? uid = userCredential.user!.uid;

        await firestore.collection("pegawai").doc(uid).set({
          "nip":nipC.text,
          "name":nameC.text,
          "nama":nameC.text,
          "email":nameC.text,
          "uid":uid,
          "createdAt" : DateTime.now().toIso8601String(),
        });

        await userCredential.user!.sendEmailVerification();
      }

      print(userCredential);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Lamah password ang laii", "paralu obat kuat?");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("lah tadaftar email ko", "Cubo nan lain");
      }
    } catch (e) {
      Get.snackbar("ndak bisa daftar do", "Cubo Liak");
    }
    }else{
      Get.snackbar("Ndak Bisa Do Cuyy", "Cubo Liak");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flelobna/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditNameDialog extends StatefulWidget {
  final String? initialFirstName;
  final String? initialLastName;

  const EditNameDialog({
    Key? key,
    this.initialFirstName,
    this.initialLastName,
  }) : super(key: key);

  @override
  _EditNameDialogState createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<EditNameDialog> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.initialFirstName);
    _lastNameController = TextEditingController(text: widget.initialLastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  AuthController authController = Get.put(AuthController());

  void _save() async{
    try {
      // Obtenez une référence à la collection des utilisateurs
      final collectionRef = FirebaseFirestore.instance.collection('users');

      // Recherchez le document de l'utilisateur par email
      final querySnapshot = await collectionRef.where('email', isEqualTo: GetStorage().read('email')).get();

      // Vérifiez si un utilisateur a été trouvé
      if (querySnapshot.docs.isNotEmpty) {
        // Obtenez l'ID du premier document trouvé (supposons qu'il y ait un seul utilisateur par email)
        final docId = querySnapshot.docs.first.id;

        // Mettez à jour le document avec les nouveaux prénom et nom
        await collectionRef.doc(docId).update({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
        });
        authController.getUserByEmail(GetStorage().read('email'));
        print('Utilisateur mis à jour avec succès.');
      } else {
        print('Aucun utilisateur trouvé avec cet email.');
      }
    } catch (e) {
      print('Erreur lors de la mise à jour de l\'utilisateur: $e');
    }


    print(
        'Prénom: ${_firstNameController.text}, Nom: ${_lastNameController.text}');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Modifier le nom'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'Prénom'),
            // onChanged: (value) {
            //   authController.userDetail.value.firstName = value;
            // },
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Nom'),
            // onChanged: (value) {
            //   authController.userDetail.value.lastName = value;
            // },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Annuler'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Sauvegarder'),
          onPressed: _save,
        ),
      ],
    );
  }
}

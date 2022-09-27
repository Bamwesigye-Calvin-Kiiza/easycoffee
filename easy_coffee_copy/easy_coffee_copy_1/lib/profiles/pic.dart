// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class EditProfile extends StatefulWidget {
//    EditProfile({Key key}) : super(key: key);
//   TextEditingController NameController = TextEditingController();
//   TextEditingController PhoneController = TextEditingController();
//   TextEditingController EmailController = TextEditingController();
//   TextEditingController DistrictController = TextEditingController();
//   TextEditingController TypeController = TextEditingController();
//   TextEditingController ImageController = TextEditingController();

//   _buildTextField(TextEditingController controller, String labelText) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//           color: Colors.amber, border: Border.all(color: Colors.blue)),
//       child: TextField(
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             labelText: labelText,
//             labelStyle: TextStyle(color: Colors.white),
//             // prefix: Icon(icon),
//             border: InputBorder.none),
//       ),
//     );
//   }

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit profile'),
//       ),
//       body: Column(
//         children: [
//           _buildTextField(NameController,'Name');]),
//     );
//   }
// }

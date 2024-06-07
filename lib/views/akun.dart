import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final TextEditingController namaController = TextEditingController(text: 'Ujang');
  final TextEditingController emailController = TextEditingController(text: 'Sleman rt2 rw2');
  final TextEditingController nikController = TextEditingController(text: '1242314231414');
  final TextEditingController noHpController = TextEditingController(text: '0882314784');
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Akun'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: 350.0,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image == null
                          ? NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Anies_Baswedan%2C_Candidate_for_Indonesia%27s_President_in_2024.jpg/220px-Anies_Baswedan%2C_Candidate_for_Indonesia%27s_President_in_2024.jpg',
                            )
                          : FileImage(_image!) as ImageProvider,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mas Anis',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Text(
                        'Ganti Foto',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    buildTextField('Nama', namaController),
                    SizedBox(height: 10),
                    buildTextField('Email', emailController),
                    SizedBox(height: 10),
                    buildTextField('NIK', nikController),
                    SizedBox(height: 10),
                    buildTextField('No.Hp', noHpController),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text('Log Out'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          controller: controller,
          readOnly: true,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Akun(),
    debugShowCheckedModeBanner: false,
  ));
}

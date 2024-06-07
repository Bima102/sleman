import 'package:flutter/material.dart';
import 'package:si_desa_sleman/views/LoginPage.dart';

class Akun extends StatelessWidget {
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
      body: Container(
        color: Colors.blue.shade100,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), 
              onBackgroundImageError: (exception, stackTrace) {
                print('Failed to load image');
              },
              child: ClipOval(
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade700,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Mas Anis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profil Lengkap'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman profil lengkap
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Ganti Password'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman ganti password
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Akun(),
  ));
}

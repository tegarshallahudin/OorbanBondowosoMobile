import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/theme.dart';

class lkp_profil extends StatefulWidget {
  lkp_profil({Key? key}) : super(key: key);



  @override
  _lkp_profilState createState() => _lkp_profilState();
}

class _lkp_profilState extends State<lkp_profil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('asset/logo/Group_1.png',
        height: 100,
        width: 100,
        ),
        backgroundColor: Colors.white70,
        ),
      body: SafeArea(
        child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Pengaturan Akun',style: blackTextStlye,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: ElevatedButton( onPressed: (){Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) => Profil()),
                  );}, child: Text('Simpan  ',style: whiteTextStlye,),
                 style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                   )
                  ),
                 ))
                )
              ],
            ),
            Image(image: AssetImage('asset/logo/line1.png')),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children :[
                  Container(
                    height: 500,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: [
                        Image(image: AssetImage('asset/logo/ilus5.png'),
                        height: 100,
                        width: 100,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Nama Lengkap',
                          ),
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Password',
                          ),
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Email',
                          ),
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Alamat',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'NIK',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'No Handphone',
                          ),
                        ),
                        ListTile(
                          title: Text('Jenis Kelamin'),
                          trailing: DropdownButton(
                            value: 1,
                            hint: const Text('Pilih'), items: [],
                          ),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            )
         ],
        ),
       ),
      ),
    );
  }
}
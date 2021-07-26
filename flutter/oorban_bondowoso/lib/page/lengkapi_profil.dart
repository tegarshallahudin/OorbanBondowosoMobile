import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_lengkapi.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lkp_profil extends StatefulWidget {
  lkp_profil({Key? key}) : super(key: key);

  @override
  _lkp_profilState createState() => _lkp_profilState();
}

class _lkp_profilState extends State<lkp_profil> {

  late int _idUser;

  final nama_lengkap = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final alamat = TextEditingController();
  final nik = TextEditingController();
  final no_hp = TextEditingController();
  final gender = TextEditingController();

  get prefs => null;

  @override
  void initState() { 
    super.initState();
    getLoginSession();
  }

  getLoginSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    int? idUser = prefs.getInt('id_user');
    print('akun $idUser');
    setState(() {
      print('get string $idUser');
      this._idUser = idUser!;
    });
    // return idUser;
  }

  processlengkapidata(context){
    print('id :${this._idUser}');
    print('nama :${nama_lengkap.text}');
    print('username :${username.text}');
    print('password :${password.text}');
    print('email :${email.text}');
    print('alamat :${alamat.text}');
    print('nik :${nik.text}');
    print('no_hp :${no_hp.text}');
    print('gender :${gender.text}');
    ApiService.get_lengkapi(this._idUser.toString(), nama_lengkap.text, username.text, password.text, email.text, alamat.text, nik.text, no_hp.text, gender.text
    ).then((response) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if ( response.masssage.contains('Sukses')){
        print('Berhasil');
        prefs.setInt('id_user', response.data.id);
        prefs.setString('nama_lengkap', response.data.namaLengkap);
        prefs.setString('email', response.data.email);
        prefs.setString('no_hp', response.data.noHp);
        prefs.commit();
        Navigator.pop(context);

      }
      else {
        print('Gagal');
      }
    }).catchError((e){
      print('eror : $e');
    });
  }

  static const menuItems = <String>[
    'pria',
    'wanita',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'One';
  

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
                  child: ElevatedButton( onPressed: (){
                    processlengkapidata(context);
                  }, 
                 child: Text('Simpan',style: whiteTextStlye,),
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
                    height: 550,
                    padding: const EdgeInsets.symmetric(vertical: 0.0,),
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
                          controller: nama_lengkap,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Nama Lengkap',
                          ),
                        ),
                        TextFormField(
                          controller: username,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Password',
                          ),
                        ),
                        TextFormField(
                          controller: email,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Email',
                          ),
                        ),
                        TextFormField(
                          controller: alamat,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Alamat',
                          ),
                        ),
                        TextFormField(
                          controller: nik,
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
                          controller: no_hp,
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'No Handphone',
                          ),
                        ),
                        // ListTile(
                        //   title: const Text('Jenis Kelamanin'),
                        //   trailing: DropdownButton(
                        //     value: _btn1SelectedVal,
                        //     hint: const Text('Pilih'),
                        //     onChanged: (String newValue){
                        //       setState(() {
                        //         _btn1SelectedVal = newValue;
                        //       });
                        //     },
                        //     items: _dropDownMenuItems,
                        //   ),
                        // )
                        TextFormField(
                          controller: gender,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: 'Masukkan disini',
                            labelText: 'Jenis Kelamin',
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/yapilacaklar_kayit_cubit.dart';

class YapilacaklarKayitSayfa extends StatefulWidget {
  const YapilacaklarKayitSayfa({Key? key}) : super(key: key);

  @override
  State<YapilacaklarKayitSayfa> createState() => _YapilacaklarKayitSayfaState();
}

class _YapilacaklarKayitSayfaState extends State<YapilacaklarKayitSayfa> {
  var tfYapilacakIs =TextEditingController();
  Future<void> kayit(String yapilacak_is) async {
    print("Kisi kayit $yapilacak_is");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yapılacaklar"),),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(controller: tfYapilacakIs,
                    decoration: InputDecoration(hintText: "Yapılacak İş")),
                ElevatedButton(onPressed: (){
                  context.read<YapilacaklarKayitCubit>().kayit(tfYapilacakIs.text);
                }, child:const Text("KAYDET")),
              ],
            ),
          ),
        ),
      );
  }
}

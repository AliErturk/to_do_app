import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/yapilacaklar_detay_cubit.dart';
import 'package:to_do_app/entity/yapilacaklar.dart';

class YapilacaklarDetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;


  YapilacaklarDetaySayfa({required this.yapilacak});

  @override
  State<YapilacaklarDetaySayfa> createState() => _YapilacaklarDetaySayfaState();
}

class _YapilacaklarDetaySayfaState extends State<YapilacaklarDetaySayfa> {

  var tfYapilacakIs =TextEditingController();
  @override
  void initState() {
    super.initState();
    tfYapilacakIs.text=widget.yapilacak.yapilacak_is;
  }
  Future<void>guncelle(int yapilacak_id,String yapilacak_is) async{
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
                context.read<YapilacaklarDetayCubit>().guncelle(widget.yapilacak.yapilacak_id, tfYapilacakIs.text);
              }, child:const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}

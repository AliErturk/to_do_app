import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/entity/yapilacaklar.dart';
import 'package:to_do_app/views/yapilacaklar_detay_sayfa.dart';
import 'package:to_do_app/views/yapilacaklar_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
        onChanged: (aramaSonucu){
          context.read<AnasayfaCubit>().ara(aramaSonucu);
        },):const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu ?
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyorMu=false;
                  context.read<AnasayfaCubit>().yapilacaklariYukle();
                });
              }, icon: Icon(Icons.clear)):
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyorMu=true;
                });
              }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yapilacaklar>>(
        builder: (context,yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context,indeks){
                var yapilacak = yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacaklarDetaySayfa(yapilacak:yapilacak),)).then((value) {
                      context.read<AnasayfaCubit>().yapilacaklariYukle();
                    });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${yapilacak.yapilacak_is}"),
                        ),
                        Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${yapilacak.yapilacak_is} silinsin mi ?"),
                            action: SnackBarAction(label: "Evet", onPressed: (){
                              context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id);
                            }),),
                          );
                        }, icon: Icon(Icons.delete_outlined)),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacaklarKayitSayfa(),)).then((value) {
            context.read<AnasayfaCubit>().yapilacaklariYukle();
          });
        },
      ),
    );

  }
}

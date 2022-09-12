import 'package:to_do_app/entity/yapilacaklar.dart';
import 'package:to_do_app/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository{

  Future<void> yapilacakKayit(String yapilacak_is) async{
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.insert("Yapilacaklar", bilgiler);
  }

  Future<void> yapilacakGuncelle(int yapilacak_id, String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_id"] =yapilacak_id;
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.update("Yapilacaklar", bilgiler,where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<List<Yapilacaklar>> tumYapilacaklariAl() async {
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT*FROM Yapilacaklar");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });

  }

  Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT*FROM Yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");
    return List.generate(maps.length, (index) {
      var satir=maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<void> yapilacakSil(int yapilacak_id) async {
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    await db.delete("Yapilacaklar",where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/entity/yapilacaklar.dart';
import 'package:to_do_app/repo/yapilacaklar_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{
  AnasayfaCubit():super(<Yapilacaklar>[]);
  var krepo =YapilacaklarDaoRepository();

  Future<void> yapilacaklariYukle() async {
    var liste = await krepo.tumYapilacaklariAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var  liste= await krepo.yapilacakAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await krepo.yapilacakSil(yapilacak_id);
    await yapilacaklariYukle();
  }

}
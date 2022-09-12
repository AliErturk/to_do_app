import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/repo/yapilacaklar_dao_repository.dart';

class YapilacaklarDetayCubit extends Cubit<void>{
  YapilacaklarDetayCubit(): super(0);
  var krepo= YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async{
    await krepo.yapilacakGuncelle(yapilacak_id, yapilacak_is);
  }
}
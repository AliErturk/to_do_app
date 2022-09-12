import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/repo/yapilacaklar_dao_repository.dart';

class YapilacaklarKayitCubit extends Cubit<void> {
  YapilacaklarKayitCubit(): super(0);
  var krepo=YapilacaklarDaoRepository();

  Future<void> kayit( String yapilacak_is )async {
    await krepo.yapilacakKayit(yapilacak_is);
  }
}
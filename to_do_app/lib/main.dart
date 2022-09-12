import 'package:flutter/material.dart';
import 'package:to_do_app/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/cubit/yapilacaklar_detay_cubit.dart';
import 'package:to_do_app/cubit/yapilacaklar_kayit_cubit.dart';
import 'package:to_do_app/views/anasayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit(),),
        BlocProvider(create: (context) => YapilacaklarKayitCubit(),),
        BlocProvider(create: (context) => YapilacaklarDetayCubit(),)

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/providers/all_provider.dart';

class GorevSayisi extends ConsumerWidget {
  const GorevSayisi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gorevSayisi = ref.watch(toduCount);

    return Container(
      //color: Colors.red,
      width: MediaQuery.of(context).size.width ,
      child: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/85),
        child: Text(
          gorevSayisi[1].toString() + ' / ' + gorevSayisi[0].toString(),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

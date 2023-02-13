import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/providers/all_provider.dart';

class FilterList extends ConsumerWidget {
  int durum;
  String aciklama;
  FilterList({Key key, this.durum, this.aciklama}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(sayi);
    return Expanded(
      child: Container(
       // color: Colors.green,
        child: Center(
          child: InkWell(
            onTap: () {
              ref.read(sayi.notifier).state = [
                durum,
                filter[1],
                filter[2],
                filter[3],
                filter[4]
              ];
            },
            child: Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.height / 70),
              child: Center(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        aciklama,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 200),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 200,
                        width: MediaQuery.of(context).size.width / 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ref.read(sayi.notifier).state[0] == durum
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

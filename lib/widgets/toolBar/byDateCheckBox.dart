import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/providers/all_provider.dart';

class ByDateCheckBox extends ConsumerWidget {

  const ByDateCheckBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(sayi);
    return Container(
        height: MediaQuery.of(context).size.height / 16,
    //  width: MediaQuery.of(context).size.width / 20,


   //   color: Colors.yellow,
      child: Row(
        children: [
          Text(
            ' By date   ',
            style: TextStyle(color: Colors.blue),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Container(
              
              //width: MediaQuery.of(context).size.width / 15,
            //  height: MediaQuery.of(context).size.height / 14,
             // color: Colors.red,
              child: Checkbox(
                activeColor: Colors.blue,
                checkColor: Colors.white,
                value: filter[4],
                onChanged: (value) {
                  ref.read(sayi.notifier).state = [
                    1,
                    filter[1],
                    filter[2],
                    filter[3],
                    !filter[4]
                  ];
                  // state.toggle(item.id, index, item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

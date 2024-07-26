import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Custombotomnavigationbar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final void Function(int) onTap;
  const Custombotomnavigationbar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
    super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC.fromContextWidth(context, 6.5),
      decoration: BoxDecoration(
        color: Colors.white,
        border:Border.all(
            color: Colors.grey.withOpacity(.5),
            width: 2
        )
      ),
      child: Row(
        children: List.generate(items.length, (n){

          final item = items[n];

          return Expanded(child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: InkWell(
              onTap: (){
                onTap(n);
              },
              child: Ink(
                color: (currentIndex==n)?const Color.fromRGBO(254, 246, 214, 1):Colors.white,
                child: Center(child:Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconTheme(data: IconThemeData(color: currentIndex==n?Colors.red:Colors.black), child: item.icon),
                    const SizedBox(height: 2,),
                    Text(item.label??"",style: TextStyle(color: currentIndex==n?Colors.red:Colors.black),)
                  ],
                )),
              ),
            ),
          ));
        }),
      ),
    );
  }
}

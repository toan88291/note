import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_circle/utils/app_color.dart';
import 'package:ring_circle/utils/app_image.dart';

import 'custom_dropdown.dart';

class ToolbarPlayGame extends StatefulWidget {
  @override
  _ToolbarPlayGameState createState() => _ToolbarPlayGameState();
}

class _ToolbarPlayGameState extends State<ToolbarPlayGame> {
  GlobalKey key = GlobalKey();

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
          Container(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Available',
                          style: const TextStyle(
                              color: AppColor.color_purple_body,
                              fontFamily: 'SF')),
                      Row(
                        children: [
                          Text(
                            '76.21250100',
                            style: TextStyle(color: AppColor.color_white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: SvgPicture.asset(AppImage.icon_1),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    key: key,
                    onTap: () {
                      RenderBox box = key.currentContext.findRenderObject();
                      Offset position = box.localToGlobal(Offset.zero);
                      double y = position.dy;
                      double x = position.dx;
                      print('position y: $y');
                      print('position x: $x');
                      showDropDown(context,x + 36,y + 38);
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImage.icon_2))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDropDown(
      BuildContext context, double x, double y) async {
    var route = PageRouteBuilder(
        pageBuilder: (context, v1, v2) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              print('abc');
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: y,
                    right: MediaQuery.of(context).size.width - x,
                    child: GestureDetector(
                      onTap: (){
                        print('click');
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Color(0xff24293A),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
    }, opaque: false);
    Navigator.of(context).push(route);
  }
}

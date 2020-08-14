//////////////////////////////////
cd ios/
  pod cache clean --all
  pod deintegrate --verbose
  pod setup --verbose
  pod install --verbose
////////////////////Plugin ////////////
Flutter Enhancement suite
Flutter Intl
///////////////////////////////
 flutter pub run build_runner build --delete-conflicting-outputs
///////////////get size Stack //////////
Stack(
  key: _commonContainerKey,
    ...
    final RenderBox renderBox = _commonContainerKey.currentContext.findRenderObject();
    double width = renderBox.size.width;
    ...
)
///////////////// Convert time ////////////////////////////////
String formatTimeOfDay(TimeOfDay tod) {
    final dt = DateTime(tod.hour, tod.minute);
    final format = DateFormat.jm(); ////////// "06:30 AM"
    return format.format(dt);
}

intl: ^0.16.1

/////////////////  Live Template StateFulWidget //////////////
    
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class $NAME$ extends StatefulWidget {
  static const ROUTE_NAME = '$NAME$';
  @override
  _$NAME$State createState() => _$NAME$State();
}

class _$NAME$State extends State<$NAME$> {
  static const TAG = '$NAME$';
  @override
  Widget build(BuildContext context) {
    return Container($END$);
  }
}

- NAME: capitalize(underscoresToCamelCase(fileNameWithoutExtension()))
    
///////////////. Live Template StateLessWidget //////////////
    
import 'package:flutter/material.dart';

class $NAME$ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
- NAME: capitalize(underscoresToCamelCase(fileNameWithoutExtension()))
    
/////////////////////////// Json Serializable ////////////////////
    
import 'package:json_annotation/json_annotation.dart';
part '$FILE$.g.dart';

@JsonSerializable()
class $NAME$ {
    factory $NAME$.fromJson(Map<String, dynamic> json) => _$$$NAME$FromJson(json);

    Map<String, dynamic> toJson() => _$$$NAME$ToJson(this$END$);
}
- FILE: fileNameWithoutExtension()
- NAME: capitalize(camelCase(fileNameWithoutExtension()))

///////////////////////////// log  //////////////////////////
    
developer.log('$METHOD_NAME$', name: TAG);
- METHOD_NAME: dartMethodName()
    
///////////////////////////// log (paramter) //////////////////////////
    
developer.log('$METHOD_NAME$ $METHOD_PARAMS$', name: TAG);

- METHOD_NAME: dartMethodName()

- METHOD_PARAMS: dartMethodParameters()
    
///////////////////////////convert datetime firebase////////////////////////////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConvertDatetime  implements JsonConverter<DateTime, Timestamp> {
  const TimestampConvertDatetime();
  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    if (object == null) {
      return null;
    } else {
      return Timestamp.fromDate(object);
    }
  }
}
/////////funtion callback /////
void scheduleReload() {
    SchedulerBinding.instance.scheduleFrameCallback(tick);
  }
  void tick(Duration timestamp) {
    Future.delayed(const Duration(milliseconds: 60000), () {
      if(!mounted) {
        return;
      }
      _checkGps();
      scheduleReload();
    });
  }
Future.doWhile(() async {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
});

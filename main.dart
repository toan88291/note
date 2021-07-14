//// call function of parrent /////
context.findAncestorWidgetOfExactType<ParrentWidget>()?.function();

////////state bloc /////////////
part of '$FILE$.dart';

abstract class $NAME${
  Data data;
  $NAME$({this.data});
}

class InitState extends $NAME${
  InitState({Data data}) : super(data: data);
}

class Data {

  String value;

  Data(
      {
        this.value,
      });

  Data copyWith(
      {
        String value,
      }) =>
      Data(
          value: value ?? this.value,
      );
}

-File : substringBefore(regularExpression(fileName(),"_state","_cubit"),".")
-Name : capitalize(camelCase(fileNameWithoutExtension()))
        
////////cubit bloc /////////////
import 'package:flutter_bloc/flutter_bloc.dart';
part '$FILE$.dart';

class $NAME$ extends Cubit<$STATE$>{
    $NAME$($STATE$ state) : super(state);
}

-File : concat(substringBefore(regularExpression(fileName(),"_cubit",""),"."),"_state")
-Name : capitalize(camelCase(fileNameWithoutExtension()))
-State : concat(capitalize(camelCase(substringBefore(regularExpression(fileName(),"_cubit",""),"."))),"State")
/////// intl generate 
pub global run intl_utils:generate
//////////////////// notifi channel///////////////
        val channelId = getString(R.string.notification_channel_name)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelName: CharSequence = getString(R.string.notification_channel_name)
            val importance: Int = NotificationManager.IMPORTANCE_HIGH
            val notificationChannel = NotificationChannel(channelId, channelName, importance)
            notificationChannel.enableLights(true)
            notificationChannel.enableVibration(true)
            notificationChannel.setVibrationPattern(longArrayOf(100, 200, 300, 400, 500, 400, 300, 200, 400))
            notificationManager.createNotificationChannel(notificationChannel)
        }
        val mBuilder = NotificationCompat.Builder(applicationContext, channelId)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle("Test")
                .setContentText("You see me!")
                .setAutoCancel(true)
        notificationManager.notify(0, mBuilder.build())
                
        <meta-data
              android:name="io.flutter.embedding.android.SplashScreenDrawable"
              android:resource="@drawable/launch_background"
      />
  <string name="notification_channel_name">channel_name</string>
    <string name="notification_channel_description">123</string>
    <string name="default_notification_channel_id">CHANNEL_ID</string>
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

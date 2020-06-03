///////////////// Convert time ////////////////////////////////
String formatTimeOfDay(TimeOfDay tod) {
    final dt = DateTime(tod.hour, tod.minute);
    final format = DateFormat.jm(); ////////// "06:30 AM"
    return format.format(dt);
}

intl: ^0.16.1

/////////////////  Live Template StateFulWidget //////////////
    
import 'package:flutter/material.dart';

class $NAME$ extends StatefulWidget {
  @override
  _$NAME$State createState() => _$NAME$State();
}

class _$NAME$State extends State<$NAME$> {
  @override
  Widget build(BuildContext context) {
    return Container($END$);
  }
}

- capitalize(underscoresToCamelCase(fileNameWithoutExtension()))
    
///////////////. Live Template StateLessWidget //////////////
    
import 'package:flutter/material.dart';

class $NAME$ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
- capitalize(underscoresToCamelCase(fileNameWithoutExtension()))
///////////////////////////////////////////////////////////////


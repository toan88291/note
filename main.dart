String formatTimeOfDay(TimeOfDay tod) {
    final dt = DateTime(tod.hour, tod.minute);
    final format = DateFormat.jm(); ////////// "06:30 AM"
    return format.format(dt);
}

famtech 

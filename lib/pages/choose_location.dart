import 'package:flutter/material.dart';
import 'package:time_world_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime( location: 'London', flag: 'https://www.countryflags.com/wp-content/uploads/united-kingdom-flag-png-xl.png', url: 'Europe/London',),
    WorldTime( location: 'Athens', flag: 'https://cdn.britannica.com/49/1049-004-AE4BAD3E/Flag-Greece.jpg', url: 'Europe/Berlin',),
    WorldTime( location: 'Cairo', flag: 'https://www.flags-and-anthems.com/media/flags/flagge-aegypten.gif', url: 'Africa/Cairo',),
    WorldTime (location: 'Nairobi', flag: 'https://cdn.britannica.com/15/15-004-B5D6BF80/Flag-Kenya.jpg',url: 'Africa/Nairobi',),
    WorldTime( location: 'Chicago', flag: 'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg', url: 'America/Chicago',),
    WorldTime( location: 'New York', flag: 'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg', url: 'America/New_York',),
    WorldTime( location: 'Seoul', flag: 'https://cdn.britannica.com/200x500/49/1949-050-39ED83BA/Flag-South-Korea.jpg',url: 'Asia/Seoul',),
    WorldTime( location: 'Jakarta', flag: 'https://europa.eu/capacity4dev/system/files/images/photo/flag_of_indonesia.svg_.png', url: 'Asia/Jakarta',),
    WorldTime( location: 'New Delhi', flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg', url: 'Asia/Kolkata'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
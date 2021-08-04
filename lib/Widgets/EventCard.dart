import 'EventText.dart';
import 'EventChip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ems_bphc/main.dart';

class EventCard extends StatelessWidget {
  // const EventCard({Key? key}) : super(key: key);

  //late String oneline;
  //late List<String> topics;
  // late String description;
  //  late int duration;
  //  late bool registerationRequired;
  //  late int seatLimit;

  String type = 'COMPETITION';
  List<String> topics = ['topic1', 'topic2', 'topic3'];
  String name = 'Event Name';
  String organiser = 'phoenix';
  String description = 'Event Description';
  String oneline = 'One line about the event';
  DateTime eventDatetime = DateTime.now();
  int duration = 100;
  bool registerationRequired = false;
  int seatLimit = 120;
  bool isPaid = false;
  int paidPrice = 1;
  int totalRegisterations = 0;
  String posterURL = "";
  String chipLabel = 'Label';
  String eventphoto = 'photo';
  List<String> eventsDetails = ['one line', 'date', 'time', 'location', 'desc'];

  EventCard({
    required this.type,
    required this.topics,
    required this.name,
    required this.organiser,
    required this.description,
    required this.oneline,
    required this.eventDatetime,
    required this.duration,
    required this.registerationRequired,
    required this.seatLimit,
    required this.isPaid,
    required this.paidPrice,
    required this.totalRegisterations,
    required this.posterURL,
  });

  @override
  Widget build(BuildContext context) {

    List<EventChip> eventChips = [
      EventChip(chipName: 'Paid', chipColor: Colors.red),
      EventChip(chipName: '₹ $paidPrice', chipColor: Colors.yellowAccent),
    ];

    for(int i=0; i<topics.length; ++i){
      eventChips.add(EventChip(chipName: '${topics[i]}', chipColor: Colors.orange));
    }

    if (isPaid == false) {
      eventChips.first.chipName = 'Free';
      eventChips.removeAt(1);
    }

    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(8),
        color: Colors.grey.shade900,
        shadowColor: Colors.blue,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${name} (${type})',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                    Container(
                      height: 50,
                      child:
                          Expanded(child: Image.asset('images/$organiser.png')),
                    )
                  ],
                ),
              ),
              Row(
                children: eventChips,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Text(
                      '${oneline}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(child: Image(image: NetworkImage('$posterURL'))),
              SizedBox(
                height: 20,
              ),
              EventText(desc: description, eventDatetime: eventDatetime),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            //padding: EdgeInsets.all(8),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            primary: Colors.green,
                            onPrimary: Colors.black),
                        label: Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        icon: Icon(Icons.add),
                      ),
                    ),
                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       //padding: EdgeInsets.all(8),
                    //       // padding:
                    //       padding:
                    //           EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    //       primary: Colors.blue,
                    //       onPrimary: Colors.black),
                    //   label: Text(
                    //     'View More',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    //   icon: Icon(Icons.remove_red_eye),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

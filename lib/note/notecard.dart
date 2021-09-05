import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neuetodomitwerbung/note/note.dart';



final _lightColors = [
  Colors.white,
  Colors.yellow.shade300,
  Colors.greenAccent,
Colors.orange.shade300,
 Colors.blue.shade300,
  Colors.teal.shade300,
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Container(
      child: Card(
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Row(children: [ 
             
            
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                time,
                style: TextStyle(color: Colors.grey.shade700),
              ),
          ),
       
           
            ],),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                note.description,
                 style: TextStyle(
        color: Colors.blueGrey.shade900,
        fontSize: 15,fontWeight: FontWeight.normal,
        shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0),blurRadius: 2.0,color: Colors.white,
        ),
        ],
      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 100;
      case 2:
        return 100;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
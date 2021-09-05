import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:neuetodomitwerbung/ads/ads.dart';
import 'package:neuetodomitwerbung/note/db.dart';
import 'package:neuetodomitwerbung/note/editnote.dart';
import 'package:neuetodomitwerbung/note/note.dart';



class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
               Center(
                 child: Text("Aufgabe ändern & löschen", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.black,
                    ),
                  ],
              ),),
               ),
              SizedBox(height: 10,),
               Text(
                DateFormat.yMMMd().format(note.createdTime),
                style: TextStyle(color: Colors.white38),
              ),
            
              SizedBox(height: 8),
             
              Text(
                note.description,
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ), 
              SizedBox(height: 30,),
             
                editButton(),
             SizedBox(height: 10,),
          Container(
                height: 60,
                color: Colors.black,
                child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
          ) ),
              SizedBox(height: 50,),
          
                   Center(child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_bpqri9y8.json"),),
                   Align(alignment: Alignment.bottomRight,
                     child: deleteButton(),)
            ],
          ),
             bottomNavigationBar: Container(width: double.infinity,
        height: 60,
        color: Colors.black,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
          ) ));
      
    
  }

  Widget editButton()  => IconButton(
      icon: Icon(Icons.edit_outlined, color: Colors.red,size: 30,),
      onPressed: () async {
        if (isLoading) return;

        await  Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() {
    return IconButton(
      icon: Icon(Icons.delete, color: Colors.red,size: 30,),
      onPressed: () async {
        await NotesDatabase.instance.delete(widget.noteId);

        Navigator.of(context).pop();
      },
    );
  }
}

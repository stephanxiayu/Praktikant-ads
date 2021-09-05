import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:neuetodomitwerbung/ads/ads.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: double.infinity,
        height: 60,
        color: Colors.black,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
          ) ),SizedBox(height: 10,),
             Text("Aufgabe hinzufügen", style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.normal,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
              ),),
              SizedBox(height: 10,),
              
              SizedBox(height: 10),
              buildDescription(),
             Container(child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_ruoefq4p.json"),)
            ],
          ),
        ),
      );

 

  Widget buildDescription() => Container(  margin: EdgeInsets.all(10),height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.grey.shade900,// set border color
            width: 3.0),   // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
    child: TextFormField(
          maxLines: 5,
          initialValue: description,
          style: TextStyle(color: Colors.grey.shade900, fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '   schreib etwas.....',
            hintStyle: TextStyle(color: Colors.grey[700]),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'Du musst schon ein Text schreiben'
              : null,
          onChanged: onChangedDescription,
        ),
  );
}
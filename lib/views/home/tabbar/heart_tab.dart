import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/services/firebase_tym.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/loading/loading_dialog.dart';
import 'package:app_shoe_store/views/loading/screem_load.dart';
import 'package:app_shoe_store/views/loading/screen_love.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HeartTab extends StatefulWidget {
  const HeartTab({super.key});

  @override
  State<HeartTab> createState() => _HeartTabState();
}

class _HeartTabState extends State<HeartTab> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseTym tym = FirebaseTym();

  void _deleteLove(String id){
    setState(() {
       tym.deleteLoveData(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeDate = Provider.of<ThemeProvider>(context);
    final numberFormat = NumberFormat.decimalPattern();

    return Scaffold(
      appBar: AppBar(
        title: Text("Yêu Thích"),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tym.getTym(userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingDialog(),
            );
          }

          // Dữ liệu từ Firestore
          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
           
              return Container(
                margin: const EdgeInsets.only(left: 8,top: 8,right: 8),
                child: Stack(
                  
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themeDate.currentTheme == lightMode
                            ? Color.fromARGB(255, 241, 130, 50)
                            : Colors.black,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 130,
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${documents[index]['images'].toString()}"),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  documents[index]['name'].toString(),
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 8),
                                    width:
                                        MediaQuery.of(context).size.width * 0.25,
                                    child: Text(
                                      "${numberFormat.format(double.parse(documents[index]['priceNew'].toString()))} đ",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    width:
                                        MediaQuery.of(context).size.width * 0.35,
                                    child: Text(
                                      "${numberFormat.format(double.parse(documents[index]['priceOld'].toString()))} đ",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  documents[index]['cart'],
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                       alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                       _deleteLove(documents[index]["_id"]);
                        },
                        child: const Icon(Icons.close_outlined,size: 25,color: Colors.white,),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

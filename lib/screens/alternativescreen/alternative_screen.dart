
import 'package:flutter/material.dart';

import '../searchscreen/search_screen.dart';

class AlternativeScreen extends StatefulWidget {
  const AlternativeScreen({Key? key}) : super(key: key);

  @override
  State<AlternativeScreen> createState() => _AlternativeScreenState();
}

class _AlternativeScreenState extends State<AlternativeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 80),
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: Color(0xff153565),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Choisissez une Alternative", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16), textAlign: TextAlign.center, ),
                Padding( padding:EdgeInsets.only(top: 60, bottom: 15) ,
                    child: Text("Recherchez avec BLOOD4ALL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,)),
                Text("Veuillez choisir un des groupes\n sanguins ci-dessous", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal), textAlign: TextAlign.center,)
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top:90 , left: 26, right: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Le groupe demande n'est pas disponible \n vous pouvez rechercher un des groupes \n suivant : ",
                    style: TextStyle(color: Color(0xff12233D), fontWeight: FontWeight.w500, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff153565),),
                          child: Center(
                            child: Text("A+", style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff153565),),
                            child: Center(
                              child: Text("O-", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40, bottom: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffEF4923),
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, left: 48, right: 48),
                            fixedSize: const Size(279, 56),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                        },
                        child: const Text(
                          "Recherchez",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

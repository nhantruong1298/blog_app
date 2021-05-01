import 'package:flutter/material.dart';

class MainNote extends StatefulWidget {
  @override
  _MainNoteState createState() => _MainNoteState();
}

class _MainNoteState extends State<MainNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 13.0,
              children: List.generate(10, (index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.center,
                        child: Text('+', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.blue[50],
                    highlightColor: Colors.blue[50],
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Text('sadasdasdasdasdassad'),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edi_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.color});
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {
          print('**************************************');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditNoteView()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: const Text(
                    'Flutter Tips',
                    style: TextStyle(color: Colors.black, fontSize: 26),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: Text('Build Your Career With Tharwat Samy',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18)),
                  ),
                  trailing: IconButton(
                      focusColor: Colors.red,
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 25,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text('Oct 7,2024',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

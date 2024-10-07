import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
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
                          color: Colors.black.withOpacity(0.5), fontSize: 18)),
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
    );
  }
}

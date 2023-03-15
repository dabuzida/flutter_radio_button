import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

enum SingingCharacter { lafayette, jefferson }

class _MyRadioButtonState extends State<MyRadioButton> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: RadioListTile<SingingCharacter>(
                title: const Text('Lafayette'),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Container(
              width: 500,
              child: RadioListTile<SingingCharacter>(
                title: const Text('Thomas Jefferson'),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.green)),
              child: ListTile(
                title: const Text('Lafayette'),
                leading: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Radio<SingingCharacter>(
                    value: SingingCharacter.lafayette,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              child: ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyRadioButton2 extends StatefulWidget {
  const MyRadioButton2({super.key});

  @override
  State<MyRadioButton2> createState() => _MyRadioButton2State();
}

enum CampaignCallType {
  call('call'),
  screen('screen'),
  consent('consent');

  const CampaignCallType(this.serverValue);

  final String serverValue;

  String get localized {
    switch (this) {
      case call:
        return 'CampaignCallTypeCall';
      case screen:
        return 'CampaignCallTypeScreen';
      case consent:
        return 'CampaignCallTypeConsent';
    }
  }

  static CampaignCallType? make(String serverValue) {
    switch (serverValue) {
      case 'call':
        return CampaignCallType.call;
      case 'screen':
        return CampaignCallType.screen;
      case 'consent':
        return CampaignCallType.consent;
      default:
        return null;
    }
  }
}

enum CampaignSpeed {
  normal(1),
  slowWeak(2), // default
  slow(3),
  slowStrong(4);

  const CampaignSpeed(this.serverValue);

  final int serverValue;

  String get localized {
    switch (this) {
      case normal:
        return 'CampaignSpeedNormal';
      case slowWeak:
        return 'CampaignSpeedSlowWeak';
      case slow:
        return 'CampaignSpeedSlow';
      case slowStrong:
        return 'CampaignSpeedSlowStrong';
    }
  }

  static CampaignSpeed? make(int serverValue) {
    switch (serverValue) {
      case 1:
        return CampaignSpeed.normal;
      case 2:
        return CampaignSpeed.slowWeak;
      case 3:
        return CampaignSpeed.slow;
      case 4:
        return CampaignSpeed.slowStrong;
      default:
        return null;
    }
  }
}

enum CampaignMethodSendingResult {
  auto(true),
  manual(false);

  const CampaignMethodSendingResult(this.isServerValueAutoSend);
  final bool isServerValueAutoSend;

  static CampaignMethodSendingResult make(bool? isServerValueAutoSend) {
    if (isServerValueAutoSend == null) {
      return CampaignMethodSendingResult.auto;
    } else if (isServerValueAutoSend) {
      return CampaignMethodSendingResult.auto;
    } else {
      return CampaignMethodSendingResult.manual;
    }
  }
}

enum Vehicle {
  car('벤틀리'),
  fly('전투기'),
  boat('항공모함');

  const Vehicle(this.value);

  final String value;
}

class _MyRadioButton2State extends State<MyRadioButton2> {
  Vehicle _vehicle = Vehicle.car;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildUIRadioButton(
            title: Vehicle.car.value,
            checked: _vehicle == Vehicle.car,
            onTap: () {
              setState(() {
                _vehicle = Vehicle.car;
              });
            },
          ),
          _buildUIRadioButton(
            title: Vehicle.fly.value,
            checked: _vehicle == Vehicle.fly,
            onTap: () {
              setState(() {
                _vehicle = Vehicle.fly;
              });
            },
          ),
          _buildUIRadioButton(
            title: Vehicle.boat.value,
            checked: _vehicle == Vehicle.boat,
            onTap: () {
              setState(() {
                _vehicle = Vehicle.boat;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUIRadioButton({
    required String title,
    required bool checked,
    void Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IgnorePointer(
                child: Radio<bool>(
                  groupValue: true,
                  value: checked,
                  onChanged: (bool? newValue) {},
                  // fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => Colors.green,
                  ),
                  focusColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                  hoverColor: MaterialStateColor.resolveWith((states) => Colors.pink),
                  activeColor: MaterialStateColor.resolveWith((states) => Colors.yellow),
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.amber),

                  // splashRadius: 30,
                  // mouseCursor: MouseCursor.defer,
                ),
              ),
              Text(
                title,
                // style: TextStyle(
                //   color: checked ? Colors.blue : Colors.pink,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

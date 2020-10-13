import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _blocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitchTile(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blocked)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://pngriver.com/wp-content/uploads/2018/04/Download-Batman-PNG.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _blocked,
    //   onChanged: (value) {
    //     setState(() {
    //       _blocked = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      },
    );
  }

  Widget _createSwitchTile() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      },
    );
  }
}

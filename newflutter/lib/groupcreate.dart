import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'groupselect.dart';
import 'package:image_picker/image_picker.dart';


class groupCreate extends StatefulWidget {
  const groupCreate({Key? key}) : super(key: key);

  @override
  State<groupCreate> createState() => _groupCreateState();
}

class ColorItem {
  ColorItem(this.name, this.color);

  final String name;
  final Color color;
}

class _groupCreateState extends State<groupCreate> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  var outputText = ' ';
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;

  void getImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if(pickedFile != null){
      setState(() {
        _pickedFile = pickedFile;
      });
     }
  }

  void getImageGallery() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  final List<ColorItem> _colorList = [
    ColorItem("geen", Colors.green),
    ColorItem("yellow", Colors.yellow),
    ColorItem("blue", Colors.blue),
  ];
  late ColorItem _selectedValue;

  final _codeList = ['aaaaaaaaa','bbbbbbbbb','ccccccccc','ddddddddd','eeeeeeeee'];

  int num = Random().nextInt(5);

  void buttonClicked() {
    setState(() {
      outputText = _codeList[num];
    });
    print(outputText);
  }

  @override
  void initState() {
    _selectedValue = _colorList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 4;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('그룹'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.light(
                  primary: Color(0xFF57642B)
              ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  steps: <Step>[
                    Step(
                      title: new Text('그룹 생성'),
                      content: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('그룹 프로필', style: TextStyle(fontSize: 20),),
                              SizedBox(width: 70,),
                              if(_pickedFile == null)
                                Container(constraints: BoxConstraints(
                                  minHeight: _imageSize,
                                  minWidth: _imageSize,
                              ),
                                child: Icon(Icons.square, size: _imageSize),)
                              else
                                Container(
                                  width: _imageSize,
                                  height: _imageSize,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      image: FileImage(File(_pickedFile!.path)),
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () => getImageCamera(),
                                    icon: Icon(Icons.camera_alt, size: 40,),),
                                  IconButton(
                                    onPressed: () => getImageGallery(),
                                    icon: Icon(Icons.image, size: 40,),),
                                ],
                              )
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20), labelText: '그룹 이름', hintText: '그룹 이름 입력'),
                          ),
                          SizedBox(height: 20,),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 285, 0),
                              child: Column(
                                children: [
                                  Text('그룹 색상', style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 200, height: 30,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectedValue,
                                      items: _colorList
                                          .map<DropdownMenuItem<ColorItem>>(
                                              (ColorItem item) =>
                                                  DropdownMenuItem<ColorItem>(
                                                    value: item,
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      //constraints: BoxConstraints(minHeight: 48.0),
                                                      color: item.color,
                                                      child: Text(item.name),
                                                    ),
                                                  ))
                                          .toList(),
                                      onChanged: (ColorItem? value) =>
                                          setState(() => _selectedValue = value!),
                                    ),
                                  )
                                ],
                              )
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('프로필 생성'),
                      content: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('개인 프로필', style: TextStyle(fontSize: 20),),
                              SizedBox(width: 70,),
                              Container(width: 80, height: 80, color: Colors.teal,),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Icon(Icons.camera_alt, size: 40,),
                                  Icon(Icons.image, size: 40,)
                                ],
                              )
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                                labelText: '프로필 닉네임',
                                hintText: '프로필 닉네임 입력'
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 285, 0),
                              child: Column(
                                children: [
                                  Text('개인 색상', style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 200, height: 30,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectedValue,
                                      items: _colorList
                                          .map<DropdownMenuItem<ColorItem>>(
                                              (ColorItem item) =>
                                                  DropdownMenuItem<ColorItem>(
                                                    value: item,
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      //constraints: BoxConstraints(minHeight: 48.0),
                                                      color: item.color,
                                                      child: Text(item.name),
                                                    ),
                                                  ))
                                          .toList(),
                                      onChanged: (ColorItem? value) =>
                                          setState(() => _selectedValue = value!),
                                    ),
                                  )
                                ],
                              )
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('친구 초대'),
                      content: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              SizedBox(height: 70,),
                              ElevatedButton(
                                onPressed: buttonClicked,
                                child: Text('코드 발급 받기',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFA84E),
                                  fixedSize: Size(200, 50),
                                ),
                              ),
                              SizedBox(height: 40,),
                              Text(outputText,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF57642B)),)
                            ],
                          ),
                          SizedBox(height: 81,)
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_currentStep <= 0) {
                              Navigator.pop(context);
                            } else {
                              cancel();
                            }
                          },
                          child: Text('취소', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE0E0E0),
                            fixedSize: Size(150, 25),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_currentStep >= 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const groupSelect()));
                            } else {
                              continued();
                            }
                          },
                          child: Text('다음', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFA84E),
                            fixedSize: Size(70, 25),
                          ),
                        ),
                      ],
                    );
                  },
                )
              )
            ],
          ),
        ));
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

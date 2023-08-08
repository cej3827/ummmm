import 'package:flutter/material.dart';

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

  final List<ColorItem> _colorList = [
    ColorItem("geen", Colors.green),
    ColorItem("yellow", Colors.yellow),
    ColorItem("blue", Colors.blue),
  ];
  late ColorItem _selectedValue;

  @override
  void initState() {
    _selectedValue = _colorList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('그룹'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
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
                            Text('그룹 프로필',style: TextStyle(fontSize: 20),),
                            SizedBox(width: 70,),
                            Container(width: 80,height: 80,color: Colors.teal,),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Icon(Icons.camera_alt,size: 40,),
                                Icon(Icons.image,size: 40,)
                              ],
                            )
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelStyle: TextStyle(color: Colors.black,fontSize: 20),labelText: '그룹 이름', hintText: '그룹 이름 입력'),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 285, 0),
                            child: Column(
                              children: [
                                Text('그룹 색상',style: TextStyle(fontSize: 20),),
                                SizedBox(height: 10,),
                                Container(
                                  width: 200, height: 30,
                                  //color: _selectedValue.color,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: _selectedValue,
                                    items: _colorList.map<DropdownMenuItem<ColorItem>>(
                                            (ColorItem item) => DropdownMenuItem<ColorItem>(
                                          value: item,
                                          child: Container(
                                            alignment: Alignment.center,
                                            //constraints: BoxConstraints(minHeight: 48.0),
                                            color: item.color,
                                            child: Text(item.name),
                                          ),
                                        ))
                                        .toList(),
                                    onChanged: (ColorItem? value)=>
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
                    title: new Text('Address'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Home Address'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Postcode'),
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
                    title: new Text('Mobile Number'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Mobile Number'),
                        ),
                        SizedBox(height: 50,)
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),

                ],
                controlsBuilder: (BuildContext context, ControlsDetails details) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('그룹 생성 취소',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE0E0E0),
                          fixedSize: Size(150, 25),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          continued();
                        },
                        child: Text('다음',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
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
      )
    );
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

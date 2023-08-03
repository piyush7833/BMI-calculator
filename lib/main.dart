import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade600),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ftcontroller=TextEditingController();
  var incontroller=TextEditingController();
  var wcontroller=TextEditingController();
  var result="";
  var bgClr=Colors.deepPurple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        color: bgClr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: wcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Weight in Kg",
                        suffixText: "Kg",
                        suffixIcon: Icon(Icons.monitor_weight),
                        labelText: "Enter your weight in Kg",
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(11.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4,color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(11.0)),
                        )
                    ),
                ),
              ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: ftcontroller,
                            keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter height in feet",
                                    suffixText: "ft",
                                    suffixIcon: Icon(Icons.height),
                                    labelText: "Enter your height in feet",
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(width: 2,color: Colors.blue),
                                      borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 4,color: Colors.green),
                                      borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                    )
                                )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: incontroller,
                            keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter height in inch",
                                    suffixText: "ft",
                                    suffixIcon: Icon(Icons.height),
                                    labelText: "Enter your height in inch",
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(width: 2,color: Colors.blue),
                                      borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 4,color: Colors.green),
                                      borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                    )
                                )
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ElevatedButton(onPressed: (){
                // print("object");

                if(ftcontroller!="" && wcontroller!="" && incontroller!=""){
                  var no1=double.parse(ftcontroller!.text.toString());
                  var no2=double.parse(incontroller!.text.toString());
                  var no3=double.parse(wcontroller!.text.toString());
                  var height=((no1*12+no2)*2.54)/100;
                  var ans=(no3/(height*height));
                  if(ans<18){
                    bgClr=Colors.red.shade100;
                    result="Your BMI is ${ans.toStringAsPrecision(4)}, You are UnderWeight";
                  }
                  else if(ans>25){
                    bgClr=Colors.red.shade300;
                    result="Your BMI is ${ans.toStringAsPrecision(4)}, You are OverWeight";
                  }
                  else{
                    bgClr=Colors.green.shade100;
                    result="Your BMI is ${ans.toStringAsPrecision(4)}, You are Normal";
                  }
                  setState(() {

                  });
                }
                else{
                  result="Please enter all the required details ";
                  setState(() {

                  });
                }
              }, child: Text("Calculate your BMI")),
              Text("$result",style: TextStyle(fontSize: 25),)
            ],
          ),
        ),
      )
      , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

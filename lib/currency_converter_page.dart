import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CurrencyConverterMaterialPage extends StatefulWidget
{
   const CurrencyConverterMaterialPage({super.key});
@override
State <CurrencyConverterMaterialPage>createState() {
 return  _CurrencyConverterMaterialPageState();
}
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{

  late double result=0;
  final TextEditingController textEditingController=TextEditingController();
  List<String>dropdownItems=["America","Pakistan","Bangladesh","Russia","Qatar"];
  String Selected_Value="America";

  // Add this map to your _CurrencyConverterMaterialPageState class
  final Map<String, double> exchangeRates = {
    "America": 81.0,      // USD to INR
    "Pakistan": 0.29,     // PKR to INR (approx)
    "Bangladesh": 0.75,   // BDT to INR (approx)
    "Russia": 0.89,       // RUB to INR (approx)
    "Qatar": 22.41,       // QAR to INR (approx)
  };

  @override
  Widget build(BuildContext context)
{
 if(kDebugMode) {
   print("build function");
 }

  final border=OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style:BorderStyle.solid,
      )
  );
  return  Scaffold(backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text("CURRENCY CONVERTER",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("INR ${result.toString()}",
              style:const TextStyle(fontSize:45 ,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 255, 255, 255)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController
                ,
                style:const TextStyle(
                  color: Colors.black,

                ),
                decoration: InputDecoration(


                    hintText: "Please enter the amount in INR",hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: Padding(padding: EdgeInsets.only(left:30.0),
                      child: const Icon(Icons.monetization_on),
                    ),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder:border,
                    enabledBorder: border


                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(onPressed: (){
                setState(() {

                  final input=double.parse(textEditingController.text);
                  if(input!=null)
                    {
                      result=input*(exchangeRates[Selected_Value]??1);
                    }
                  else
                    {
                      result=0;
                    }
                });
              },style:ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor:Colors.white,minimumSize:const Size(double.infinity, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                  child:Text("Convert")),
            ),
            DropdownButton<String>(
              value: Selected_Value, // The currently selected value in the dropdown
              isExpanded: true,
            // Ensures the dropdown takes up the full width of its parent container
              onChanged: (String? newValue) {
                setState(() {
                  Selected_Value = newValue!; // Updates the selected value when a user selects an option
                });
              },
              items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value, // The value of the dropdown item when selected
                  child: Text(value), // The text displayed for this item in the dropdown list
                );
              }).toList(),
            )
          ],
        ),
      )
  );
}
}


class CurrencyConverterMaterialPagee extends StatelessWidget
{

  const CurrencyConverterMaterialPagee({super.key});
  @override
  Widget build(BuildContext context)
  {
  return Scaffold();
      }

}
// internal package
import 'dart:math';
import '/Model/shift_model.dart';
import '/FireBase/shift_repository.dart';
import '/FireBase/auth_user.dart';
import '/tools.dart';
import 'firebase_options.dart';
// external package
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//String shiftsOfDay ='123420';
String shiftsOfDay='000000';
//String shifts_Day='000000 ';
bool appShow =false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseAuth('marom7@gmail.com','shira2014');

  runApp(const MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _dateController = TextEditingController();
  List<ShiftModel>? allShifts;
  late Future<List<ShiftModel>?> shifts;
  @override
  void initState() {
    super.initState();
    setState(()  {
      shifts = getAllShifts();
      shifts.whenComplete(() => initShifts());
    });
  }

  @override
  Widget build(BuildContext context) {

    if (!appShow) {
      displayDate(DateTime.now());
      appShow = true;
    }

    return Scaffold(
        body: Center(
            child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(40),
                      child: inputDate()
                  ),
                  Expanded(
                      child: gridEmployees(shiftsOfDay.length)
                  )
                ]
            )

        )
    );
  }

  Widget inputDate() {
    return
      Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
        child: TextField(
          controller: _dateController,
          decoration: const InputDecoration(
            labelText: 'DATE',
            filled: true,
            prefixIcon: Icon(Icons.calendar_today),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
            ),
          ),
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
        ),
      );
  }

  gridEmployees(int count) {

    return GridView.count(

        primary: false,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        crossAxisCount: 2,
        children: List<Widget>.generate(
          count,
              (int index)   {

            return GridTile(
              child: Card(
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                      .withOpacity(1.0),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child:
                        Text('${ShiftModel.empNameByCode(index)}'
                                  '\n\n${ShiftModel.shiftByCode(int.parse(shiftsOfDay[index]))}',

                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                    ),
                    onTap: () {
                      showToast(message: shiftsOfDay);
                      //setState(()  async {
                        //Future<String> shift = getShiftByDate("20-01-2024", index);
                        //int shiftCode = int.parse(await shift) ;
                        //showToast(message:  ShiftModel.shiftByCode(await getShiftByDate("20-01-2024", index)));
                      //});
                    },
                  )
              ),
            );
          },
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickd = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      //locale: AboutDialog()
    );

    if (pickd != null) {
      setState(()   {
        displayDate(pickd);
       // shifts.whenComplete(() => initShifts(pickd));
        //String date = pickd.toString().split(' ')[0];
        //int day = pickd.weekday;
        //_dateController.text = getFormatedDate(date)+ '   ' + getWeekDayHebrew(day);
        //shifts_Day =  getShiftByDate(getFormatedDate(date));
      });
    }
  }

  displayDate(DateTime dateTime){
    String date = dateTime.toString().split(' ')[0];
    int day = dateTime.weekday;
    _dateController.text = getFormatedDate(date)+ '   ' + getWeekDayHebrew(day);
    try {
      shiftsOfDay = allShifts!
          .where((element) => element.date == getFormatedDate(date)).first
          .shifts;
    }
    catch(e){
      //if(e.toString().contains('no element'))
        shiftsOfDay ='000000';
    }

  }

  Future<void> initShifts() async {
    allShifts = await shifts;

  }
}

getFormatedDate(date) {
  //var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  // var inputDate = inputFormat.parse(_date);
  return  DateFormat('dd-MM-yyyy').format(DateTime.parse(date) );
  //return outputFormat.format(outputFormat);
}
String getWeekDayHebrew(int day) {
  switch (day) {
    case 0:
      return 'ראשון';
    case 1:
      return 'שני';
    case 2:
      return 'שלישי';
    case 3:
      return 'רביעי';
    case 4:
      return 'חמישי';
    case 5:
      return 'שישי';
    case 6:
      return 'שבת';
    default:
      return '-';
  }
}

// ######### FireBase #########
void firebaseAuth(String email, String password) async {
  User? user= await FirebaseAuthService().signInWithEmailAndPassword(email, password);
  String? uid= user?.uid;  //lM7LdyJK3kRMowApXIyVoQobRf92 -marom7@gmail.com- 'shira2014'
}
Future<String> getShiftByDate(String date) async {
  String shifts='000000';
  try{
    ShiftModel shiftsDay = await ShiftRepository().getShiftsDetails(date);// "20-01-2024"
    String shifts = shiftsDay.shifts;//.shifts[empCode];
  }
  catch(e){
    shifts= '000000';
  }
  return shifts;
}
Future<List<ShiftModel>?> getAllShifts() async {
  List<ShiftModel>? shifts;
  try{
    shifts = await ShiftRepository().allShifts();// "20-01-2024"
  }
  catch(e){
    shifts= null;
  }
  return shifts;
}

/*
FutureBuilder<int>(
  future: ,
  initalData: 0,
  builder: (context, snapshot) {
  return UpcomingCard(
    title: 'Total Service Calls',
    value: snapshot.data.toString(),
    color: Colors.blue)
  }
)
*/




import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../myData/IngredientsData.dart';
import '../Models/Ingredient.dart';
import '../Widgets/SearchRecipeButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
 // List<String> recognizedIngredients = [];

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    List<String> allIngredients = getAllIngredientsName();
    print(result.recognizedWords);
    List<String> recognizedWordsList = result.recognizedWords.split(' ');
    String lastIngredientName = recognizedWordsList.last;
    //check if the pronounced ingredient exists in our data
    if (allIngredients.contains(lastIngredientName)) {
      print("cond1");
      //check if the ingredient is not selected already
      if(!IngredientView.selectedIngredientsNames.contains(lastIngredientName)) {
        print("cond2");
        //fetch the ingredient from data and construct it as a view to add it to the selectedIngredients list
       Ingredient newSelected = ingredientsData.firstWhere((element) => element.ingrName.toLowerCase()==lastIngredientName);
       print(newSelected.ingrName);
       setState(() {
        IngredientView.addToSelectedIngredients(newSelected);
      });
        print("recognized ingredients names array:");
        print(IngredientView.selectedIngredientsNames);
        print(IngredientView.selectedIngredients);
        setState(() {

        });
      }
      }else
      print('not an ingredient');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Use your voice'),//, Dictate many ingredients at once
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: const Text(
                'Recognized ingredients:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(_speechToText.isListening
                ? ''
                : _speechEnabled
                    ? 'Tap the microphone to start listening...'
                    : 'Speech not available'),
            Container(
                padding: EdgeInsets.all(16),
                child: Wrap(
                  children: [
                    for(var j in IngredientView.selectedIngredientsNames)
                      Chip(label: Text(j),
                      onDeleted: () {
                        setState(() {
                          IngredientView.removeFromSelectedIngredientsByName(j);
                        });
                      },
                      )
                  ],
                ),
                ),
              SearchRecipeButton()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_off),
      ),
    );
  }
}

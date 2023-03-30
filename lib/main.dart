import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_webinar_example/amplifyconfiguration.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  try{
   await Amplify.configure(amplifyconfig);
  }
  catch(e) {
    print('An Error occured while initializing Amplify : $e');
  }
}
Future<String> fetchURL() async {
  final response = await http
      .get(Uri.parse('https://tt5hjzexlcszhahm7cymb7cxhe0ujfmv.lambda-url.us-east-1.on.aws/'));
    if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    print(response.statusCode);
    throw Exception('Failed to get URL');
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Cat App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var imgurl = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';
  Future<String>? _futureImgurl;

  Future<String> _setfutureImgurl() async {
  final response = await http
      .get(Uri.parse('https://tt5hjzexlcszhahm7cymb7cxhe0ujfmv.lambda-url.us-east-1.on.aws/'));
    if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    print(response.statusCode);
    throw Exception('Failed to get URL');
  }
}

  @override
  void initState() {
    _futureImgurl = _setfutureImgurl();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //               child: GestureDetector(
    //                      onTap: () {
    //                               print("visitors");
    //                               fetchURL().then((String result)
    //                               {
    //                               setState(()   
    //                               {
    //                               imgurl = result;
    //                               });
    //                               });
    //                      },
    //                      child: Image.network(imgurl)
    //               ),
    //   ),
    // );
  return FutureBuilder(
    future: _futureImgurl,
    builder: (context, data) {
      if (data.hasData) {
      //  return Image.network(data.data.toString());
        return Center(
                  child: GestureDetector(
                         onTap: () {
                                  print("visitors");
                                  _futureImgurl = _setfutureImgurl();
                                  setState(()   
                                  {
                                  imgurl = data.data.toString();
                                  });

                         },
                         child: Image.network(imgurl)
                  ),
      );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}


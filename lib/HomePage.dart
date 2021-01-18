import 'package:flutter/material.dart';
 
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

    String url = "https://beaconradi.airtime.pro";
    class HomePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
         debugShowCheckedModeBanner: false,
         //color:Color.fromRGBO(3, 9, 23, 1), 
         theme: ThemeData.dark(),
         routes: {
           "/": (_)=>Home(),
           "/webview":(_)=> new WebviewScaffold(
             url:url,
             appBar:AppBar(
               title: Text('RADIO'),
             ),
             withJavascript: true,
             withLocalStorage:true,
             withZoom:true,
             
           )
         },
       );
      }
    }
    class Home extends StatefulWidget {
      @override
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {
      final webView = FlutterWebviewPlugin();

      void initState(){
        super.initState();
        webView.close();
        
      }
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          
          home: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.jpg"),
                 fit: BoxFit.cover)
                 ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: MaterialButton(
                  color: Colors.redAccent,
                  child: Text('Click here to Listen!!', 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed("/webview");
                  },
                ),
              ),
            ],
          ),
        )
        
          ),
        );
      }
    }
            
            
     
     

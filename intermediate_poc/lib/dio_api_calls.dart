import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioAPiExamples extends StatefulWidget {
  const DioAPiExamples({super.key});

  @override
  State<DioAPiExamples> createState() => _DioAPiExamplesState();
}

class _DioAPiExamplesState extends State<DioAPiExamples> {
  List<dynamic> data = [];
  List<dynamic> helldata = [];

  var dio = Dio();
  void getData() async {
    var dio = Dio();
    // dio.options.headers = {          To passs the headers into request
    //   'Authorization' : 'Bearer token here '
    // };
    // FormData formData = FormData.fromMap({
    //   'name': 'John',
    //   'file': await MultipartFile.fromFile('path/to/file.jpg'),
    // });

    // await dio.post('https://example.com/upload', data: formData);
try {      //Handling the errors
  // Extract only the titles
  var dio = Dio();
  var response = await dio.get('https://jsonplaceholder.typicode.com/posts');
  List<dynamic> data = response.data;
  List<String> fetchedTitles =
  data.map((item) => item['title'] as String).toList();

  setState(() {
    helldata = fetchedTitles;
  });
}
catch(e){
  print('error message $e');
}

  }

  void addData()async{
    var res = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        'title': 'New Post',
        'body': 'Post content',
        'userId': 1
      },
    );

  }

  @override
  void initState() {
    super.initState();
    // getData();    // TO get data please uncomment this line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API calls using DIO package'),
      ),
      body: Column(
        children: [
          Text('Get Api Data$helldata'),
          ElevatedButton(onPressed: (){
            addData();  // always remember don't use async inside set state
            setState(() {
            });
            
          }, child: Text('Add User')),
          Card(
            child: ListTile(
              title: Text('Hello Sagar'),
            ),
          )
        ],
      ),

    );
  }
}

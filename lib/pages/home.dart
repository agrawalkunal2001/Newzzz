import 'package:flutter/material.dart';
import 'package:newzzz/backend/functions.dart';
import 'package:newzzz/components/app_bar.dart';
import 'package:newzzz/components/news_box.dart';
import 'package:newzzz/components/search_bar.dart';
import 'package:newzzz/utils/colors.dart';
import 'package:newzzz/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],
                            imageurl:
                                snapshot.data![index]['urlToImage'] != null
                                    ? snapshot.data![index]['urlToImage']
                                    : Constants.imageurl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

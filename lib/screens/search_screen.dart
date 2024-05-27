import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/services/api_service.dart';
import 'package:google_search_clone/widget/search_footer.dart';
import 'package:google_search_clone/widget/search_header.dart';
import 'package:google_search_clone/widget/search_result_component.dart';
import 'package:google_search_clone/widget/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    super.key,
    required this.searchQuery,
    required this.start,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchHeader(),
              Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SearchTabs(),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              FutureBuilder(
                future:
                    ApiService().fetchData(query: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150,
                                top: 12,
                              ),
                              child: Text(
                                'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                                style: const TextStyle(
                                  color: Color(0xFF70757a),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: size.width <= 768
                                  ? size.width * 0.9
                                  : size.width * 0.6,
                              child: SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?['items'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width <= 768 ? 10 : 150,
                                        top: 10,
                                      ),
                                      child: SearchResultComponent(
                                        link: snapshot.data?['items'][index]
                                            ['formattedUrl'],
                                        text: snapshot.data?['items'][index]
                                            ['title'],
                                        linkToGo: snapshot.data?['items'][index]
                                            ['link'],
                                        description: snapshot.data?['items']
                                            [index]['snippet'],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (start != "0") {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                              searchQuery: searchQuery,
                                              start: (int.parse(start) - 10)
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      '< Prev',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) + 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Next >',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SearchFooter()
            ],
          ),
        ),
      ),
    );
  }
}

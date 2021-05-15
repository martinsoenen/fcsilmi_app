import 'dart:convert';

import 'package:fcsilmi_app/resources/MatchCard.dart';
import 'package:fcsilmi_app/resources/toast.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:http/http.dart' as http;

import 'package:fcsilmi_app/resources/const.dart';
import 'package:fcsilmi_app/models/match.dart';

class MatchResultsPage extends StatefulWidget {
  @override
  _MatchResultsPageState createState() => _MatchResultsPageState();
}

class _MatchResultsPageState extends State<MatchResultsPage> {
  static const _pageSize = 10;
  final PagingController _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, _pageSize);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey, int pageSize) async {
    try {
      var newItems = await getSomeMatchs((pageKey/_pageSize).round());
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO later : pull to refresh

    return Scaffold(
      appBar: AppBar(
        title: Text("Derniers matchs"),
        centerTitle: true,
      ),
      body: Center(
        child: PagedListView.separated(
              pagingController: _pagingController,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => MatchCard(silmiMatch: item)
              )
          )
      ),
    );
  }
}

getSomeMatchs(int pageNumber) async {
  http.Response response = await http.get(apiUrl + "/matchs?page=$pageNumber");

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);

    List<SilmiMatch> matchs = [];
    body.forEach((value) {
      matchs.add(SilmiMatch.fromJson(value));
    });

    return matchs;
  } else {
    showErrorToast("Erreur pour joindre l'API : ${response.statusCode} : ${response.body}");
    return null;
  }
}
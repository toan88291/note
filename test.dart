
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loxo/model/topic.dart';
import 'package:loxo/providers/topic_model.dart';
import 'package:loxo/screens/vocabulary/vocabulary_listening_logic.dart';
import 'package:loxo/screens/vocabulary/widgets/topic_item.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class VocabularyScreen extends StatefulWidget {
  final Topic topic;

  VocabularyScreen({@required this.topic});

  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  static const TAG = "VocabListeningScreen";

  VocabListeningLogic logic;

  Topic get topic => widget.topic;

  ScrollController _controller = ScrollController();

  double height = 68;

  int indexPosition = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logic = new VocabListeningLogic(context, topic);
    Future.delayed(Duration(milliseconds: 500), (){
      developer.log("didChangeDependencies scrollController", name: TAG);
      _controller.animateTo(height * indexPosition * 2,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
    developer.log("didChangeDependencies", name: TAG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: Column(
        children: <Widget>[
          Consumer(builder: (_, TopicModel _model, ___) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Text(
                          'Unlocked',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new CircularPercentIndicator(
                          radius: 48.0,
                          lineWidth: 4.0,
                          percent: 0.5,
                          center: new Text("50%"),
                          progressColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }),
          Expanded(child: Consumer(builder: (_, TopicModel _model, ___) {
            if (_model.practices.isEmpty) {
              return Container(child: Text("loading"));
            }
            return ListView.separated(
              controller: _controller,
              itemCount: _model.practices.length,
              itemBuilder: (_, index) {
                return TopicItem(
                  index,
                  _model.practices.length,
                  topic: _model.practices[index],
                  goToStudy: logic?.gotoStudy,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
            );
          }))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

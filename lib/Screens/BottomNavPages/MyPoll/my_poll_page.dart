import 'package:flutter/material.dart';
import 'package:pollingapp/Screens/BottomNavPages/MyPoll/add_new_polls.dart';
import 'package:pollingapp/Styles/Colors.dart';
import 'package:pollingapp/Utils/router.dart';

class MyPoll extends StatefulWidget {
  const MyPoll({Key? key}) : super(key: key);

  @override
  State<MyPoll> createState() => _MyPollState();
}

class _MyPollState extends State<MyPoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Polls'),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ...List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(),
                                title: Text('Hakim ALi'),
                                trailing: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete)),
                              ),
                              Text('My Questions'),
                              SizedBox(
                                height: 8,
                              ),
                              ...List.generate(2, (index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Stack(
                                            children: [
                                              LinearProgressIndicator(
                                                minHeight: 30,
                                                value: 50/100,
                                                backgroundColor: Colors.white,
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                height: 30,
                                                child: Text('Density'),
                                              )
                                            ],
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('5%')
                                    ],
                                  ),
                                );
                              }),
                              Text('Total votes : 8'),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          nextPage(context, AddNewPools());
        },
        child: Icon(Icons.add),


      ),
    );

  }

}

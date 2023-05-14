import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pollingapp/Providers/db_provider.dart';
import 'package:pollingapp/Utils/message.dart';
import 'package:provider/provider.dart';

class AddNewPools extends StatefulWidget {
  const AddNewPools({Key? key}) : super(key: key);

  @override
  State<AddNewPools> createState() => _AddNewPoolsState();
}

class _AddNewPoolsState extends State<AddNewPools> {
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController duration = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Polls'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    formWidget(question, label: 'Question'),
                    formWidget(option1, label: 'Option1'),
                    formWidget(option2, label: 'Option2'),
                    formWidget(duration, label: 'Duration', onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.utc(2027))
                          .then((value) {
                        if (value == null) {
                          duration.clear();
                        } else {
                          duration.text = value.toString();
                        }
                      });
                    }),
                    Consumer<DbProvider>(
                      builder: (context, db,child) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                           if(db.message !=''){
                             if(db.message.contains('Poll Created')){

                               success(context, message: db.message);
                               db.clear();
                             } else {
                               error(context, message: db.message);
                               db.clear();

                             }

                           }
                        });
                        return GestureDetector(
                          onTap:db.status==true? null: () {
                            if (_formKey.currentState!.validate()) {
                              List<Map> options = [
                                {
                                  'answer': option1.text.trim(),
                                  'percent': 0,
                                },
                                {
                                  'answer': option2.text.trim(),
                                  'percent': 0,
                                }
                              ];
                              print(options);
                              db.addPoll(
                                  question: question.text.trim(),
                                  duration: duration.text.trim(),
                                  options: options);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                                color: db.status==true ? Colors.grey: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(db.status == true ? 'Please wait....':'Post Poll'),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget formWidget(TextEditingController controller,
      {String? label, VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onTap: onTap,
        readOnly: onTap == null ? false : true,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Input is required';
          }
          return null;
        },
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(),
            labelText: label!,
            border: OutlineInputBorder()),
      ),
    );
  }
}

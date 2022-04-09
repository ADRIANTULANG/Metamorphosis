import 'dart:convert';

import 'package:get/get.dart';
import 'package:metamorphosis/Assestment/api/assestment_api.dart';
import 'package:metamorphosis/Assestment/model/assestment_model.dart';
import 'package:metamorphosis/Diagnosis/view/diagnosis_view.dart';

class AssestmentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List diagnosis_list = [];
  RxList<DiagnosisModel> diagnosisList = <DiagnosisModel>[].obs;

  submit_assestment() async {
    await delete_diagnosis_and_plans();
    diagnosis_list.clear();
    await check_if_eating_disorder();
    await check_if_Inability_to_Seek_Help();
    await check_if_Low_Physical_Activities();
    await check_if_Sleeping_DisOrder();
    await check_if_Inability_to_take_timeoff();
    await check_if_Inability_to_make_time_for_oneself();
    await check_if_unhealthy_work_life_boundaries();
    await check_if_lack_of_emotional_fulfillment();
    await check_if_need_to_unwind();
    await check_if_in_need_of_faith();

    diagnosis_list.sort((a, b) => a["score"].compareTo(b["score"]));

    diagnosisList
        .assignAll(await diagnosisModelFromJson(jsonEncode(diagnosis_list)));

    await get_over_all_health_physical_care_Assestment();
    await get_over_all_health_psychological_Care_assestment();
    await get_over_all_health_spiritual_Care_assestment();
    await save_diagnosis();
    await get_week();
    await delete_daily_progress();
    // await insert_daily_progress();

    Get.to(() => DiagnosisView(), arguments: {"assestment_type": "none"});
  }

  check_if_eating_disorder() {
    DateTime datenow = DateTime.now();
    var totalscore = (physicalCareAssestment_questions[0]['rating'] +
            physicalCareAssestment_questions[1]['rating']) /
        2;
    if (totalscore < 3) {
      Map eatingdisorder = {
        "score": totalscore,
        "diagnosis": "Eating Disorder",
        "assestment_type": "Physical Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Eating Disorder",
            "plan": "Scheduled Eating Time",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Eating Disorder",
            "plan": "Eat healthy foods like Vegetables, Egg, Meat & more.",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Eating Disorder",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(eatingdisorder);
    } else {}
  }

  check_if_Inability_to_Seek_Help() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < physicalCareAssestment_questions.length; i++) {
      if (physicalCareAssestment_questions[i]["diagnosis"] ==
          "Inability to Seek Help") {
        tempList.add(physicalCareAssestment_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map inability_to_Seek_Help = {
        "score": totalscore,
        "diagnosis": "Inability to Seek Help",
        "assestment_type": "Physical Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Inability to Seek Help",
            "plan": "Schedule med/vitamin intake",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to Seek Help",
            "plan": "Practice communicating your needs",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to Seek Help",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to Seek Help",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(inability_to_Seek_Help);
    } else {}
  }

  check_if_Low_Physical_Activities() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < physicalCareAssestment_questions.length; i++) {
      if (physicalCareAssestment_questions[i]["diagnosis"] ==
          "Low Physical Activity") {
        tempList.add(physicalCareAssestment_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map low_physical_activities = {
        "score": totalscore,
        "diagnosis": "Low Physical Activity",
        "assestment_type": "Physical Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Low Physical Activity",
            "plan": "Schedule Physical Activity Time",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Low Physical Activity",
            "plan": "Physical Activities",
            "isDone": false,
            "isScheduled": false,
            "isTimer": true,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Low Physical Activity",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
        ]
      };

      diagnosis_list.add(low_physical_activities);
    } else {}
  }

  check_if_Sleeping_DisOrder() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < physicalCareAssestment_questions.length; i++) {
      if (physicalCareAssestment_questions[i]["diagnosis"] ==
          "Sleeping Disorder") {
        tempList.add(physicalCareAssestment_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map sleep_disorder = {
        "score": totalscore,
        "diagnosis": "Sleeping Disorder",
        "assestment_type": "Physical Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Sleeping Disorder",
            "plan": "Schedule Sleep Time",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Sleeping Disorder",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Sleeping Disorder",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
        ]
      };

      diagnosis_list.add(sleep_disorder);
    } else {}
  }

  check_if_Inability_to_take_timeoff() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < physicalCareAssestment_questions.length; i++) {
      if (physicalCareAssestment_questions[i]["diagnosis"] ==
          "Inability to take time off") {
        tempList.add(physicalCareAssestment_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map inability_to_take_timeoff = {
        "score": totalscore,
        "diagnosis": "Inability to take time off",
        "assestment_type": "Physical Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Inability to take time off",
            "plan": "Schedule Time Off",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to take time off",
            "plan": "Break Timer",
            "isDone": false,
            "isScheduled": false,
            "isTimer": true,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to take time off",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
        ]
      };

      diagnosis_list.add(inability_to_take_timeoff);
    } else {}
  }

  List physicalCareAssestment_questions = [
    {
      "question": "Eat regularly (e.g. breakfast, lunch, and dinner)",
      "rating": 1,
      "diagnosis": "Eating Disorder"
    },
    {"question": "Eat healthily", "rating": 0, "diagnosis": "Eating Disorder"},
    {
      "question": "Get medical care when needed",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Get massages",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Ask for help when I need it",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Get regular medical care for prevention",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Share a fear, hope, or secret with someone I trust",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Negotiate for my needs (benefits, pay raise)",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question": "Have a peer support group",
      "rating": 1,
      "diagnosis": "Inability to Seek Help"
    },
    {
      "question":
          "Dance, swim, walk, run, play sports, sing, or do some other fun physical activity",
      "rating": 1,
      "diagnosis": "Low Physical Activity"
    },
    {
      "question": "Take time to be sexual - with myself, with a partner",
      "rating": 1,
      "diagnosis": "Low Physical Activity"
    },
    {"question": "Exercise", "rating": 0, "diagnosis": "Low Physical Activity"},
    {
      "question": "Get enough sleep",
      "rating": 1,
      "diagnosis": "Sleeping Disorder"
    },
    {
      "question": "Take time off when sick",
      "rating": 1,
      "diagnosis": "Inability to take time off"
    },
    {
      "question": "Wear clothes I like",
      "rating": 1,
      "diagnosis": "Inability to take time off"
    },
    {
      "question": "Take vacations",
      "rating": 1,
      "diagnosis": "Inability to take time off"
    },
    {
      "question": "Take a break during the workday (e.g., lunch)",
      "rating": 1,
      "diagnosis": "Inability to take time off"
    },
    {
      "question":
          "Balance my caseload so that no one day or part of a day is “too much”",
      "rating": 1,
      "diagnosis": "Inability to take time off"
    },
  ];

  check_if_Inability_to_make_time_for_oneself() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < psychologicalSelfCare_questions.length; i++) {
      if (psychologicalSelfCare_questions[i]["diagnosis"] ==
          "Inability to make time for oneself") {
        tempList.add(psychologicalSelfCare_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map inability_to_make_time_of_oneself = {
        "score": totalscore,
        "diagnosis": "Inability to make time for oneself",
        "assestment_type": "Psychological Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Inability to make time for oneself",
            "plan": "Schedule Time Off",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to make time for oneself",
            "plan": "Break Timer",
            "isDone": false,
            "isScheduled": false,
            "isTimer": true,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to make time for oneself",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Inability to make time for oneself",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
        ]
      };

      diagnosis_list.add(inability_to_make_time_of_oneself);
    } else {}
  }

  check_if_unhealthy_work_life_boundaries() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < psychologicalSelfCare_questions.length; i++) {
      if (psychologicalSelfCare_questions[i]["diagnosis"] ==
          "Unhealthy Work-Life Boundaries") {
        tempList.add(psychologicalSelfCare_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map unhealthy_Work_life_boundaries = {
        "score": totalscore,
        "diagnosis": "Unhealthy Work-Life Boundaries",
        "assestment_type": "Psychological Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Unhealthy Work-Life Boundaries",
            "plan": "Schedule Do Not Disturb Mode",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Unhealthy Work-Life Boundaries",
            "plan": "Watch Movie/Literature",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Unhealthy Work-Life Boundaries",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(unhealthy_Work_life_boundaries);
    } else {}
  }

  check_if_lack_of_emotional_fulfillment() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < psychologicalSelfCare_questions.length; i++) {
      if (psychologicalSelfCare_questions[i]["diagnosis"] ==
          "Lack of Emotional Fulfillment") {
        tempList.add(psychologicalSelfCare_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map lack_of_emotional_fulfillment = {
        "score": totalscore,
        "diagnosis": "Lack of Emotional Fulfillment",
        "assestment_type": "Psychological Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Lack of Emotional Fulfillment",
            "plan": "Schedule Self-Time Mode",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Lack of Emotional Fulfillment",
            "plan": "Self-Care Mode",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Lack of Emotional Fulfillment",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Lack of Emotional Fulfillment",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(lack_of_emotional_fulfillment);
    } else {}
  }

  List psychologicalSelfCare_questions = [
    {
      "question": "Take day trips or mini-vacations",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question": "Make time away from telephones, email, and the Internet",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question": "Make time for self-reflection",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question":
          "Notice my inner experience - listen to my thoughts, beliefs, attitudes, feelings",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question": "Have my own personal psychotherapy",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question": "Write in a journal",
      "rating": 1,
      "diagnosis": "Inability to make time for oneself"
    },
    {
      "question": "Read literature that is unrelated to work",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Do something at which I am not expert or in charge",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": " Attend to minimizing stress in my life",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question":
          "Engage my intelligence in a new area, e.g., go to an art show, sports event, theatre",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Be curious",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Say no to extra responsibilities sometimes",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Allow others to do things for me",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Strive for balance within my work-life and work day",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question":
          " Strive for balance among work, family, relationships, play, and rest",
      "rating": 1,
      "diagnosis": "Unhealthy Work-Life Boundaries"
    },
    {
      "question": "Spend time with others whose company I enjoy",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Stay in contact with important people in my life",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Give myself affirmations, praise myself",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": " Love myself",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": " Re-read favorite books, re-view favorite movies",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question":
          "Identify comforting activities, objects, people, places and seek them out",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Allow myself to cry",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": " Find things that make me laugh",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question":
          "Express my outrage in social action, letters, donations, marches, protests",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Make time to see friends",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Call, check on, or see my relatives",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Stay in contact with faraway friends",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Identify projects or tasks that are exciting and rewarding",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Arrange work space so it is comfortable and comforting",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
    {
      "question": "Get regular supervision or consultation",
      "rating": 1,
      "diagnosis": "Lack of Emotional Fulfillment"
    },
  ];

  check_if_need_to_unwind() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < spiritualSelfCare_questions.length; i++) {
      if (spiritualSelfCare_questions[i]["diagnosis"] == "Need to unwind") {
        tempList.add(spiritualSelfCare_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map need_to_unwind = {
        "score": totalscore,
        "diagnosis": "Need to unwind",
        "assestment_type": "Spiritual Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "Need to unwind",
            "plan": "Schedule Nature Time Mode",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Need to unwind",
            "plan": "Write Literature/Podcast",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Need to unwind",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "Need to unwind",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(need_to_unwind);
    } else {}
  }

  check_if_in_need_of_faith() {
    DateTime datenow = DateTime.now();
    List tempList = [];

    for (var i = 0; i < spiritualSelfCare_questions.length; i++) {
      if (spiritualSelfCare_questions[i]["diagnosis"] == "In-need of Faith") {
        tempList.add(spiritualSelfCare_questions[i]);
      } else {}
    }
    double totalscore = 0;
    for (var i = 0; i < tempList.length; i++) {
      totalscore = totalscore + double.parse(tempList[i]["rating"].toString());
    }
    totalscore = totalscore / tempList.length;
    if (totalscore < 3) {
      Map in_need_of_faith = {
        "score": totalscore,
        "diagnosis": "In-need of Faith",
        "assestment_type": "Spiritual Assestment",
        "Personalized_Plan": [
          {
            "diagnosis": "In-need of Faith",
            "plan": "Schedule Prayer/Meditation",
            "isScheduled": true,
            "isDone": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "In-need of Faith",
            "plan": "Prayer/Meditation Mode",
            "isDone": false,
            "isScheduled": false,
            "isTimer": true,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "In-need of Faith",
            "plan": "Venting Out eJournal",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          },
          {
            "diagnosis": "In-need of Faith",
            "plan": "De-Stress (Breathing Exercises)",
            "isDone": false,
            "isScheduled": false,
            "isTimer": false,
            "startDate": datenow.toString(),
            "endDate": datenow.add(Duration(hours: 1)).toString(),
          }
        ]
      };

      diagnosis_list.add(in_need_of_faith);
    } else {}
  }

  List spiritualSelfCare_questions = [
    {
      "question": "Make time for reflection",
      "rating": 1,
      "diagnosis": "Need to unwind"
    },
    {
      "question": "Spend time in nature",
      "rating": 1,
      "diagnosis": "Need to unwind"
    },
    {
      "question": "Be aware of non-material aspects of life",
      "rating": 1,
      "diagnosis": "Need to unwind"
    },
    {
      "question": " Have experiences of awe",
      "rating": 1,
      "diagnosis": "Need to unwind"
    },
    {
      "question":
          "Read inspirational literature or listen to inspirational talks, music",
      "rating": 1,
      "diagnosis": "Need to unwind"
    },
    {
      "question": "Find a spiritual connection or community",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {
      "question": "Be open to inspiration",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {
      "question": "Cherish my optimism and hope",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {
      "question": "Try at times not to be in charge or the expert",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {
      "question": "Be open to not knowing",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {
      "question":
          " Identify what is meaningful to me and notice its place in my life",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
    {"question": "Meditate", "rating": 0, "diagnosis": "In-need of Faith"},
    {"question": "Pray", "rating": 0, "diagnosis": "In-need of Faith"},
    {"question": "Sing", "rating": 0, "diagnosis": "In-need of Faith"},
    {
      "question": "Contribute to causes in which I believe",
      "rating": 1,
      "diagnosis": "In-need of Faith"
    },
  ];

  save_diagnosis() async {
    for (var i = 0; i < diagnosisList.length; i++) {
      var last_inserted_id = await AssestmentApi.insert_diagnosis(
        diagnosis: diagnosisList[i].diagnosis,
        score: diagnosisList[i].score.toString(),
        assestment_type: diagnosisList[i].assestmentType.toString(),
        isActiveDiagnosis: false.toString(),
      );
      print(last_inserted_id);
      for (var x = 0; x < diagnosisList[i].personalizedPlan.length; x++) {
        await AssestmentApi.insert_personalized_plan(
            diagnosis_ID: last_inserted_id.toString(),
            diagnosis: diagnosisList[i].personalizedPlan[x].diagnosis,
            plan: diagnosisList[i].personalizedPlan[x].plan,
            isDone:
                diagnosisList[i].personalizedPlan[x].isDone.value.toString(),
            isScheduled:
                diagnosisList[i].personalizedPlan[x].isScheduled.toString(),
            isTimer: diagnosisList[i].personalizedPlan[x].isTimer.toString(),
            startDate:
                diagnosisList[i].personalizedPlan[x].startDate.toString(),
            isActive: false.toString(),
            endDate: diagnosisList[i].personalizedPlan[x].endDate.toString());
      }
    }
  }

  get_week() async {
    var result = await AssestmentApi.get_week();
    if (result == "Error") {
    } else {
      if (result == null) {
        save_week(week: 1);
      } else {
        var current_week = int.parse(result.toString());
        var updated_week = current_week + 1;
        save_week(week: updated_week);
      }
    }
  }

  save_week({required int week}) async {
    await AssestmentApi.insert_Weeky_progress(week: week.toString());
  }

  delete_diagnosis_and_plans() async {
    await AssestmentApi.delete_diagnosis_and_plan();
  }

  get_over_all_health_physical_care_Assestment() {
    double totalscore = 0.0;

    for (var i = 0; i < physicalCareAssestment_questions.length; i++) {
      totalscore = totalscore +
          double.parse(
              physicalCareAssestment_questions[i]["rating"].toString());
    }
    var finalscore = totalscore / physicalCareAssestment_questions.length;

    var percent_value = (finalscore / 5) * 100;
    print("===================================================");
    print("percent value over all health physical care: $percent_value");
    print("finalscore of physical care: $finalscore");
    insert_overall_health(
        selfcaretype: "Physical Assestment",
        over_all_health: percent_value.toString());
  }

  get_over_all_health_psychological_Care_assestment() {
    double totalscore = 0.0;

    for (var i = 0; i < psychologicalSelfCare_questions.length; i++) {
      totalscore = totalscore +
          double.parse(psychologicalSelfCare_questions[i]["rating"].toString());
    }
    var finalscore = totalscore / psychologicalSelfCare_questions.length;

    var percent_value = (finalscore / 5) * 100;
    print("===================================================");
    print("percent value over all health psychological care: $percent_value %");
    print("finalscore of psychological care: $finalscore");
    insert_overall_health(
        selfcaretype: "Psychological Assestment",
        over_all_health: percent_value.toString());
  }

  get_over_all_health_spiritual_Care_assestment() {
    double totalscore = 0.0;

    for (var i = 0; i < spiritualSelfCare_questions.length; i++) {
      totalscore = totalscore +
          double.parse(spiritualSelfCare_questions[i]["rating"].toString());
    }
    var finalscore = totalscore / spiritualSelfCare_questions.length;

    var percent_value = (finalscore / 5) * 100;
    print("===================================================");
    print("percent value over all health spiritual care: $percent_value %");
    print("finalscore of spiritual care: $finalscore");
    insert_overall_health(
        selfcaretype: "Spiritual Assestment",
        over_all_health: percent_value.toString());
  }

  insert_overall_health(
      {required String selfcaretype, required String over_all_health}) async {
    await AssestmentApi.insert_over_all_health(
        selfcaretype: selfcaretype, over_all_health: over_all_health);
  }

  delete_daily_progress() async {
    await AssestmentApi.delete_Daily_progress();
  }
}

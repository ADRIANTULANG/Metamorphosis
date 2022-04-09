import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Diagnosis/controller/diagnosis_controller.dart';
import 'package:metamorphosis/Diagnosis/dialogs/diagnosis_dialogs.dart';
import 'package:metamorphosis/helpers.dart';
import 'package:sizer/sizer.dart';

class WithFilter extends GetView<DiagnosisController> {
  const WithFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.diagnosisList.length,
        itemBuilder: (BuildContext context, int mainindex) {
          return Obx(
            () => controller.assestment_type.value !=
                    controller.diagnosisList[mainindex].assestmentType
                ? SizedBox()
                : Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "● " +
                                controller.diagnosisList[mainindex].diagnosis,
                            style: AppStyle.headers(
                                color: Colors.black, fontsize: 13),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          width: 100.w,
                          padding: EdgeInsets.only(left: 4.35.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Assesment type: " +
                                controller
                                    .diagnosisList[mainindex].assestmentType,
                            style: AppStyle.headers(
                                color: Colors.black, fontsize: 10),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          padding: EdgeInsets.only(left: 4.35.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "score: " +
                                controller.diagnosisList[mainindex].score,
                            style: AppStyle.headers(
                                color: Colors.black, fontsize: 10),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.diagnosisList[mainindex]
                                .personalizedPlan.length,
                            itemBuilder: (BuildContext context, int subindex) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    controller.diagnosisList[mainindex]
                                                .isActiveDiagnosis.value ==
                                            false
                                        ? SizedBox(
                                            height: 2.h,
                                          )
                                        : SizedBox(),
                                    Row(
                                      children: [
                                        Obx(
                                          () => controller
                                                      .diagnosisList[mainindex]
                                                      .isActiveDiagnosis
                                                      .value ==
                                                  false
                                              ? SizedBox(
                                                  width: 4.w,
                                                  child: Text(" - "),
                                                )
                                              : Checkbox(
                                                  activeColor: Colors.white,
                                                  checkColor: Colors.deepPurple,
                                                  value: controller
                                                      .diagnosisList[mainindex]
                                                      .personalizedPlan[
                                                          subindex]
                                                      .isDone
                                                      .value,
                                                  onChanged: (value) {
                                                    if (controller
                                                            .diagnosisList[
                                                                mainindex]
                                                            .personalizedPlan[
                                                                subindex]
                                                            .isDone
                                                            .value ==
                                                        false) {
                                                      controller.check_task(
                                                          isChecked: false,
                                                          mainIndex: mainindex,
                                                          subIndex: subindex);
                                                    } else {}
                                                  }),
                                        ),
                                        Container(
                                          width: 78.w,
                                          // color: Colors.white,
                                          child: Text(
                                            controller
                                                .diagnosisList[mainindex]
                                                .personalizedPlan[subindex]
                                                .plan,
                                            // maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    controller.diagnosisList[mainindex]
                                                .isActiveDiagnosis.value ==
                                            false
                                        ? SizedBox()
                                        : controller
                                                    .diagnosisList[mainindex]
                                                    .personalizedPlan[subindex]
                                                    .isScheduled ==
                                                true
                                            ? Row(
                                                children: [
                                                  SizedBox(
                                                    width: 11.4.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.open_calendar(
                                                          startDate: controller
                                                              .diagnosisList[
                                                                  mainindex]
                                                              .personalizedPlan[
                                                                  subindex]
                                                              .startDate,
                                                          endDate: controller
                                                              .diagnosisList[
                                                                  mainindex]
                                                              .personalizedPlan[
                                                                  subindex]
                                                              .endDate,
                                                          plan: controller
                                                              .diagnosisList[
                                                                  mainindex]
                                                              .personalizedPlan[
                                                                  subindex]
                                                              .plan,
                                                          diagnosis: controller
                                                              .diagnosisList[
                                                                  mainindex]
                                                              .diagnosis);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 2.w,
                                                          right: 2.w,
                                                          top: 1.h,
                                                          bottom: 1.h),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child:
                                                          Text("Open Calendar"),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : controller
                                                        .diagnosisList[
                                                            mainindex]
                                                        .personalizedPlan[
                                                            subindex]
                                                        .isTimer ==
                                                    true
                                                ? Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 11.4.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          // context,
                                                          // MaterialPageRoute(
                                                          //     builder: (build) => StopWatchTimerPage()));
                                                          // Get.to(() =>
                                                          //     StopWatchTimerPage());
                                                          DiagnosisDialog.bottomSheetCallendar(
                                                              plan: controller
                                                                  .diagnosisList[
                                                                      mainindex]
                                                                  .personalizedPlan[
                                                                      subindex]
                                                                  .plan,
                                                              controller:
                                                                  controller);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2.w,
                                                                  right: 2.w,
                                                                  top: 1.h,
                                                                  bottom: 1.h),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: Text(
                                                              "Start Timer"),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox()
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

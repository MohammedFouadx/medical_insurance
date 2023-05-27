// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medical_insurance/app/core/utils/empty_padding.dart';
// import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
// import 'package:medical_insurance/app/global_widgets/custom_buttons.dart';
//
//
// class MedicalDisclosureScreen extends StatefulWidget {
//   MedicalDisclosureScreen({Key? key}) : super(key: key);
//
//   // final String title;
//
//   @override
//   _MedicalDisclosureScreenState createState() => _MedicalDisclosureScreenState();
// }
//
// class _MedicalDisclosureScreenState extends State<MedicalDisclosureScreen> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   final _formKey = GlobalKey<FormState>();
//
//   // Create variables to store the values of the checkboxes
//   bool heartDisease = false;
//   bool respiratoryDisease = false;
//   bool digestiveDisease = false;
//   bool nervousDisease = false;
//   bool boneMuscleDisease = false;
//   bool glandDiabetesDisease = false;
//   bool entEyeDisease = false;
//   bool bloodDisease = false;
//   bool tumorDisease = false;
//   bool disabilityDisease = false;
//   bool kidneyDisease = false;
//   bool otherDisease = false;
//   bool hospitalization = false;
//
//   // Create variables to store the values of the radio buttons
//   String? pregnancyStatus;
//   String? previousPregnancyResult;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:  Theme.of(context).backgroundColor,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60.h),
//           child: const CustomAppBar(),
//         ),
//         body: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Medical History',
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 CheckboxListTile(
//                   title: Text('Heart and blood vessel diseases'),
//                   value: heartDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       heartDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Respiratory system diseases'),
//                   value: respiratoryDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       respiratoryDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Digestive system diseases'),
//                   value: digestiveDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       digestiveDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Nervous system diseases'),
//                   value: nervousDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       nervousDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Bone and muscle diseases'),
//                   value: boneMuscleDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       boneMuscleDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Gland and diabetes diseases'),
//                   value: glandDiabetesDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       glandDiabetesDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title:
//                   Text('Nose, ear, throat and eye diseases'),
//                   value: entEyeDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       entEyeDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Blood diseases'),
//                   value: bloodDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       bloodDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title:
//                   Text('Malignant tumors in the body'),
//                   value: tumorDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       tumorDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title:
//                   Text('Disability or impairment'),
//                   value: disabilityDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       disabilityDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Kidney diseases'),
//                   value: kidneyDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       kidneyDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Other diseases, accidents, surgeries'),
//                   value: otherDisease,
//                   onChanged: (value) {
//                     setState(() {
//                       otherDisease = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: Text('Have you been hospitalized in the last 12 months?'),
//                   value: hospitalization,
//                   onChanged: (value) {
//                     setState(() {
//                       hospitalization = value!;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Information for female participants/wives',
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text('Are you pregnant now?'),
//                 Row(
//                   children: <Widget>[
//                     Radio<String>(
//                       value: 'Yes',
//                       groupValue: pregnancyStatus,
//                       onChanged: (value) {
//                         setState(() {
//                           pregnancyStatus = value;
//                         });
//                       },
//                     ),
//                     Text('Yes'),
//                     Radio<String>(
//                       value: 'No',
//                       groupValue: pregnancyStatus,
//                       onChanged: (value) {
//                         setState(() {
//                           pregnancyStatus = value;
//                         });
//                       },
//                     ),
//                     Text('No'),
//                   ],
//                 ),
//                 Text('In case of previous pregnancy, what was the result?'),
//                 Row(
//                   children: <Widget>[
//                     Radio<String>(
//                       value: 'Normal delivery',
//                       groupValue: previousPregnancyResult,
//                       onChanged: (value) {
//                         setState(() {
//                           previousPregnancyResult = value;
//                         });
//                       },
//                     ),
//                     Text('Normal delivery'),
//                     Radio<String>(
//                       value: 'Caesarean delivery',
//                       groupValue: previousPregnancyResult,
//                       onChanged: (value) {
//                         setState(() {
//                           previousPregnancyResult = value;
//                         });
//                       },
//                     ),
//                     Text('Caesarean delivery'),
//                     Radio<String>(
//                       value: 'Abortion',
//                       groupValue: previousPregnancyResult,
//                       onChanged: (value) {
//                         setState(() {
//                           previousPregnancyResult = value;
//                         });
//                       },
//                     ),
//                     Text('Abortion'),
//                   ],
//                 ),
//                 16.ph,
//
//                 /// send
//                 CustomButtons(
//                     text: "إرسال",
//                     buttonColor: Theme.of(context).secondaryHeaderColor,
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       // The form is valid, show a success message
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Form submitted successfully'),
//                         ),
//                       );
//                     } else {
//                       // The form is not valid, show an error message
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Please fill the form correctly'),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_insurance/app/core/utils/constants.dart';
import 'package:medical_insurance/app/core/utils/empty_padding.dart';
import 'package:medical_insurance/app/global_widgets/custom_app_bar.dart';
import 'package:medical_insurance/app/global_widgets/custom_buttons.dart';


class MedicalDisclosureScreen extends StatefulWidget {
  const MedicalDisclosureScreen({Key? key}) : super(key: key);

  // final String title;

  @override
  _MedicalDisclosureScreenState createState() => _MedicalDisclosureScreenState();
}

class _MedicalDisclosureScreenState extends State<MedicalDisclosureScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Create variables to store the values of the checkboxes
  bool heartDisease = false;
  bool respiratoryDisease = false;
  bool digestiveDisease = false;
  bool nervousDisease = false;
  bool boneMuscleDisease = false;
  bool glandDiabetesDisease = false;
  bool entEyeDisease = false;
  bool bloodDisease = false;
  bool tumorDisease = false;
  bool disabilityDisease = false;
  bool kidneyDisease = false;
  bool otherDisease = false;
  bool hospitalization = false;

  // Create variables to store the values of the radio buttons
  String? pregnancyStatus;
  String? previousPregnancyResult;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: const CustomAppBar(),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "الإفصاح الطبي",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp
                    ),
                  ),

                  20.ph,

                  Container(
                    padding: EdgeInsets.all(5.0.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                      color: Theme.of(context).primaryColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'التاريخ الطبي',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        8.ph,
                        CheckboxListTile(
                          title: const Text('أمراض القلب والشرايين'),
                          value: heartDisease,
                          onChanged: (value) {
                            setState(() {
                              heartDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الجهاز التنفسي'),
                          value: respiratoryDisease,
                          onChanged: (value) {
                            setState(() {
                              respiratoryDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الجهاز الهضمي'),
                          value: digestiveDisease,
                          onChanged: (value) {
                            setState(() {
                              digestiveDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الجهاز العصبي'),
                          value: nervousDisease,
                          onChanged: (value) {
                            setState(() {
                              nervousDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض العظم والعضلات'),
                          value: boneMuscleDisease,
                          onChanged: (value) {
                            setState(() {
                              boneMuscleDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الغدد والسكري'),
                          value: glandDiabetesDisease,
                          onChanged: (value) {
                            setState(() {
                              glandDiabetesDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:
                          const Text('أمراض الأنف والأذن والحنجرة والعيون'),
                          value: entEyeDisease,
                          onChanged: (value) {
                            setState(() {
                              entEyeDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الدم'),
                          value: bloodDisease,
                          onChanged: (value) {
                            setState(() {
                              bloodDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:
                          const Text('أورام خبيثة في الجسم'),
                          value: tumorDisease,
                          onChanged: (value) {
                            setState(() {
                              tumorDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title:
                          const Text('عجز او إعاقة'),
                          value: disabilityDisease,
                          onChanged: (value) {
                            setState(() {
                              disabilityDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض الكلى'),
                          value: kidneyDisease,
                          onChanged: (value) {
                            setState(() {
                              kidneyDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('أمراض أخرى  حوادث,عمليات'),
                          value: otherDisease,
                          onChanged: (value) {
                            setState(() {
                              otherDisease = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('هل تم التنويم بالمستشفى خلال اخر ١٢ شهر'),
                          value: hospitalization,
                          onChanged: (value) {
                            setState(() {
                              hospitalization = value!;
                            });
                          },
                        ),
                        16.ph,
                        const Text(
                          'معلومات خاصة بالمشتركات/الزوجات',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        8.ph,
                        const Text('هل هناك حمل الان؟'),
                        Row(
                          children: <Widget>[
                            Radio<String>(
                              value: 'نعم',
                              groupValue: pregnancyStatus,
                              onChanged: (value) {
                                setState(() {
                                  pregnancyStatus = value;
                                });
                              },
                            ),
                            const Text('نعم'),
                            Radio<String>(
                              value: 'لا',
                              groupValue: pregnancyStatus,
                              onChanged: (value) {
                                setState(() {
                                  pregnancyStatus = value;
                                });
                              },
                            ),
                            const Text('لا'),
                          ],
                        ),
                        const Text('في حال الحمل السابق كيف كانت النتيجة؟'),
                        Row(
                          children: <Widget>[
                            Radio<String>(
                              value: 'ولادة طبيعية',
                              groupValue: previousPregnancyResult,
                              onChanged: (value) {
                                setState(() {
                                  previousPregnancyResult = value;
                                });
                              },
                            ),
                            const Expanded(child: Text('ولادة طبيعية')),
                            Radio<String>(
                              value: 'ولادة قيصرية',
                              groupValue: previousPregnancyResult,
                              onChanged: (value) {
                                setState(() {
                                  previousPregnancyResult = value;
                                });
                              },
                            ),
                            const Expanded(child: Text('ولادة قيصرية')),
                            Radio<String>(
                              value: 'إجهاض',
                              groupValue: previousPregnancyResult,
                              onChanged: (value) {
                                setState(() {
                                  previousPregnancyResult = value;
                                });
                              },
                            ),
                            const Expanded(child: Text('إجهاض')),
                          ],
                        ),
                        16.ph,

                        /// send
                        CustomButtons(
                            text: "إرسال",
                            buttonColor: Theme.of(context).secondaryHeaderColor,
                            onTap: () {
                              // Validate and submit the form
                              if (_formKey.currentState!.validate()) {
                                // The form is valid, show a success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('تم إرسال الاستمارة بنجاح'),
                                  ),
                                );
                              } else {
                                // The form is not valid, show an error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('يرجى ملء الاستمارة بشكل صحيح'),
                                  ),
                                );
                              }
                            }
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
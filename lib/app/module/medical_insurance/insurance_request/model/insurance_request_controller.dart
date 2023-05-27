import 'package:flutter/material.dart';
import 'package:medical_insurance/app/module/medical_insurance/insurance_request/model/marital_status.dart';

final married = MaritalStatus(
    id: "1",
    name:  "مزوج"
);

final single = MaritalStatus(
    id: "2",
    name:  "عازب"
);

final divorced = MaritalStatus(
    id: "3",
    name:  "مطلق"
);

final widower = MaritalStatus(
    id: "4",
    name:  "أرمل"
);


////////////////////////////////////////////////////

final mother = MaritalStatus(
    id: "1",
    name:  "الام"
);

final father = MaritalStatus(
    id: "2",
    name:  "الاب"
);

final son = MaritalStatus(
    id: "3",
    name:  "الابن"
);

final daughter = MaritalStatus(
    id: "4",
    name:  "الابنه"
);

final husband = MaritalStatus(
    id: "4",
    name:  "الزوج"
);

final wife = MaritalStatus(
    id: "4",
    name:  "الزوجة"
);




class InsuranceRequestController {

  List<DropdownMenuItem<String>> _maritalStatusItems = [];
  List<DropdownMenuItem<String>> get maritalStatusItems => _maritalStatusItems;
  final List<MaritalStatus> maritalStatusList = [
    married,
    single,
    divorced,
    widower
  ];


  /// relationships
  List<DropdownMenuItem<String>> _relationshipsItems = [];
  List<DropdownMenuItem<String>> get relationshipsItems => _relationshipsItems;
  final List<MaritalStatus> relationshipsList = [
    mother,
    father,
    son,
    daughter,
    husband,
    wife
  ];




  getMaritalStatus(BuildContext context) {
    _maritalStatusItems = [];
    for (var i = 0; i < maritalStatusList.length; i++) {
      _maritalStatusItems.add(DropdownMenuItem(
        value: "${maritalStatusList[i].name}",
        child: Text(
            "${maritalStatusList[i].name}",

          style: Theme.of(context).textTheme.bodyText2,
        ),
      ));
      // currentLocation = items[0].name;
    }

  }

  getRelationShips(BuildContext context) {
    _relationshipsItems = [];
    for (var i = 0; i < relationshipsList.length; i++) {
      _relationshipsItems.add(DropdownMenuItem(
        value: "${relationshipsList[i].name}",
        child: Text(
            "${relationshipsList[i].name}",

          style: Theme.of(context).textTheme.bodyText2,
        ),
      ));
      // currentLocation = items[0].name;
    }

  }

}


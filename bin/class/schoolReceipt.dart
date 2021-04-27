import 'dart:convert';
import './receipt.dart';
class SchoolReceipt extends Receipt {
  int grade;
  String group;
  String tutor;
  SchoolReceipt(
    emmiter,
    String socialReason,
    rfc, 
    String description, 
    int sessionNumber, 
    double amount,
    this.grade,
    this.group,
    this.tutor
  ) : super(emmiter, socialReason, rfc, description, sessionNumber, amount);
  
  //Constructor for JSON
  SchoolReceipt.fromSchoolReceipt(Map<String, String> jsonData) : this(
      jsonData[ 'emmiter' ], 
      jsonData[ 'socialReason' ], 
      jsonData[ 'rfc' ], 
      jsonData[ 'description' ], 
      int.parse((jsonData[ 'sessionNumber' ])),
      double.parse(jsonData[ 'amount' ]),
      int.parse(jsonData[ 'grade' ]),
      jsonData[ 'group' ],
      jsonData[ 'tutor' ]
  );

  @override
  double getTotalAmount(Receipt receipt) {
    return amount - calculateDiscount();
  }
  double calculateDiscount(){
    return amount * 0.15;
  }
  @override
  String toString() {
    return super.toString() + 
      '"group":"$group"' 
      '"grade":"$grade"';
  }
}
import 'dart:convert';
import './functions.dart' as functions;
import 'class/schoolReceipt.dart';

Map<String, String> colegiature = {
  'group' : 'Grupo A', 
  'grade' : '3', 
  'tutor' : 'Pedro Canales',
  'amount' : '1500' ,
  'emmiter' : 'Colegio las Rosas' ,
  'socialReason' : 'Brayan Téllez Cruz', 
  'rfc' : 'CALP700410T96', 
  'description' : 'Colegiatura del mes de Marzo',
  'sessionNumber' : '123123'
};
void main(List<String> arguments) {
  SchoolReceipt schoolReceipt = SchoolReceipt.fromSchoolReceipt( colegiature );
  print( '---------------------------' );
  print( 'Emmiter : ${schoolReceipt.emmiter}' );
  print( 'Tutor : ${schoolReceipt.tutor}' );
  print( 'RFC : ${schoolReceipt.rfc}' );
  print( 'Social reason : ${schoolReceipt.socialReason}' );
  print( 'Grade : ${schoolReceipt.grade}' );
  print( 'Group : ${schoolReceipt.group}' );
  print( 'Description : ${schoolReceipt.description}' );
  print( 'Amount : ${schoolReceipt.amount}' );
  print( 'Discount : ${schoolReceipt.calculateDiscount()}' );
  print( 'Total : ${schoolReceipt.getTotalAmount( schoolReceipt )}' );
}
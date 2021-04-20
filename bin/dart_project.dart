import 'dart:convert';
import './functions.dart' as functions;
import 'class/receipt.dart';

void main(List<String> arguments) {
  final receiptStructure = '{"sessionNumber":4,"amount":1000,"emmiter":"Berenice Alamilla","socialReason":"Juan Campos","rfc":"ALAB930130LQ5","description":"Plano topográfico"}';
  final jsonReceipt = Receipt.fromReceipt( receiptStructure );
  print(jsonReceipt.toString());
  print(jsonReceipt.parseJSON(jsonReceipt));
  jsonReceipt.parseJSON(jsonReceipt).forEach((key, value) {
    print('$key : $value');
  });
  print('IVA : ${jsonReceipt.calculateIVA(jsonReceipt)}');
  print('ISR : ${jsonReceipt.calculateISR(jsonReceipt)}');
  print('Total amount : ${jsonReceipt.getTotalAmount(jsonReceipt)}');
}
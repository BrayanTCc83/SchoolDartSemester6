import './functions.dart' as functions;
import 'class/receipt.dart';

void main(List<String> arguments) {
  final receipt = Receipt( 'Brayan Téllez Cruz', 'CFE Principal', 'TECB030118AK1', 'Light receipt by CFE', 1, 6000 );
  print( 'Emmiter : ${receipt.emmiter}' );
  print( 'Social reason : ${receipt.socialReason}' );
  print( 'RFC : ${receipt.rfc}' );
  print( 'Description : ${receipt.description}' );
  print( 'Check number : ${receipt.sessionNumber}' );
  print( 'Amount : ${receipt.amount}' );
  print( 'IVA : ${receipt.calculateIVA(receipt)}' );
  print( 'ISR : ${receipt.calculateISR(receipt)}' );
  print( 'Total amount : ${receipt.getTotalAmount(receipt)}' );
}
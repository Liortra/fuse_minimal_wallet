import 'package:flutter_test/flutter_test.dart';

void main(){

  test(("add dot by index test"), (){


    final value =  "123456789".replaceAllMapped(RegExp(r".{2}"), (match) =>"${match.group(0)}");
    print("value: $value");
  });
}
import '../models/address.dart';

class Person{
  String name,mobile;
  int age;
  Address address;

  Person(this.name,this.mobile,this.age,this.address);

  factory Person.fromJson(Map<String,dynamic> data){
    return Person(data["name"],data["mobile"],data["age"],Address.fromJson(data["address"]));
  }

  Map<String,dynamic> toJson(){
    return {
      "name": this.name,
      "mobile": this.mobile,
      "age": this.age,
      "address": address.toJson()
    };
  }
}
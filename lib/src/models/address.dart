class Address{
  String city,country;

  Address(this.city,this.country);

  factory Address.fromJson(Map<String,dynamic> data){
    return Address(data["city"], data["country"]);
  }

  Map<String,dynamic> toJson(){
    return {
      "city": this.city,
      "country": this.country
    };
  }
}
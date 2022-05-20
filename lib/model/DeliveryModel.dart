class DeliveryModel {
  String name;
  String phoneNumber;
  String street;
  String town;
  String city;
  String hamlet;
  String addressType;

  DeliveryModel({
    required this.addressType,
    required this.hamlet,
    required this.town,
    required this.city,
    required this.name,
    required this.phoneNumber,
    required this.street,
  });
}
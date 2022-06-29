class Person {
  final String name;
  final String addressLine1;
  final String addressCity;
  final String addressState;
  final List<Person> children;
  const Person(this.name, this.addressLine1, this.addressCity,
      this.addressState, this.children);
// You write this serialization code.
  Map<String, dynamic> toJson() {
    var map = {
      'name': name,
      'addr': addressLine1,
      'city': addressCity,
      'state': addressState,
      'children': children
    };
    return map;
  }

// You write this serialization code.
  @override
  String toString() {
    return 'Person{name: $name, addressLine1: $addressLine1, addressCity: $addressCity, addressState: $addressState, children: $children}';
  }
}

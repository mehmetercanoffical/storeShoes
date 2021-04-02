class Address {
  int id;
  String title;
  String descp;
  int regionCount;
  DateTime addedDate = DateTime.now();
  DateTime modifiedDate = DateTime.now();
  Address({
    this.addedDate,
    this.modifiedDate,
    this.descp,
    this.id,
    this.regionCount,
    this.title,
  });
}

abstract class DetailsEvent {}

class DetailsList extends DetailsEvent{
  int quantity;
  var product_id;
  DetailsList({required this.product_id,required this.quantity});
}
abstract class ViewcartEvent {}

class ViewCartEvent extends ViewcartEvent{}

class DeleteCartvent extends ViewcartEvent{
  int productid;
  DeleteCartvent({required this.productid});
}



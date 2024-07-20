abstract class DeleteEvent {}

class deleteCart extends DeleteEvent{
  int cartId;
  deleteCart({required this.cartId});
}
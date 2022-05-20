class CartModel {
  String cartId = '';
  String cartName = '';
  String cartImage = '';
  String cartDescription = ' ';
  int cartPrice = 0;

  CartModel({required this.cartId,
    required this.cartName,
    required this.cartImage,
    required this.cartDescription,
    required this.cartPrice});
}
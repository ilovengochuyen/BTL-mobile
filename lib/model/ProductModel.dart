class ProductModel {
  String productName = '';
  String productImage = '';
  int productPrice = 0;
  String productId = '';
  String productDescription = '';
  ProductModel(
      {
        required this.productId,
        required this.productImage,
        required this.productName,
        required this.productPrice,
        required this.productDescription});
}
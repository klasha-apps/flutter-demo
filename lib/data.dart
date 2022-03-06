class Products {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productDescription;
  final String productRate;

  Products({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productRate,
  });
}

List productList = [
  Products(
      productImage: 'assets/images/nike1.png',
      productName: 'Nike Mercurial Superfly 7 Elite Mbappé Rosa FG',
      productPrice: '₦ 12,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike2.png',
      productName: 'Nike Air VaporMax Plus',
      productPrice: '₦ 10,500.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike3.png',
      productName: 'Nike Air Max 270 G',
      productPrice: '₦ 8,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike4.png',
      productName: 'NikeCourt Air Zoom GP Turbo Naomi Osaka',
      productPrice: '₦ 15,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike5.png',
      productName: 'Nike Air Zoom Pegasus 38 Shield By You',
      productPrice: '₦ 11,500.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike6.png',
      productName: 'Nike Mercurial Superfly 7 Elite Mbappé Rosa FG',
      productPrice: '₦ 10,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike7.png',
      productName: 'Nike Air Max Plus SE',
      productPrice: '₦ 18,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
  Products(
      productImage: 'assets/images/nike8.png',
      productName: 'Nike Air Zoom Terra Kiger 7',
      productPrice: '₦ 5,000.00',
      productDescription: 'Eligible for Shipping To Mars or somewhere else',
      productRate: '4'
  ),
];

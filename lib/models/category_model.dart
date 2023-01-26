import 'package:equatable/equatable.dart';

class Category_ extends Equatable {
  final String name;
  final String imageUrl;

  Category_({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category_> categories = [
    Category_(
        name: 'Laptop',
        imageUrl:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80'),
    Category_(
        name: 'Ram',
        imageUrl:
            'https://images.unsplash.com/photo-1563019589-7e7db5152430?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
    Category_(
        name: 'Monitor',
        imageUrl:
            'https://images.unsplash.com/photo-1563019589-7e7db5152430?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
    Category_(
        name: 'Hard Drive',
        imageUrl:
            'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80'),
  ];
}

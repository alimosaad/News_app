import 'dart:ui';

class CategoryData{
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);
  static List<CategoryData> getCategory(){
    return [
      CategoryData('sports', 'sports', 'assets/images/sports.png', Color(0xFFC91C22)),
      CategoryData('general', 'general', 'assets/images/sports.png', Color(0xFF003E90)),
      CategoryData('technology', 'technology', 'assets/images/science.png', Color(0xFF003E90)),
      CategoryData('health', 'health', 'assets/images/health.png', Color(0xFFED1E79)),
      CategoryData('business', 'business', 'assets/images/bussines.png', Color(0xFFCF7E48)),
      CategoryData('entertainment', 'entertainment', 'assets/images/environment.png', Color(0xFFF2D352)),
      CategoryData('science', 'science', 'assets/images/science.png', Color(0xFF4882CF)),
    ];
  }
}
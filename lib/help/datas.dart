import 'package:news_app_final/model/model_category.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  ///////////////
  categoryModel.categoriesName = "Business";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/id/1383977365/photo/shot-of-two-businesspeople-discussing-something-on-a-digital-tablet.webp?s=612x612&w=is&k=20&c=C9oeLP5G2FWDOvPMZjdcnK4vinE2R3mY-5XsbfK4G1E=";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  /////////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1561174356-638d86f24f04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80";
  category.add(categoryModel);

  ///////////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80";
  category.add(categoryModel);

  ///////////////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "Health";
  categoryModel.imageUrl =
      "https://plus.unsplash.com/premium_photo-1670505059783-806c0708bb31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  category.add(categoryModel);

  ///////////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "Science";
  categoryModel.imageUrl =
      "https://plus.unsplash.com/premium_photo-1661281403791-f01400b4ec52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80";
  category.add(categoryModel);

  ///////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1592592878585-abcaaaaf7cd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80";
  category.add(categoryModel);

  ////////////////////////
  categoryModel = new CategoryModel();
  categoryModel.categoriesName = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1487887235947-a955ef187fcc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1055&q=80";
  category.add(categoryModel);

  return category;
}

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // menentukan nama route dari screen ini
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;

  //initState = akan di jalankan pertamakali ketika membuka halaman ini
  @override
  void initState() {
    // TODO: implement initState
    // . . .
    super.initState();
  }

  //didChange = not sure.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      //ModalRoute untuk menampung variable yg dikirim kentika menggunakan PushNamed
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      // categoryMeals merupakan kumpulan dummy_meals,
      // where meal.categoies mengandung categories id,
      // categories id. jadi mirip seperti filter fungsiny
      // dan categorymeals langsung dijadikan dalam bentuk list.
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals!.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals!.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
          );
        },
      ),
    );
  }
}

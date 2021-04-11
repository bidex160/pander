import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';

class CategoryCard {
  final String title;
  final String subtitle;
  final String thumbnail;

  CategoryCard(this.title, this.subtitle, this.thumbnail);
}

class LaundrySection extends StatelessWidget {
  final List<CategoryCard> categoryCards = [
    CategoryCard('Wash Only', '2 days', 'assets/wash.png'),
    CategoryCard('Iron Only', '2 days', 'assets/iron.png'),
    CategoryCard('Wash and Iron', '2 days', 'assets/wash_iron.png'),
    CategoryCard('Dry Clean', '2 days', 'assets/dry_clean.png')
  ]; 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              var category = categoryCards[index];
              
              return Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => goToPage(context, RoutePaths.OrderDetails, argument: category),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: category.title, 
                          child: Image(
                            image: AssetImage(category.thumbnail)
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          category.title,
                          style: AppStyles.textMDWhite.copyWith(
                            color: AppColors.BLUE,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          category.subtitle,
                          style: AppStyles.textSMBlack.copyWith(
                            color: AppColors.BLUE,
                          ),
                        )
                      ],
                    )
                  ),
                ),
              );     
            },
            childCount: categoryCards.length), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            )
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42),
                Text(
                  'Special Offers',
                  style: AppStyles.textMDBlack.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/shirt.png')
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          '30% off first order',
                          style: AppStyles.textMDBlack.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '12 days',
                          style: AppStyles.textSMBlack,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
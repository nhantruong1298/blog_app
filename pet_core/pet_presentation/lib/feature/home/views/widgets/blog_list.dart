import 'package:flutter/material.dart';
import 'package:pet_presentation/feature/home/views/widgets/blog_list_item.dart';
import 'package:pet_presentation/feature/utils/size_config.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class BlogList extends StatelessWidget {
  const BlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius)),
      width: SizeConfig.screenWidth,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        BlogListItem(
          commentsAmount: 5,
          likesAmount: 4,
          name: 'Name',
          tags: ['tag', 'tag'],
          title: 'title',
          date: '12 July',
        )
      ]),
    );
  }
}

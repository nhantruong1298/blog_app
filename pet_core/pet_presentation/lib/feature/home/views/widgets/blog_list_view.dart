import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/feature/home/cubit/home_cubit.dart';
import 'package:pet_presentation/feature/home/views/widgets/blog_list_item.dart';
import 'package:pet_presentation/feature/utils/size_config.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class BlogListView extends StatelessWidget {
  const BlogListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeLoadedState,
      builder: (context, state) {
        if (state is! HomeLoadedState) return const SizedBox();

        final blogs = state.blogs;

        return Container(
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius)),
          width: SizeConfig.screenWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...List.generate(blogs.length, (index) {
              final blog = blogs[index];

              return BlogListItem(
                commentsAmount: blog.commentAmount,
                dateCrated: blog.dateCreated,
                likesAmount: blog.likeAmount,
                title: blog.title,
                name: blog.authorName,
              );
            }).toList()
          ]),
        );
      },
    );
  }
}

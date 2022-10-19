import 'package:flutter/material.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/Spacing.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';
import 'package:pet_presentation/widgets/commons/typography/heading_text.dart';

class BlogListItem extends StatelessWidget {
  final String? avatarUrl;
  final String? name;
  final String? date;
  final String? title;
  final List<String?> tags;
  final int? likesAmount;
  final int? commentsAmount;

  const BlogListItem(
      {Key? key,
      this.avatarUrl,
      this.name,
      this.date,
      this.title,
      this.tags = const [],
      this.likesAmount,
      this.commentsAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAvatar(),
        const Spacing(.5, direction: SpacingDirection.Horizontal),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BodySText(
              name ?? '',
              style: BodySText.defaultStyle.copyWith(
                  fontWeight: FontWeight.w500, color: const Color(0xFF3D3D3D)),
            ),
            BodyXSText(date ?? '', color: const Color(0xFF525252)),
            const Spacing(1),
            Heading3Text(title ?? ''),
            const Spacing(1),
            Wrap(
                children: List.generate(
                    tags.length,
                    (index) => _BlogTag(
                          value: tags[index] ?? '',
                          padding: const EdgeInsets.only(
                              right: AppDimensions.defaultPadding,
                              bottom: AppDimensions.defaultPadding),
                        )).toList()),
            const Spacing(1),
            Row(children: [
              _BlogListItemButton(
                  onTap: () {},
                  amount: likesAmount ?? 0,
                  value: S.current.BLOG__REACTIONS,
                  icon: Assets.images.loveIcon.svg(
                      height: AppDimensions.defaultIconSize,
                      fit: BoxFit.scaleDown)),
              const Spacing(1, direction: SpacingDirection.Horizontal),
              _BlogListItemButton(
                  onTap: () {},
                  amount: commentsAmount ?? 0,
                  value: S.current.BLOG__COMMENTS,
                  icon: Assets.images.addCommentIcon.svg(
                      height: AppDimensions.defaultIconSize,
                      fit: BoxFit.scaleDown)),
            ])
          ]),
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: Assets.images.avartaIcon
          .svg(fit: BoxFit.scaleDown, height: AppDimensions.defaultIconSize),
    );
  }
}

class _BlogListItemButton extends StatelessWidget {
  final int amount;
  final String value;
  final VoidCallback onTap;
  final Widget icon;
  const _BlogListItemButton(
      {Key? key,
      required this.amount,
      required this.value,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryLightColor,
      child: InkWell(
          onTap: () => onTap,
          child: Row(
            children: [
              icon,
              const Spacing(.25, direction: SpacingDirection.Horizontal),
              BodySText('$amount $value'),
            ],
          )),
    );
  }
}

class _BlogTag extends StatelessWidget {
  final String value;
  final EdgeInsets? padding;
  const _BlogTag({Key? key, required this.value, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        color: AppColors.primaryLightColor,
        child: InkWell(
          onTap: () {},
          child: BodySText('#' + value),
        ),
      ),
    );
  }
}

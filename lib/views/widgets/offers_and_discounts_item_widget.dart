import 'package:silver_clinics/constants/app_imports.dart';

class OffersAndDiscountsItemWidget extends StatelessWidget {
  final OffersAndDiscountsModel offerAndDiscount;

  const OffersAndDiscountsItemWidget(
    this.offerAndDiscount, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(offerAndDiscount.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  offerAndDiscount.title,
                  style: AppFonts.boldNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                ),
                const GapWidget(5),
                ReadMoreText(
                  offerAndDiscount.body,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: AppStrings.showMoreText,
                  trimExpandedText: AppStrings.spaceSign + AppStrings.spaceSign + AppStrings.showLessText,
                  style: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                  lessStyle: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 10,
                  ),
                  moreStyle: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

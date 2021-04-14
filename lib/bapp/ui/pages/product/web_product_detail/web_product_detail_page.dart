import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_banner/product_detail_banner_section_card.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_header/proudct_share_header.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_image_section_view/product_detail_image_section_view.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_material_section/product_material_section.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_skeleton.dart';
import 'package:taoju5/bapp/ui/pages/product/web_product_detail/web_product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';

class WebProductDetailPage extends StatelessWidget {
  const WebProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebProductDetailController>(
      builder: (_) {
        return XLoadStateBuilder(
          loadState: _.loadState,
          loadingWidget: ProductDetailSkeleton(),
          retry: _.loadData,
          builder: (BuildContext context) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ProductDetailBannerCard(
                      imageList: _.product.imageList,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProductShareHeader(
                      product: _.product,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProductMaterialSection(
                        materialList: _.product.materialList),
                  ),
                  SliverToBoxAdapter(
                    child: ProductDetailImageSectionView(
                        imageList: _.product.detailImgList),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

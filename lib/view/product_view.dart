import 'package:final_app/model/user_model.dart';
import 'package:final_app/view/product_detail_view.dart';
import 'package:final_app/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: const Text(
          "Mobile Phone",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: productViewModel.loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange.shade600,
              ),
            )
          : productViewModel.userError != null
              ? Center(
                  child: Text(productViewModel.userError!.message.toString()))
              : productListDesign(productViewModel.productModel, context),
    );
  }

  productListDesign(ProductModel? productModel, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productModel?.products?.length,
      itemBuilder: (context, index) =>
          productContainerDesign(productModel, index, context),
    );
  }

  productContainerDesign(
      ProductModel? productModel, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetailView(product: productModel!.products![index])));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: width! * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productModel?.products?[index].thumbnail ?? "",
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productModel?.products?[index].title ?? "",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${productModel!.products![index].price}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      " (-${productModel.products![index].discountPercentage}%)",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Stock: ${productModel.products![index].stock}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ratings: ${productModel.products![index].rating}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

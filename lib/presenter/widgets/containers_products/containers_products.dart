import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socofrais/domain/entities/product.dart';
import 'package:socofrais/presenter/pages/details/controllers/detail_controller.dart';
import 'package:socofrais/presenter/pages/details/views/detail_view.dart';

class ContainerProductWidget extends StatelessWidget {
  final Product product;
  const ContainerProductWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put<DetailController>(DetailController(product: product));
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: controller.productList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(
              () => DetailView(
                product: controller.productList[index],
              ),
            );
          },
          child: Container(
            height: 135,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 15.0,
                  spreadRadius: 0.5,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: controller.productList[index].image != ''
                          ? Image.asset(
                              controller.productList[index].image,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    controller.productList[index].name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      controller.productList[index].description,
                      style: TextStyle(fontSize: 9, color: Colors.grey[500]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${controller.productList[index].price} F",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

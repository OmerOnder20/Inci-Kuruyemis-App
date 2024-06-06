import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/%C3%BCr%C3%BCnDetay/view/%C3%BCr%C3%BCn_detay_view.dart';
import 'package:inci_kuruyemis/product/models/%C3%BCr%C3%BCn_model.dart';
import 'package:inci_kuruyemis/product/utility/constants/api_constants.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../core/size/sizes.dart';

class SearchProductDelegate extends SearchDelegate {
  final FocusNode focusNode;
  final String searchFieldLabel;
  final TextStyle searchFieldStyle;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  SearchProductDelegate({
    required this.focusNode,
    required this.searchFieldLabel,
    required this.searchFieldStyle,
    required this.keyboardType,
    required this.textInputAction,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear_rounded,
              color: ColorUtility.blackColor, size: SizeUtility.mediumX))
    ];
  }

  @override
  Widget? buildLeading(
    BuildContext context,
  ) {
    return IconButton(
        onPressed: () {
          close(context, null);
          context.router.pop();
          FocusScope.of(context).unfocus();
        },
        icon: Icon(Icons.arrow_back_rounded,
            color: ColorUtility.blackColor, size: SizeUtility.mediumX));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Products>>(
        future: searchProducts(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(StringConstants.urunBulunamadi));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data?[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UrunDetayView(
                                products: product ??
                                    Products(
                                      variationIndex: 0,
                                      isShown: false,
                                    ))));
                      },
                      child: ListTile(
                        title: Text(product?.name ?? ""),
                        trailing: Container(
                          height: SizeUtility.largeXX.h,
                          width: SizeUtility.largeXX.w,
                          decoration: const BoxDecoration(
                              color: ColorUtility.yellowColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: ColorUtility.whiteColor,
                            size: SizeUtility.mediumX,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorUtility.avatarColorGrey,
                    ),
                  ],
                );
              },
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Products>>(
        future: searchProducts(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(StringConstants.urunBulunamadi));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data?[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UrunDetayView(
                                products: product ??
                                    Products(
                                      variationIndex: 0,
                                      isShown: false,
                                    ))));
                      },
                      child: ListTile(
                        title: Text(product?.name ?? ""),
                        trailing: Container(
                          height: SizeUtility.largeXX.h,
                          width: SizeUtility.largeXX.w,
                          decoration: const BoxDecoration(
                              color: ColorUtility.yellowColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: ColorUtility.whiteColor,
                            size: SizeUtility.mediumX,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorUtility.avatarColorGrey,
                    ),
                  ],
                );
              },
            );
          }
        });
  }

  Future<List<Products>> searchProducts(String query) async {
    try {
      final dio = Dio();
      final response = await dio
          .get('${ApiConstants.baseUrl}/${ApiConstants.searchQuery}$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        List<Products> products =
            data.map((e) => Products.fromJson(e)).toList();
        return products;
      } else {
        throw Exception('Ürün araması başarısız oldu.');
      }
    } catch (e) {
      throw Exception('Ürün araması başarısız oldu: $e');
    }
  }
}

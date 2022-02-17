import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
import 'package:flutter_ducafecat_news_getx/common/values/values.dart';
import 'package:flutter_ducafecat_news_getx/common/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../index.dart';
import 'ad.dart';

/// 新闻行 Item
class NewsListWidget extends GetView<MainController> {
  NewsListWidget();

  Widget _buildListItem(NewsItem item) {
    return Container(
      height: 161.w,
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          InkWell(
            onTap: () {
              // ExtendedNavigator.rootNavigator.pushNamed(
              //   Routes.detailsPageRoute,
              //   arguments: DetailsPageArguments(item: item),
              // );
            },
            child: SizedBox(
              width: 121.w,
              height: 121.w,
              child: netImageCached(
                item.thumbnail ?? "",
                width: 121.w,
                height: 121.w,
              ),
            ),
          ),
          // 右侧
          SizedBox(
            width: 194.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 作者
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text(
                    item.author ?? "",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                // 标题
                InkWell(
                  onTap: () {
                    // ExtendedNavigator.rootNavigator.pushNamed(
                    //   Routes.detailsPageRoute,
                    //   arguments: DetailsPageArguments(item: item),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.w),
                    child: Text(
                      item.title ?? "",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        overflow: TextOverflow.clip,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                  ),
                ),
                // Spacer
                Spacer(),
                // 一行 3 列
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 60.w,
                        ),
                        child: Text(
                          item.category ?? "",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryElementText,
                            fontSize: 14.sp,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 添加时间
                      Container(
                        width: 15.w,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 100.w,
                        ),
                        child: Text(
                          '• ${duTimeLineFormat(item.addtime ?? DateTime(0))}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.thirdElementText,
                            fontSize: 14.sp,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 更多
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.primaryText,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.newsPageList == null
        ? Container()
        : Column(
            children: controller.state.newsPageList.items.map<Widget>((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                _buildListItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = controller.state.newsPageList.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  AdWidget(),
                  Divider(height: 1),
                ]);
              }

              // 返回
              return Column(
                children: widgets,
              );
            }).toList(),
          ));
  }
}

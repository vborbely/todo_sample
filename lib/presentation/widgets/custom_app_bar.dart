import '../presentation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool canPop;
  final VoidCallback? onPopAction;

  const CustomAppBar({Key? key, this.canPop = false, this.onPopAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Text('TODO not implemented'),
    );

    // return SizedBox(
    //     width: width,
    //     height: preferredSize.height,
    //     child: Padding(
    //       padding: EdgeInsets.only(left: canPop == true ? 50.0 : 0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           canPop
    //               ? Expanded(
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       onPopAction?.call();
    //                       Navigator.of(context).pop();
    //                     },
    //                     child: Container(
    //                       color: Colors.transparent,
    //                       padding: EdgeInsets.only(top: 5.0),
    //                       child: Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           SvgPicture.asset(
    //                             Assets.imgBackButton,
    //                             fit: BoxFit.fill,
    //                             color: Colors.white,
    //                             width: AppConstant.headerIconWidth,
    //                             height: AppConstant.headerIconHeight,
    //                           ),
    //                           const SizedBox(width: 8),
    //                           Expanded(
    //                             child: Text(
    //                               'back_button_leading'.tr,
    //                               style: const TextStyle(
    //                                 color: AppColors.appBarHeaderText,
    //                                 fontSize: 20,
    //                                 // fontSize: getFontSize(24),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               : const Spacer(),
    //           IconButton(
    //             onPressed: () {
    //               Scaffold.of(context).openEndDrawer();
    //             },
    //             icon: const Icon(
    //               Icons.menu_rounded,
    //               size: 45,
    //               color: Colors.white,
    //             ),
    //           ),
    //           // const SizedBox(width: 20)
    //         ],
    //       ),
    //     ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ThemeData().appBarTheme.toolbarHeight ?? kToolbarHeight);
}

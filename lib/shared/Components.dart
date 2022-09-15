//import 'package:udemy_first_app/modules/authintication/auth_screen.dart.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../modules/web_view/webview.dart';
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);
Widget defaultTextButton({
  required String text,
  required Function function,
}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text('${text.toUpperCase()}'));

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false,
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  required String text,
  required Function function,
  bool isUpperCase = true,
  double radius = 0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        /*()
        {
          function();
          }*/
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

/////////////////////////////////////

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  bool isPassword = false,
  String? label,
  IconData? prefixIcon,
   required IconData? suffixIcon,
  onSubmit,
  onChange,
  onTap,
  required validator,
  function,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
      //  validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange, //this has no effect
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: text,
      ),
    );

Widget designedFormField({
  fontColor,
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  required String? label,
  required IconData? prefixIcon,
  IconData? suffixIcon,
  onSubmit,
  onChange,
  onTap,
  required validator,
  function,
}) =>
    TextFormField(
      style: TextStyle(
        color: fontColor ?? Colors.black,
      ),
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: fontColor ?? Colors.black,
        ),
        labelStyle: TextStyle(
          color: fontColor ?? Colors.black,
        ),
        hintStyle: TextStyle(
          color: fontColor ?? Colors.black,
        ),
        focusedBorder: const UnderlineInputBorder(),
        /*OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
        ),*/
        enabledBorder: const UnderlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: fontColor ?? Colors.black,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: fontColor ?? Colors.black,
          ),
          onPressed: function,
        )
            : null,
        border: const UnderlineInputBorder(), /*const OutlineInputBorder(),*/
      ),
    );

Widget buildTaskItem(Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: (Row(
    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
          '${model['time']}',
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${model['date']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  )),
);
Widget buildArticleitem (article , context)=>InkWell(
onTap: () {
       navigateTo(context, webviewscreen(article['url']),);
       },
    child: Padding(

  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            image: DecorationImage(
              image: NetworkImage(
                '${article['urlToImage']}'),
                  fit: BoxFit.cover,
            )),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                 '${article['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
));
// Widget buildArticleItem(article, context) => InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => WebViewScreen(article['url'])),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[400],
  ),
);
Widget fullDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

// Widget articleBuilder(list, context, {isSearch = false}) => Conditional.single(
//       context: context,
//       conditionBuilder: (BuildContext context) => list.length > 0,
//       widgetBuilder: (BuildContext context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallbackBuilder: (BuildContext context) =>
//           isSearch ? Container() : Center(child: CircularProgressIndicator()),
//     );

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Widget articleBuilder(list,context ,{issearch=false})=> ConditionalBuilder (
    condition:  list.length >0 ,
    builder:(context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleitem(list[index],context) ,
      separatorBuilder: (context,index)=>myDivider(),
      itemCount: 10,
    ),
    fallback: ( context) => issearch ? Container():Center(child: CircularProgressIndicator(),)
);
// Widget buildListProduct(model, BuildContext context) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(
//                   image: NetworkImage('${model.image}'),
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//                 if (model.discount != 0)
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     color: Colors.red,
//                     child: Text(
//                       'DISCOUNT',
//                       style: TextStyle(
//                         fontSize: 8,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model.name}',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       height: 1.3,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         '${model.price.round()}',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: defaultColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       if (model.discount != 0)
//                         Text(
//                           '${model.oldPrice.round()}',
//                           style: TextStyle(
//                             decoration: TextDecoration.lineThrough,
//                             fontSize: 10,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           ShopCubit.get(context)
//                               .changeFavorites(productId: model.id);
//                         },
//                         icon: CircleAvatar(
//                           radius: 15,
//                           backgroundColor:
//                               ShopCubit.get(context).favorites[model.id]!
//                                   ? defaultColor
//                                   : Colors.grey,
//                           child: Icon(
//                             Icons.favorite_border,
//                             size: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

// AppBar defaultAppBar({
//   required BuildContext context,
//   String? title,
//   List<Widget>? actions,
// }) =>
//     AppBar(
//       title: Text(
//         title!,
//       ),
//       titleSpacing: 5,
//       actions: actions,
//       leading: IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: Icon(
//           IconBroken.Arrow___Left_2,
//         ),
//       ),
//     );


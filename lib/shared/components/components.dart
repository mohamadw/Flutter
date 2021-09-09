 import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';
//
// MyBottomNavigationBar(context) {
//   var cubit = CubitNewsLayout.get(context);
//
//   return BottomNavigationBar(
//     currentIndex: cubit.navigator_bar_index,
//     onTap: (index) {
//       cubit.ChangeNavigatorBar(index);
//
//     },
//     items: [
//       BottomNavigationBarItem(
//           icon: Icon(Icons.sports_basketball), label: 'sports'),
//       BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
//       BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
//     ],
//   );
// }
//
// Widget buildArticleItem(Map article,context) {
//   return InkWell(
//     onTap: (){
//       //navigateTo(context, WebViewScreen(article['url']));
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 120,
//             width: 120,
//             decoration: BoxDecoration(
//               color: Colors.deepOrangeAccent,
//               image: DecorationImage(
//                 fit:BoxFit.cover,
//
//                 image: NetworkImage(
//                   article['urlToImage'] != null?
//                   article['urlToImage']: "https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg",
//                 ),
//               ),
//               borderRadius:BorderRadius.circular(10),
//             ),
//
//           ),
//           SizedBox(width: 20),
//           Expanded(
//             child: Container(
//               child: Column(
//
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${article['title']}',
//                     style: Theme.of(context).textTheme.bodyText1,
//                     maxLines: 3,
//                     overflow:TextOverflow.ellipsis,
//
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15.0,
//                     ),
//                     overflow:TextOverflow.ellipsis,
//
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     ),
//   );
// }
// Widget buildArticlePage(list){
//   return list.length> 0?
//   ListView.separated(
//       physics: BouncingScrollPhysics(),
//       itemBuilder:(context,index)=> buildArticleItem(list[index],context),
//       separatorBuilder: (context,index)=> Container(
//         height: 1,
//         width: double.infinity,
//         color: Colors.grey[300],
//       ),
//       itemCount: 10):
//   Center(child: CircularProgressIndicator());
// }
//
//
//

 Widget defaultButton({
   double width = double.infinity,
   required Color background ,
   bool isUpperCase = true,
   double radius = 3.0,
   required Function() function,
   required String text,
 }) =>
     Container(
       width: width,
       height: 50.0,
       child: MaterialButton(
         onPressed: function,
         child: Text(
           isUpperCase ? text.toUpperCase() : text,
           style: TextStyle(
             color: Colors.white,
           ),
         ),
       ),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(
           radius,
         ),
         color: background,
       ),
     );
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


 void navigateAndFinish(
     context,
     widget,
     ) =>
     Navigator.pushAndRemoveUntil(
       context,
       MaterialPageRoute(
         builder: (context) => widget,
       ),
           (route)
       {
         return false;
       },
     );
//
//
Widget DefaultTextForm({
  required TextEditingController controller,
  required String labelText,
  required String? Function(String?)? validate,
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  bool enabled = true,
  Function()?  functionOnTap ,
  Function(String)? functionOnSubmit,
  Function(String)? functionOnchange,
}) =>
    TextFormField(
      controller: controller,
      onChanged: functionOnchange,
      onFieldSubmitted: functionOnSubmit,
      onTap: functionOnTap,
      validator: validate,
      obscureText: obscureText,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: secondry_color,
            width: 2.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: primary_color,
          ),
        ),
        enabled: enabled,
      ),
    );


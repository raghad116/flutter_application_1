import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';

Widget BusinessItem(list, context) => InkWell(
      onTap: () {
        print('hello');
      },
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.91-img.com/gallery_images_uploads/3/d/3df5ca6a9b470f715b085991144a5b76e70da975.JPG?tr=h-550,w-0,c-at_max'))),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text(
                        '${list['title']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${list['publishedAt']}'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget articalItem(lis, context) => ConditionalBuilder(
    condition: lis.length > 0,
    // condition: state is! NewsSportsgetLoading,
    builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  BusinessItem(lis[index], context),
              separatorBuilder: ((context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black38,
                  )),
              itemCount: lis.length),
        ),
    fallback: (context) => Center(child: CircularProgressIndicator()));

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  Function(String)? onFieldSubmitted,
  Function? f,
  required String label,
  required IconData icon,
  IconData? icon1,
  bool obscure = false,
  Function? suffixPressed,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      obscureText: obscure,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: (v) {
        f!(v);
      },
      validator: validate,
      onTap: onTap,

      decoration: InputDecoration(
          labelText: (label),
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(icon1)),
          border: OutlineInputBorder()),

// keyboardType: TextInputType.phone,
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));

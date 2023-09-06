
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocks/watched_films_blocks.dart';

class WatchedFilms extends StatelessWidget {
  const WatchedFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserWatchedFilmsCubit>();
    return StreamBuilder<UserWatchedFilmsState>(
        initialData: cubit.state,
        stream: cubit.stream,
        builder: (context, snapshot) {
          var watchedFilms = snapshot.data?.currentUserWatchedFilms.currentFilms;

          // return Text(stageFilms!.first.title, style: TextStyle(color:Colors.white),);
          //Text(watchedFilms!.first.title, style: TextStyle(color: Colors.white));

          return
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16),
              child: Column(

                children: [
                  Container(alignment: Alignment.centerLeft,

                      height:45,
                      child: Text("Продолжить просмотр", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)),
                  SizedBox(height: 10,),

                  Container(
                    alignment: Alignment.topLeft,
                    height: 208,
                    //color: Colors.purple,
                    child:
                    ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8,),
                      scrollDirection: Axis.horizontal,
                      itemCount: watchedFilms!.length,
                      itemBuilder: (BuildContext context, int index) {

                        return

                          Container(
                            width: 226,

                            child: Column(


                              crossAxisAlignment: CrossAxisAlignment.start,


                              children: [

                                Stack(
                                    children: [
                                      Container(
                                          height: 140,
                                          //height: 128,
                                          width: 226,
                                          //width: 210,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20),),
                                          clipBehavior: Clip.hardEdge,


                                          child:


                                          FittedBox(
                                            fit: BoxFit.cover,
                                            //fit: BoxFit.cover,

                                            child:
                                            GestureDetector(
                                              onTap: () {


                                              },
                                              child:
                                              watchedFilms![index].poster!=''?
                                              Image(
                                                  image: AssetImage(
                                                      watchedFilms![index].poster)
                                              )
                                                  :SizedBox(),


/*
                                                   Image(
                                                       image: AssetImage(widget.user.pictures[position])
                                                   ),

*/


                                            ),
                                          )
                                      ),
                                      Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 44,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius
                                                    .circular(6)),
                                            child: Text(watchedFilms![index].stateSpot, style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12)),
                                          )

                                      )
                                    ]
                                ),


                                Container(
                                    height: 18,
                                    alignment: Alignment.centerLeft,
                                    child:
                                    Container(
                                        height: 4,
                                        alignment: Alignment.centerLeft,


                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: Color(0xFF4b4b4b),),
                                        child: Container(
                                          height: 4,
                                          width: 100,

                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  2), gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xFF6814cc),
                                              Color(0xFF2871fa),
                                            ],
                                          )


                                          ),


                                        )
                                    )
                                ),
                                Text(watchedFilms![index].title, style: TextStyle(fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                                Text('${watchedFilms![index].seasonId} сезон ${watchedFilms![index].episodeId} серия', style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                                /* WatchedFilms(),*/

                              ],
                            ),
                          );

                        //container for 1 episode

                      },


                    ),

                    //container for 1 episode
                  )

                ],
              ),

            );





        });
  }
}
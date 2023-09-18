import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/blocks/stage_films_blocks.dart';

class FilmsStage extends StatefulWidget {
  FilmsStage({Key? key}) : super(key: key);

  @override
  State<FilmsStage> createState() => _FilmsStageState();
}

class _FilmsStageState extends State<FilmsStage> {
  PageController controller = PageController();
  int positionImage = 0;

  @override
  Widget build(BuildContext context) {
    var pictureContainerWidth = MediaQuery.of(context).size.width;
    final cubit = context.read<UserStageFilmsCubit>();

    List<Widget> indicator = [];

    List<Widget> showIndicator(int positionImage) {
      if(cubit.state.currentUserStageFilms.stageFilms.length!=1){
      for (var i = 0;
          i < cubit.state.currentUserStageFilms.stageFilms.length;
          i++) {
        if (i == positionImage) {
          indicator.add(Container(
            height: 9,
            width: 9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9), color: Colors.purple),
            // decoration: BoxDecoration( borderRadius: BorderRadius.circular(9), color: Colors.purple),
          ));
        } else {
          indicator.add(Container(
            height: 9,
            width: 9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xD54D4D4D)),
            // decoration: BoxDecoration( borderRadius: BorderRadius.circular(9), color: Colors.purple),
          ));
        }
      }}
      return indicator;
    }

    return StreamBuilder<UserStageFilmsState>(
        initialData: cubit.state,
        stream: cubit.stream,
        builder: (context, snapshot) {
          var stageFilms = snapshot.data?.currentUserStageFilms.stageFilms;
          // return Text(stageFilms!.first.title, style: TextStyle(color:Colors.white),);
          return
            Container(
              width: pictureContainerWidth,
              height: 509,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          //physics: const BouncingScrollPhysics(),
                          itemCount: stageFilms!.length,

                          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                          /// Use [Axis.vertical] to scroll vertically.
                          controller: controller,
                          onPageChanged: (int index) {
                            setState(() {
                              positionImage = index;
                              // print(index);
                            });
                          },

                          //pageSnapping: false,

                          itemBuilder: (BuildContext context, int position) {
                            //print(positionImage);

                            return Stack(children: [
                              Center(
                                child: Container(
                                    height: 488,
                                    width: pictureContainerWidth,
                                    decoration: BoxDecoration(

                                        //    borderRadius: const BorderRadius.all(Radius.circular(10)),

                                        ),
                                    clipBehavior: Clip.hardEdge,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      //fit: BoxFit.cover,

                                      child: GestureDetector(
                                        onTap: () {},
                                        child: stageFilms![position].poster !=
                                                ''
                                            ? Image(
                                                image: AssetImage(
                                                    stageFilms![position]
                                                        .poster))
                                            /*CachedNetworkImage(
                                            imageUrl: stageFilms!.first.poster,
                                            fit: BoxFit.cover
                                        )*/
                                            : SizedBox(),
                                      ),
                                    )),
                              ),
                              Positioned(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 426,
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      alignment: Alignment.center,
                                      child: Text(
                                          textAlign: TextAlign.center,
                                          stageFilms![position].description,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))),
                                ],
                              ))
                            ]);
                          })),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 9,
                          width: 51,
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: showIndicator(positionImage)

                            ,
                          ),
                        ),
                      ))
                ],
              ));
        });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'constants.dart';

import 'drawer.dart';
import 'ticket.dart';

class MovieDetails extends StatefulWidget {
  final movieVF;
  final movieName;
  final movieImage;

  MovieDetails(this.movieVF, this.movieName, this.movieImage);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {



  final url = 'https://www.youtube.com/watch?v=gRbG2tjHYCA';
  YoutubePlayerController? _controller;
  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false
      )
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: BuildDrawer(),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.movieImage),
                    height: size.height / 5,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: size.height - size.height * 0.28,
                    color: kFirstColor,
                  ),
                ],
              ),
              Positioned(
                top: size.height / 7,
                child: Container(
                  width: size.width,
                  height: 7 * size.height / 8,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(50)),
                    color: kFirstColor,
                  ),
                ),
              ),
              Positioned(
                left: size.width / 8,
                top: size.height / 15,
                height: size.height / 5,
                width: size.width / 4,
                child: Image(
                  image: AssetImage(widget.movieImage),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 2 * size.width / 5,
                top: size.height / 10,
                child: Container(
                  constraints: BoxConstraints(minWidth: 3*size.width/9, maxWidth: 5*size.width/9),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: kFirstColor,
                  ),
                  child: Text(
                    widget.movieName,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: customTextStyle1,
                  ),
                ),
              ),
              Positioned(
                top: 2.5 * size.height / 9,
                height: 5* size.height / 8,
                width: size.width,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: kFirstColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Director :     ',style: customTextStyle2,children: [TextSpan(text: 'Todd Phillips',style: customTextStyle3,),])),
                      SizedBox(height: size.height/50),
                      RichText(maxLines:2,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Writers :     ',style: customTextStyle2,children: [TextSpan(text: 'Todd Phillips (screenplay)...',style: customTextStyle3,),])),
                      SizedBox(height: size.height/50),
                      RichText(maxLines:3,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Stars :     ',style: customTextStyle2,children: [TextSpan(text: 'Todd  Joaquin Phoenix, Zazie...',style: customTextStyle3,),])),
                      SizedBox(height: size.height/50),
                      RichText(maxLines:1,overflow: TextOverflow.ellipsis, text: TextSpan(text: 'Release Date :     ',style: customTextStyle2,children: [TextSpan(text: '4 October 2019 (UK)',style: customTextStyle3,),])),
                      SizedBox(height: size.height/50),
                      Text('Peter Parker and his friends go on summer vacation to Europe, where Peter finds himself trying to save his friends from the hands of a villain known as Mysterio.',maxLines:5,overflow: TextOverflow.ellipsis,style: customTextStyle3,),
                      SizedBox(height: size.height/50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: ()=>showDialog(
                              useSafeArea: true,
                              barrierColor: Colors.black87,
                              context: context,
                              builder: (BuildContext context) {
                                return YoutubePlayerBuilder(
                                  player: YoutubePlayer(
                                    controller: _controller!,
                                  ),
                                  builder: (context,player){
                                    return AlertDialog(
                                      buttonPadding: EdgeInsets.zero,
                                      actionsPadding: const EdgeInsets.all(0),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),
                                      backgroundColor: kFirstColor,
                                      title: Center(
                                        child: Text(
                                            widget.movieName,
                                          style: customTextStyle1,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      content: _controller!=null ? player : Center(child: CircularProgressIndicator(backgroundColor: kSecondColor,color: Colors.red,),),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: Text(
                                            'Close',
                                            style: customTextStyle2,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            child: Center(child: Container(padding: const EdgeInsets.all(0),child: ListTile(title: Text('Trailer',style: customTextStyle1,),trailing: const Icon(Icons.videocam_outlined,size: 25.0,),),width: size.width/2.5,decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black87,width: 2.0)
                            ),)),
                          ),
                          InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Ticket(widget.movieName))),
                            child: Center(child: Container(padding: const EdgeInsets.all(0),child: ListTile(title: Text('Reservation',style: customTextStyle1)),width: size.width/2.5,decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10),),
                                border: Border.all(color: Colors.black87,width: 2.0)
                            ),)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
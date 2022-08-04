import 'package:flutter/material.dart';
import 'package:tiffin/Onboarding_controller.dart';
import 'package:tiffin/Onboarding_Info.dart';
import 'package:get/state_manager.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = OnboardingController();
  bool isLastPage=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
      child:Stack(
        children:[
          PageView.builder(
              controller: _controller.pageController,
          onPageChanged: _controller.selecetedPageIndex,
          itemCount: _controller.onboardingPages.length,
          itemBuilder: (context,index){
            if(index%2==0){return Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                  Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(_controller.onboardingPages[index].title,
                      style:TextStyle(
                        fontSize:28,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(235,71,73,1.0),
                      ), ),),),



                    SizedBox(height: 15,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                       child: Text(_controller.onboardingPages[index].description,
                       style:TextStyle(
                        fontSize:16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(121,121,121,1.0),
                      ),),)
                    ,
                    SizedBox(height: 20,),
                    Image.asset(_controller.onboardingPages[index].imageAsset,
                        width: 600),
                  ]

              ),
            );}
          else{
              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onboardingPages[index].imageAsset,
                          width: 600),

                      SizedBox(height: 20,),

                      Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child:Text(_controller.onboardingPages[index].title,
                        style:TextStyle(
                          fontSize:28,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(235,71,73,1.0),

                        ), ),),),
                      SizedBox(height: 15,),
                         Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(_controller.onboardingPages[index].description,
                        style:TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(121,121,121,1.0),
                        ),),),]

                ),
              );

            }}
      ),
           isLastPage? Container(
               child:Positioned(
                 bottom: 30,
                 left: 20,
                 child: Row(
                 children: List.generate(_controller.onboardingPages.length, (index) =>
                    Obx(() {
                      return Container(
                        margin: EdgeInsets.all(4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _controller.selecetedPageIndex.value == index
                              ? Color.fromRGBO(235, 71, 73, 1.0)
                              : Color.fromRGBO(200, 200, 200, 1.0),
                          shape: BoxShape.circle,
                        ),);
                    }),
                ),),),) :Container(child: Text('heeeelooooooooooooooo')),
          Positioned(
                 right: 20,
                 bottom: 15,
                 child: FloatingActionButton(
                   elevation: 1,
                   child: Icon(Icons.navigate_next,color: Colors.white,),
                   onPressed: _controller.forwardAction,
                 backgroundColor: Color.fromRGBO(235,71,73,1.0),

                 ),
              ),
        ],
      ),

      )
      );

  }
}



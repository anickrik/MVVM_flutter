import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/response/status.dart';
import '../../../../res/constrains/app_url.dart';
import '../../../../view_model/home_view_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, value, _){
          switch(value.moviesList.status){
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              return Center(
                child: Text(value.moviesList.message.toString()),
              );
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.moviesList.data!.results?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: /*isPlatformWeb ? double.infinity * 0.5 : */double.infinity,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Image.network("${AppUrl.photoBaseUrl}${value.moviesList.data!.results![index].posterPath.toString()}", fit: BoxFit.cover,),
                          ),
                          const SizedBox(height: 10,),
                          Text(value.moviesList.data!.results![index].title.toString(), style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20
                          ),),
                          const SizedBox(height: 10,),
                          Text(value.moviesList.data!.results![index].overview.toString(),style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  );
                },);
            default:
              return const Center(
                child: Text("default case"),
              );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    // print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            //tarjetas principales
            CardSwiper(
                movies:
                    moviesProvider.onDisplayMovies), // importacion de widgts

            // Slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares!!!',
              onNextPage: () => moviesProvider.getPopularMovies(),
            )
          ],
        )));
  }
}

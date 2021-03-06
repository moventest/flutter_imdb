import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/models/movie.model.dart';
import 'package:flutter_imdb/services/tmdb.dart';
import 'package:flutter_imdb/widgets/poster.widget.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onPressed;

  MovieCard({this.movie, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => this.onPressed(),
        child: Card(
            child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Poster(
                        image: this.movie.posterPath,
                        small: true,
                      ),
                      Expanded(
                          child: Container(
                              padding: new EdgeInsets.only(left: 8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(this.movie.title),
                                    Text(tmdbService.getGenresFromIds(this.movie.genreIds) + ' - ' +  (this.movie.release != null
                                        ? DateFormat('dd/MM/yyyy')
                                            .format(this.movie.release)
                                        : ''))
                                  ]))),
                      Text(this.movie.voteAverage.toString())
                    ]))));
  }
}

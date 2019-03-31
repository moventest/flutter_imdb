import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imdb/blocs/bloc_provider.dart';
import 'package:flutter_imdb/blocs/detail_bloc.dart';
import 'package:flutter_imdb/models/movie.dart';
import 'package:flutter_imdb/widgets/poster.dart';

class DetailPage extends StatelessWidget {
  final int movieId;

  DetailPage({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Detail(movieId: this.movieId);
  }
}

class Detail extends StatefulWidget {
  final int movieId;

  Detail({@required this.movieId});

  @override
  State<StatefulWidget> createState() => DetailState(movieId: this.movieId);
}

class DetailState extends State<Detail> {
  DetailBloc _detailBloc;
  final int movieId;

  DetailState({@required this.movieId});

  @override
  void initState() {
    super.initState();
    _detailBloc = DetailBloc(this.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _detailBloc,
        child: StreamBuilder<MovieModel>(
            stream: _detailBloc.movieDetail,
            builder:
                (BuildContext context, AsyncSnapshot<MovieModel> snapshot) {
              if (snapshot.hasData) {
                return Poster(
                  image: snapshot.data.posterSmall,
                  small: true,
                );
              } else {
                return Container();
              }
            }));
  }
}

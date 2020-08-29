import 'package:equatable/equatable.dart';

class Good extends Equatable {
  final double shares;
  final Impact impact;

  Good({
    this.shares,
    this.impact,
  });

  @override
  List<Object> get props => [shares, impact];
}

class Impact extends Equatable {
  final double acres;
  final int trees;
  final int animals;

  Impact({
    this.acres,
    this.trees,
    this.animals,
  });

  @override
  List<Object> get props => [acres, trees, animals];
}

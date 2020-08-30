import 'package:equatable/equatable.dart';

class Good extends Equatable {
  final Impact impact;
  final double shares;

  Good({
    this.impact,
    this.shares,
  });

  @override
  List<Object> get props => [impact, shares];
}

class Impact extends Equatable {
  final double acres;
  final int animals;
  final int trees;

  Impact({
    this.acres,
    this.animals,
    this.trees,
  });

  @override
  List<Object> get props => [acres, animals, trees];
}

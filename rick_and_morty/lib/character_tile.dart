import 'package:flutter/material.dart';
import 'package:rick_and_morty/models.dart';

abstract class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}

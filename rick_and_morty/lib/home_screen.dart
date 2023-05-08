import 'package:flutter/material.dart';
import 'package:rick_and_morty/models.dart';

abstract class CharacterTile extends StatelessWidget {
  const CharacterTile({required this.character, Key? key}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Text(character.name);
  }
}

class ConcreteCharacterTile extends CharacterTile {
  const ConcreteCharacterTile({required Character character, Key? key})
      : super(character: character, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(character.img),
          Text(character.name),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<Character>> fetchBbCharacters() async {
    bool datosDisponibles = false;

    if (!datosDisponibles) {
      throw Exception('No se encontraron datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: FutureBuilder<List<Character>>(
        future: fetchBbCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ConcreteCharacterTile(character: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

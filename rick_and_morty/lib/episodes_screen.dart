import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EpisodesScreen extends StatelessWidget {
  final int id;

  const EpisodesScreen({required this.id});

  Future<List<dynamic>> fetchEpisodes(int id) async {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/$id'));
    if (response.statusCode == 200) {
      final character = jsonDecode(response.body);
      final episodeUrls = character['episode'].cast<String>();
      final episodeFutures = episodeUrls.map((url) => http.get(Uri.parse(url)));
      final episodeResponses = await Future.wait(episodeFutures);
      final episodes =
          episodeResponses.map((response) => jsonDecode(response.body));
      return episodes.toList();
    } else {
      throw Exception('Failed to fetch episodes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchEpisodes(id),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final episode = snapshot.data![index];
                return ListTile(
                  title: Text(episode['name']),
                );
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

class CharacterTile extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;

  const CharacterTile(
      {required this.id, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodesScreen(id: id),
          ),
        );
      },
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(name),
      ),
    );
  }
}

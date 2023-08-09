import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Song extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
  });

  Song copyWith({
    String? id,
    String? title,
    String? artist,
    String? album,
    String? coverUrl,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      coverUrl: coverUrl ?? this.coverUrl,
    );
  }

  @override
  List<Object> get props => [id, title, artist, album, coverUrl];

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      album: json['album'] ?? '',
      coverUrl: json['coverUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'artist': artist,
        'album': album,
        'coverUrl': coverUrl,
      };

  static List<Song> sampleData = [
    Song(
      id: Uuid().v4(),
      title: 'Shape of You',
      artist: 'Ed Sheeran',
      album: 'Divide',
      coverUrl: 'https://source.unsplash.com/random/?music',
    ),
    Song(
      id: Uuid().v4(),
      title: 'Bad Guy',
      artist: 'Billie Eilish',
      album: 'When We All Fall Asleep, Where Do We Go?',
      coverUrl: 'https://source.unsplash.com/random/?music',
    ),
    Song(
      id: Uuid().v4(),
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      album: 'After Hours',
      coverUrl: 'https://source.unsplash.com/random/?music',
    ),
  ];
}
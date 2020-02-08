import 'package:flutter/material.dart';
import 'package:playlist/components/header.dart';
import 'package:playlist/components/music-card.dart';
import 'package:playlist/components/music-type.dart';
import 'package:playlist/mocks.dart';
import 'package:playlist/models/song.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMusicType = 'Fav';

  onMusicTypePress(musicType) {
    setState(() {
      selectedMusicType = musicType;
    });
  }

  Widget renderMusicTypes() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedMusicType == genres[index];

        return MusicType(
          title: genres[index],
          isSelected: isSelected,
          onPress: onMusicTypePress,
        );
      },
    );
  }

  Widget renderMusics() {
    return ListView.builder(
      itemCount: songsObj[selectedMusicType].length,
      itemBuilder: (contex, index) {
        Song currentSong = songsObj[selectedMusicType][index];
        bool isPlaying = index == 0;

        return MusicCard(
          name: currentSong.title,
          singer: currentSong.singer,
          isPlaying: isPlaying,
        );
      },
    );
  }

  Widget renderBottomTab() {
    return BottomNavigationBar(
      currentIndex: 2,
      backgroundColor: Color.fromRGBO(255, 64, 96, 1),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.3),
      selectedItemColor: Colors.white,
      iconSize: 25,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          title: Text('Browse'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          title: Text('All tracks'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('Playlists'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Header(
              title: 'Playlist',
            ),
            Container(
              height: 120,
              child: renderMusicTypes(),
            ),
            Expanded(
              child: renderMusics(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: renderBottomTab(),
    );
  }
}

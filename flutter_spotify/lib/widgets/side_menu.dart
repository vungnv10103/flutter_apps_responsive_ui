import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            title: "Home",
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            title: "Search",
            onTap: () {
              print("Search");
            },
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: "Raido",
            onTap: () {
              print("Raido");
            },
          ),
          const SizedBox(height: 12.0),
          _LibraryPlaylists()
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  @override
  State<_LibraryPlaylists> createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<_LibraryPlaylists> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    "YOUR LIBRARY",
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    "PLAYLISTS",
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

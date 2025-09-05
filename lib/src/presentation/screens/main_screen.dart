import 'package:awesome_ayaflix/src/presentation/screens/favorites_screen.dart';
import 'package:awesome_ayaflix/src/presentation/screens/movies_screen/movies_screen.dart';
import 'package:awesome_ayaflix/src/presentation/screens/movies_screen/widgets/movie_screen_appbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<MoviesScreenState> _moviesScreenKey = GlobalKey();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    if (_selectedIndex == 0) {
      return MovieSearchAppBar(_moviesScreenKey.currentState?.scrollController);
    } else {
      return AppBar(title: const Text('Favorites'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          MoviesScreen(key: _moviesScreenKey),
          const FavoritesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

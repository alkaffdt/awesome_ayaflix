import 'package:awesome_ayaflix/src/presentation/providers/movie_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSearchAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const MovieSearchAppBar(this.scrollController, {super.key});

  final ScrollController? scrollController;

  @override
  ConsumerState<MovieSearchAppBar> createState() => _MovieSearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}

class _MovieSearchAppBarState extends ConsumerState<MovieSearchAppBar> {
  bool _showSearch = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 8, top: 16),
        child: _showSearch
            ? TextField(
                focusNode: _focusNode,
                controller: _controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (query) {
                  if (widget.scrollController != null) {
                    widget.scrollController?.animateTo(
                      widget.scrollController!.position.minScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }

                  ref.read(searchQueryProvider.notifier).setQuery(query);
                },
              )
            : Text(
                "Ayaflix",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      actionsPadding: const EdgeInsets.only(top: 16),
      actions: [
        IconButton(
          icon: Icon(_showSearch ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              _showSearch = !_showSearch;
              if (_showSearch) {
                _focusNode.requestFocus();
              } else {
                _controller.clear();
                FocusScope.of(context).unfocus();
              }
            });
          },
        ),
      ],
    );
  }
}

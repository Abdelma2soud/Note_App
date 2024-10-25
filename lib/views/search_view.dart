import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

class NoteSearchPage extends StatefulWidget {
  final List<NoteModel> notes;

  const NoteSearchPage({super.key, required this.notes});

  @override
  // ignore: library_private_types_in_public_api
  _NoteSearchPageState createState() => _NoteSearchPageState();
}

class _NoteSearchPageState extends State<NoteSearchPage> {
  List<NoteModel> _filteredNotes = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredNotes = widget.notes; // Initially show all notes
  }

  void _filterNotes(String query) {
    setState(() {
      _searchQuery = query;
      if (_searchQuery.isEmpty) {
        _filteredNotes =
            widget.notes; // Show all notes if search query is empty
      } else {
        _filteredNotes = widget.notes
            .where((note) =>
                note.title.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList(); // Filter notes based on title
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) =>
                  _filterNotes(query), // Update the search query
            ),
          ),
          Expanded(
            child: _filteredNotes.isEmpty
                ? const Center(child: Text('No notes found'))
                : ListView.builder(
                    itemCount: _filteredNotes.length,
                    itemBuilder: (context, index) {
                      final note = _filteredNotes[index];
                      return ListTile(
                        title: Text(note.title),
                        subtitle: Text(
                            note.subtitle), // Assuming 'content' is a field
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

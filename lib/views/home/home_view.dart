import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:projekt_1_ekrany_logowania/views/database/notes_database.dart';
import 'package:projekt_1_ekrany_logowania/views/login/login_view.dart';
import 'package:projekt_1_ekrany_logowania/views/model/note.dart';
import 'package:projekt_1_ekrany_logowania/views/notes_pages/edit_note_page.dart';
import 'package:projekt_1_ekrany_logowania/views/notes_pages/note_detail_page.dart';
import 'package:projekt_1_ekrany_logowania/views/widgets/note_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

    @override
    State<HomeView> createState() => _HomeViewState();
  }

  class _HomeViewState extends State<HomeView> {
    late List<Note> notes;
    bool isLoading = false;

    @override
    void initState() {
      super.initState();

      refreshNotes();
    }

    @override
    void dispose() {
      super.dispose();
    }

    Future refreshNotes() async {
      setState(() => isLoading = true);
      this.notes = await NotesDatabase.instance.readAllNotes();
      setState(() => isLoading = false);
    }

    Future<void> logout() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginView()), (route) => false);
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey.shade900,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'Notes',
                style: TextStyle(fontSize: 24),
              ),
              actions: [
                IconButton(
                  onPressed: logout,
                    icon: const Icon(Icons.logout),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            body: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : notes.isEmpty
                  ? const Text(
                'No Notes',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
                  : buildNotes(),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AddEditNotePage()),
                );
                refreshNotes();
              },
            ),
          ),
        );
    }

    Widget buildNotes() => StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8),
          itemCount: notes.length,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            final note = notes[index];

            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NoteDetailPage(noteId: note.id!),
                ));

                refreshNotes();
              },
              child: NoteCardWidget(note: note, index: index),
            );
          },
    );

}





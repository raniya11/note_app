import 'package:note_app/features/user/model/note_model.dart';
import 'package:note_app/features/user/viewmodels/note_viewmodel.dart';

class NoteService{
  NoteViewModel noteViewModel = NoteViewModel();
  Future addNote(NoteModel note)async{
    final notedata = NoteModel().toMap(note);
    noteViewModel.addNotes(notedata);
  }

  Future deleteNote(NoteModel note)async{
    final notedata = NoteModel().toMap(note);
    noteViewModel.deletenote(notedata);
  }
}
import 'package:flutter/material.dart';

import '../model/note_model.dart';

class NoteViewModel extends ChangeNotifier{
  List<NoteModel>_notes =[];
  List<NoteModel> get notes=>_notes;

  Future addNotes(NoteModel note) async{
    _notes.add(note);
    notifyListeners();
    print(_notes);
  }

  Future<void> deletenote(NoteModel note)async{
    _notes.remove(note);
    notifyListeners();
    print(_notes);
  }

}
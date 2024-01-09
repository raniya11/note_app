class NoteModel{
  final String? id;
  final String?title;
  final String? content;
  final DateTime? createdAt;
  final int? status;

  NoteModel({this.id,this.status,this.content,this.createdAt,this.title});

  factory NoteModel.fromJson(Map<String,dynamic>json){
    return NoteModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createdAt: json['createdAt'],
        status: json['status']

    );
  }

  toMap(NoteModel note){
    return {
      'id':note.id,
      'title':note.title,
      'content':note.content,
      'createdAt':note.createdAt,
      'status':note.status
    };
  }
}
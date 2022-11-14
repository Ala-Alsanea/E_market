// ignore_for_file: non_constant_identifier_names

class PodcastModel {
  int id;
  String title;

  String author;
  String audio_path;
  String img_path;
  String audio_format;
  String description;
  String audio_length;
  String tags;
  String created_at;
  String updated_at;

  PodcastModel({
    this.id = 0,
    this.title = '',
    this.audio_format = '',
    this.audio_length = '',
    this.audio_path = '',
    this.author = '',
    this.created_at = '',
    this.description = '',
    this.img_path = '',
    this.updated_at = '',
    this.tags = '',
  });

  //
  PodcastModel.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        tags = json['tags'],
        audio_format = json['audio_format'],
        audio_length = json['audio_length'],
        audio_path = json['audio_path'],
        author = json['author'],
        img_path = json['img_path'],
        created_at = json['created_at'],
        description = json['description'],
        updated_at = json['updated_at'];
}

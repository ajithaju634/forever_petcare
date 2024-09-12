class Post{
  final int id;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.title,
    required this.body
  });
  factory Post.formjson(Map<String,dynamic>json){
    return Post(id: json["id"], title: json["title"] as String, body: json["body"] as String);
  }
}
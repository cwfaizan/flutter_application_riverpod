class Facts {
  final String id;
  final String text;
  final String source;
  final String sourceUrl;
  final String language;
  final String permalink;

  Facts({
    required this.id,
    required this.text,
    required this.source,
    required this.sourceUrl,
    required this.language,
    required this.permalink,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        id: json['id'],
        text: json['text'],
        source: json['source'],
        sourceUrl: json['source_url'],
        language: json['language'],
        permalink: json['permalink'],
      );
}

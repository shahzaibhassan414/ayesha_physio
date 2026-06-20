class BlogSection {
  const BlogSection({required this.heading, required this.paragraphs});

  final String heading;
  final List<String> paragraphs;
}

class BlogPost {
  const BlogPost({
    required this.title,
    required this.slug,
    required this.summary,
    required this.sections,
    required this.author,
    required this.publishedDate,
    required this.readingTime,
    required this.featuredImage,
    required this.category,
    required this.seoTitle,
    required this.seoDescription,
  });

  final String title;
  final String slug;
  final String summary;
  final List<BlogSection> sections;
  final String author;
  final DateTime publishedDate;
  final String readingTime;
  final String featuredImage;
  final String category;
  final String seoTitle;
  final String seoDescription;
}

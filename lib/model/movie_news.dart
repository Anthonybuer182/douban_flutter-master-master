/// 首页新闻 banner
class MovieNews {
  //标题
  String title;
  //图片
  String cover;
  //摘要
  String summary;
  //链接
  String link;

  MovieNews(this.title, this.cover, this.summary, this.link);
  //将返回的数据进行解析
  MovieNews.fromJson(Map data) {
    title = data['title'];
    summary = data['summary'];
    cover = data['cover'];
    link = data['link'];
  }
}
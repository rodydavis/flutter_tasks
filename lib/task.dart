class Task {
  final String title;
  final String subtitle;
  final String id;

  Task({this.title, this.subtitle, this.id});

  @override String toString() {
      return "$title, $subtitle => $id".toString();
    }
}
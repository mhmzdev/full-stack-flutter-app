class URLs {
  static String baseUrl({required bool isProd}) {
    if (isProd) {
      return "https://flutteram.com/api";
    }

    return "http://localhost:8080/api";
  }
}

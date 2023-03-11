class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment('baseUrl',
      defaultValue: 'https://jsonplaceholder.typicode.com');
}

class Endpoints {
  Endpoints._();

  static const base = "https://10.0.2.2";

  static const test = "https://scooby-test.idamobile.co";

  static const local = "http://10.0.2.2:3333";

  static const version = "/v1";

  static const baseUrl = local;

  // Auth

  static const auth = '/auth';

  static const signup = auth + '/signup';

  static const signin = auth + '/signin';

  // User

  static const user = '/users';

  static const me = user + '/me';
}

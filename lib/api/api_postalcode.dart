import 'package:dio/dio.dart';

getAddressFromAPI(String portalCode) async {
  String endpoint =
      'http://viacep.com.br/ws/${portalCode.replaceAll(".", "").replaceAll("-", "")}/json/';

  try {
    final Response response = await Dio().get<Map>(endpoint);

    if (response.data.containsKey('erro') && response.data['erro']) {}

    print(response.data);
  } on DioError catch (e) {
    print(e.message);
  }
}

import 'package:get/get.dart';

class EpisodeProvider extends GetConnect {
  Future<Response> getEpisode(String url) async => await get(
        url,
      );
}

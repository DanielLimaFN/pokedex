import 'package:get/get.dart';
import '../controllers/pokemon_controller.dart';
import '../services/api_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<PokemonController>(() => PokemonController(apiService: Get.find()));
  }
}

// barbershop_controller.dart
import 'package:get/get.dart';
import 'package:my_flutter_app/domain/barbershop_entity.dart';
import 'package:my_flutter_app/data/barbershop_repository_impl.dart';

class BarbershopController extends GetxController {
  // Utilizăm o listă observabilă pentru barbershops
  var barbershops = <Barbershop>[].obs;

  final BarbershopRepositoryImpl repository = BarbershopRepositoryImpl();

  @override
  void onInit() {
    super.onInit();
    loadBarbershops();
  }

  void loadBarbershops() async {
    try {
      final shops = await repository.getAllBarbershops();
      barbershops.assignAll(shops); // Actualizează lista observabilă
    } catch (e) {
      print("Error loading barbershops: $e");
    }
  }
}

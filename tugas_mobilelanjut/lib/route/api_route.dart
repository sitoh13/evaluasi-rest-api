import 'package:tugas_mobilelanjut/app/http/controllers/customers_controller.dart';
import 'package:tugas_mobilelanjut/app/http/controllers/vendors_controllers.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/home", customersController.show);
    Router.post("/ayam", customersController.create);
    Router.put("/aaa/{id}", customersController.update);
    Router.delete("/del/{id}", customersController.destroy);

    Router.get("/petani", vendorsControllers.show);
    
  
  }
}

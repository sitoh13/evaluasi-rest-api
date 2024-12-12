
import 'package:tugas_mobilelanjut/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorsControllers extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create() async {
          return Response.json({});
     }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(int id) async {
      try {
      final petani = await Vendors().query().get();

      return Response.json({
        "message": "petani",
        "data": petani,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "Data petani tidak ditemukan",
        "error": e.toString()
      }, 500);
    }
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }

     Future<Response> update(Request request,int id) async {
          return Response.json({});
     }

     Future<Response> destroy(int id) async {
          return Response.json({});
     }
}

final VendorsControllers vendorsControllers = VendorsControllers();


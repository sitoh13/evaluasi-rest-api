import 'package:tugas_mobilelanjut/app/models/customers.dart';
import 'package:vania/vania.dart';

class CustomersController extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create(Request request) async {
      try {
        final customer = request.input();

        await Customers().query().insert(customer);
      
          return Response.json(
          {
            'message': "data dari customer",
            'data': customer,
          }, 201
          );
     } catch (e) {
      return Response.json(
        {
          'message': "Data tidak terdeteksi server",
        },500
      );
     }
    }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(Request request) async {
      try {
        final customer = await Customers().query().get();

        return Response.json({
            "message": "informasi customer",
            "data": customer,
          },201
        );
      } catch (e) {
        return Response.json({
            "message": "Terjadi kesalahan, mohon coba beberapa saat lagi",
            "error" : e.toString()
          }, 500
        );
      }
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }


     Future<Response> update(Request request, int id) async {
      try {
        final body = await request.input();
        final name = body['cust_name'];
        final address = body['cust_address'];
        final city = body['cust_city'];
        final state = body['cust_state'];
        final zip = body['cust_zip'];
        final country = body['cust_country'];
        final telp = body['cust_telp'];

        final result = await Customers()
        .query()
        .where('cust_id', '=', id)
        .update(
          {
            "cust_name": name,
            "cust_address": address,
            "cust_city": city,
            "cust_state": state,
            "cust_zip": zip,
            "cust_country": country,
            "cust_telp": telp
          }
        );

        if (result > 0) {
          return Response.json(
            {
              'message': 'Customers berhasil diperbarui',
              'update_id': id,
            }, 200, 
          );
        } else {
          return Response.json(
            {
              'message': 'Data customers tidak ditemukannnn',
            }, 404, 
            );
        }

      } catch (e) {
        return Response.json(
          {
            'message': 'Data yang diupdate salah',
            'error': e.toString(),
          },500
        );
      }   
    }

     Future<Response> destroy(int id) async {
          try {
            await Customers().query().where('cust_id', '=', id).delete();

            return Response.json(
              {'message': 'data terhapus'}
            );
          } catch (e) {
            return Response.json(
             {
              'message': 'data gagal terhapus', 'error': e.toString()});
          }
    }
}

final CustomersController customersController = CustomersController();



import 'package:mimpedir/banco/tipo_DAO.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/pedir/banco/database_helper.dart';
import 'package:mimpedir/pedir/banco/usuario_dao.dart';
import '../tipo.dart';
import '../restaurante.dart';

class RestauranteDAO {

static Future<void> atualizar(int? cd, String? lat, String long, int? tipo) async
final db = await DatabaseHelper.getDatabase();
final resultado = await db.update('tb_restaurante',
{

'nm_restaurante':nome,
'latitude_restaurante': lat,
'longitude_restaurante': long,
'cd_tipo': tipo,
},

 


  static Future<Restaurante> listar(int? id) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_restaurante = ?',
        whereArgs: [cd]
    );

    return Restaurante(
      codigo: resultado.first['cd_restaurante'] as int,
      nome: resultado.first['nm_restaurante'] as String,
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      culinaria: await TipoDAO.Listar(resultado.first['cd_restaurante']as int) as Tipo
    );

  }

  static Future<void> excluir(Restaurante r) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.delete('tb_restaurante',
        where: 'cd_restaurante = ?',
        whereArgs: [r.codigo]
    );
  }

  static Future<List<Restaurante>> listarTodos() async {
    final db =  await DatabaseHelper.getDatabase();
    final resultado = db.delete('tb_restaurante',
        where: 'cd_usuario = ?',
        whereArgs: [UsuarioDAO.usuarioLogado.codigo]
    );
    return resultado.map((mapa){
      return Restaurante(
          codigo: mapa['cd_restaurante'] as int,
          nome: mapa['nm_restaurante'] as String
      );
    }).toList();
  }

  static Future<int> cadastrarRestaurante (
      String? nomeRestaurante,
      String? latitude,
      String? longitude,
      int? tipo
      ) async{
    final db = await DatabaseHelper.getDatabase();
    final dadosRestaurante = {
      'cd_tipo': tipo,
      'nm_restaurante': nomeRestaurante,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_usuario': UsuarioDAO.usuarioLogado.codigo
    };
    try{
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    } catch(e){
      print("Erro ao cadastrar restaurante: $e");
      return -1;
    }
  }



  static get static 

  static get nome => null;=> null;}

class DatabaseHelper {
  static Future getDatabase() async {}
}
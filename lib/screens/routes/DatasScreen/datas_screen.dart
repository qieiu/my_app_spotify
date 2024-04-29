import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/bottom_up_transition.dart';
import 'package:my_app/dto/data_screen.dart';
import 'package:my_app/endpoints/endpoints.dart';
import 'package:my_app/screens/routes/FormsScreen/form_screen.dart';
import 'package:my_app/services/data_services.dart';

class DatasScreen extends StatefulWidget {
  const DatasScreen({Key? key}) : super(key: key);

  @override
  _DatasScreenState createState() => _DatasScreenState();
}

class _DatasScreenState extends State<DatasScreen> {
  Future<List<Datas>>? _datas;

  // static Future<void> deleteDatas(int idDatas) async {
  //   final url = Uri.parse('${Endpoints.datas}/$idDatas');
  //   final response = await http.delete(url);
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to delete data');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _datas = DataService.fetchDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back), // Customize icon (optional)// Customize color (optional)
          onPressed: () {
            // Your custom back button functionality here
            Navigator.pushReplacementNamed(
                context, '/'); // Default back button behavior
            // You can add additional actions here (e.g., show confirmation dialog)
          },
        ),
      ),
      body: FutureBuilder<List<Datas>>(
        future: _datas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Column(children: [
                    Text('Name : ${item.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    const Divider()
                  ]),
                  subtitle: item.imageUrl != null
                      ? Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    fit: BoxFit.fitWidth,
                                    width: 350,
                                    Uri.parse(
                                            '${Endpoints.baseURLLive}/public/${item.imageUrl!}')
                                        .toString(),
                                    errorBuilder: (context, error,
                                            stackTrace) =>
                                        const Icon(Icons
                                            .error), // Display error icon if image fails to load
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                                // IconButton(
                                //     onPressed: () {}, icon: Icon(Icons.edit)),
                                // IconButton(
                                //     onPressed: () {
                                //       showDialog(
                                //           context: context,
                                //           builder: (BuildContext context) {
                                //             return AlertDialog(
                                //               title: Text('Konfirmasi'),
                                //               content: Text(
                                //                   'Apakah yakin ingin menghapus?'),
                                //               actions: <Widget>[
                                //                 TextButton(
                                //                   onPressed: () =>
                                //                       Navigator.pop(context),
                                //                   child: Text('Cancel'),
                                //                 ),
                                //                 TextButton(
                                //                   child: Text('Delete'),
                                //                   onPressed: () async {
                                //                     try {
                                //                       // int idDatas =
                                //                       //     data[index].idDatas;
                                //                       await deleteDatas(
                                //                           data[index].idDatas);
                                //                       ScaffoldMessenger.of(
                                //                               context)
                                //                           .showSnackBar(
                                //                         SnackBar(
                                //                           content: Text(
                                //                               'Delete Sucessfully'),
                                //                         ),
                                //                       );
                                //                     } catch (e) {
                                //                       print('Error: $e');
                                //                     }
                                //                   },
                                //                 )
                                //               ],
                                //             );
                                //           });
                                //     },
                                //     icon: Icon(Icons.delete))
                            //   ],
                            // )
                          ],
                        )
                      : null,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 54, 40, 176),
        tooltip: 'Increment',
        onPressed: () {
          // Navigator.pushNamed(context, '/form-screen');
          // BottomUpRoute(page: const FormScreen());
          Navigator.push(context, BottomUpRoute(page: const FormScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

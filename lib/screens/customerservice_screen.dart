import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/bottom_up_transition.dart';
import 'package:my_app/dto/custservice.dart';
//import 'package:my_app/dto/data_screen.dart';
// import 'package:karirku/dto/datas.dart';
import 'package:my_app/endpoints/endpoints.dart';
import 'package:my_app/screens/routes/FormsScreen/sc_form_screen.dart';
//import 'package:my_app/screens/routes/FormsScreen/form_screen.dart';
import 'package:my_app/services/data_services.dart';
import 'package:my_app/screens/routes/SecondScreen/editcust_screen.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({Key? key}) : super(key: key);

  @override
  _CustomerServiceScreenState createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  Future<List<Issues>>? _CustomerService;

  @override
  void initState() {
    super.initState();
    _CustomerService = DataService.fetchIssueNIM();
  }

  void showIsian(Issues item) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  Uri.parse(
                          '${Endpoints.baseURLLive}/public/${item.imageUrl!}') 
                      .toString(),
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                  // height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "nim: ${item.nim}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Title Issues: ${item.title}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Issues Description: ${item.description}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RatingBar(
                itemSize: 20,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.indigo,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.indigo,
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.indigo,
                  ),
                ),
                ignoreGestures: true,
                onRatingUpdate: (double rating) {},
                initialRating: item.rating.toDouble(),
              ),
              const SizedBox(height: 10),
              Text(
                "createdAt: ${item.createdAt}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // DataService.deleteIssues(item.idIssues.toString()); ilangin toString kalo make ID :)
                      // _deleteDatas(item.idIssues);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCustomer(
                                    issues: item, 
                                  )));
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteDatas(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to delete the data?"),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                await DataService.deleteIssuesNIM(id);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.indigo,
                    content: Text('Data has been deleted!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                setState(() {
                  _CustomerService = DataService.fetchIssueNIM();
                });
              } catch (error) {
                debugPrint('Unable to delete the data: $error');
              }
            },

            // sesuai in sama yang di api
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Service Isssues'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<Issues>>(
          future: _CustomerService,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return GestureDetector(
                    onTap: () {
                      showIsian(item);
                    },
                    child: Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    Uri.parse(
                                            '${Endpoints.baseURLLive}/public/${item.imageUrl!}') // ganti pake yang di api dlu
                                        .toString(),
                                  )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (item.title.length > 20)
                                    ? item.title.substring(0, 20) + '...'
                                    : item.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              RatingBar(
                                itemSize: 20,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.indigo,
                                  ),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.indigo,
                                  ),
                                  empty: const Icon(
                                    Icons.star_border,
                                    color: Colors.indigo,
                                  ),
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (double rating) {},
                                initialRating: item.rating.toDouble(),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                (item.description.length > 100)
                                    ? item.description.substring(0, 100) + '...'
                                    : item.description,
                                style: TextStyle(fontSize: 16),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteDatas(item.idIssues.toString());
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditCustomer(
                                                    issues: item,
                                                  )));
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        tooltip: 'Increment',
        onPressed: () {
          Navigator.pushReplacement(
              context, BottomUpRoute(page: const CustFormScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
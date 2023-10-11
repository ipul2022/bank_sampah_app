// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations

part of '../pages.dart';

class DetailRiwayat extends StatefulWidget {
  final String date;
  const DetailRiwayat({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  String? groupValue;
  String urlImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        title: const Text('Detail Riwayat',
            style: TextStyle(
                color: Color(0xFF001F29), fontWeight: FontWeight.w500)),
        leading: GestureDetector(
          onTap: () {
            context.go('/RiwayatScreen');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: BlocBuilder<DetalHistoryCubit, DetalHistoryState>(
        builder: (context, state) {
          if (state is DetalHistoryIsSuccess) {
            urlImage = state.data.image;
            final data = state.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Alamat Penjemputan",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, top: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFFA7ABB3),
                          ),
                          Text(
                            "${data.pickup_address}",
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Tanggal Penjemputan",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, top: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.date_range,
                              color: Color(0xFFA7ABB3)),
                          Text(
                            "${data.date}",
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Text(
                          "Berat Sampah:",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${data.weight}",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          "kg",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 20),
                      child: Container(
                        height: 125.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${data.image}"),
                              fit: BoxFit.fill),
                          color: Colors.blueAccent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            flex: 1,
                            child: Text(
                              "Total Biaya",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Rp. ${data.price}",
                                style: const TextStyle(
                                    fontSize: 22.0, color: Color(0xFF019BF1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is DetalHistoryIsLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          return Container(
            child: const Center(
              child: Text(
                "Kosong",
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

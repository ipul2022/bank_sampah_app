// ignore_for_file: unnecessary_string_interpolations

part of '../pages.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Riwayat",
          style: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            context.go('/NavigasiBar');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
        if (state is HistoryInLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else if (state is HistoryInSucces) {
          return ListView.builder(
              itemCount: state.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = state.data[index];
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFDFF),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black, width: 0.1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 16),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '${data.date}',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFFA7ABB3),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, right: 16),
                                    child: Text(
                                      '${data.point}pt',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFA7ABB3),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4, left: 16),
                                    child: Text(
                                      'Berat Sampah :',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF001F29),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 5),
                                      child: Text(
                                        '${data.weight}Kg',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF001F29),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4,
                                      right: 16,
                                    ),
                                    child: Text(
                                      'Rp ${data.revenue}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF019BF1),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 16, left: 16),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: 40,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Color(0xFFFF7F33)),
                                      foregroundColor: const Color(0xFFFF7F33),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () {
                                      context.go('/DetailRiwayat');
                                    },
                                    child: const Text("Lihat Detail",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
        return const Center(
          child: Text(
            "Data Not Found",
          ),
        );
      }),
    );
  }
}

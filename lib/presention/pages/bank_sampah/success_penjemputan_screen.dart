// ignore_for_file: deprecated_member_use, avoid_print

part of '../pages.dart';

class SuccessPenjemputan extends StatefulWidget {
  const SuccessPenjemputan({super.key});

  @override
  State<SuccessPenjemputan> createState() => _SuccessPenjemputanState();
}

class _SuccessPenjemputanState extends State<SuccessPenjemputan> {
  _launchWhatsApp() async {
    // Ganti nomor telepon berikut dengan nomor WhatsApp yang ingin Anda hubungi.
    String phoneNumber = '6285162612828';

    // Buat URL WhatsApp dengan nomor telepon yang sudah ditentukan.
    String whatsappUrl = 'https://wa.me/$phoneNumber';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      // Jika URL tidak dapat diluncurkan, tampilkan pesan kesalahan.
      print('Tidak dapat membuka WhatsApp.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Image.asset(
                        "asset/images/ceklis.png",
                        width: 128.0,
                        height: 128.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'Selamat!!',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Terimakasih sudah menggunakan layanan kami,\nsampah anda akan di ambil oleh petugas,\nsilakan konfirmasi',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8D50),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _launchWhatsApp();
                    context.goNamed(Routes.NavigasiBar);
                  },
                  child: const Text("Hubungi Petugas"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

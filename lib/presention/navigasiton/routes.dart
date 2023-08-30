import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
import 'package:loginandsignup/presention/pages/bank_sampah/cubit/bank_sampah_cubit.dart';
import 'package:loginandsignup/presention/pages/detail_riwayat/cubit/detal_history_cubit.dart';
import 'package:loginandsignup/presention/pages/home/cubit/home_cubit.dart';
// import 'package:loginandsignup/pages/pages.dart';
import 'package:loginandsignup/presention/pages/pages.dart';

import '../pages/layanan/cubit/layanan_cubit.dart';
import 'route.dart';
// import 'package:loginandsignup/presention/pages/pembayaran/cubit/pilih_pembayaran_cubit.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/Splash_Screen",
    name: "splash",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/",
    name: "login",
    builder: (context, state) => const LoginScreen(),
    // redirect: (context, state) async {
    //   final isAuth = context.read<AuthCubit>().checkToken();
    //   if (await isAuth) {
    //     return '/HomeScreen';
    //   } else {
    //     return '/';
    //   }
    // },
  ),
  GoRoute(
    path: "/NavigasiBar",
    name: 'navbar',
    builder: (context, state) => const NavigasiBar(),
  ),
  GoRoute(
    path: "/HomeScreen",
    name: Routes.HomeScreen,
    builder: (context, state) {
      BlocProvider.of<HomeCubit>(context).fecthHome();
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: "/Profile",
    name: Routes.Profile,
    builder: (context, state) => const Profile(),
  ),
  GoRoute(
    path: "/AutentikasiScreen",
    name: "auten",
    builder: (context, state) => const AutentikasiScreen(),
  ),
  GoRoute(
    path: "/SuccesScreen",
    name: "succes",
    builder: (context, state) => const SuccesScreen(),
  ),
  GoRoute(
      path: "/LayananScreen",
      name: "layanan",
      builder: (context, state) {
        BlocProvider.of<LayananCubit>(context).fecthLayanan();

        return const LayananScreen();
      }),
  GoRoute(
    path: "/RegisterScreen",
    name: "resgis",
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: "/LupaPassword",
    name: "lupa",
    builder: (context, state) => const LupaPassword(),
  ),
  GoRoute(
    path: "/ConfigPass",
    name: "configpass",
    builder: (context, state) => const ConfigPass(),
  ),
  GoRoute(
    path: "/SuccesPass",
    name: "succespass",
    builder: (context, state) => const SuccesPass(),
  ),
  GoRoute(
    path: "/LayananScreen",
    name: "layananscreen",
    builder: (context, state) => const SuccesPass(),
  ),
  GoRoute(
    path: "/BankSampahScreen",
    name: "bank",
    builder: (context, state) {
      BlocProvider.of<BankSampahCubit>(context).fecthBankSampah();
      return const BankSampahScreen();
    },
  ),
  GoRoute(
    path: "/TukarPoint1",
    name: "point1",
    builder: (context, state) {
      // BlocProvider.of<TukarpointCubit>(context).fecthTukarPoint();
      return const TukarPoint1();
    },
  ),
  GoRoute(
    path: "/PenjemputanScreen",
    name: "penjemputan",
    builder: (context, state) => const PenjemputanScreen(),
  ),
  GoRoute(
    path: "/SampahPenjemputan",
    name: "sampahpenjemputan",
    builder: (context, state) => const SampahPenjemputan(),
  ),
  GoRoute(
    path: "/SuccessPenjemputan",
    name: "successpenjemputan",
    builder: (context, state) => const SuccessPenjemputan(),
  ),
  GoRoute(
    path: "/DetailRiwayat",
    name: "detailriwayat",
    builder: (context, state) {
      BlocProvider.of<DetalHistoryCubit>(context)
          .fecthDetailHistory("Detail History");
      return const DetailRiwayat();
    },
  ),
  GoRoute(
      path: "/RiwayatScreen",
      name: "riwayat",
      builder: (context, state) => const RiwayatScreen()),
  GoRoute(
    path: "/ArticleScreen",
    name: "article",
    builder: (context, state) => const ArticleScreen(),
  ),
  GoRoute(
    path: "/DetailArticle",
    name: "detailarticle",
    builder: (context, state) => const DetailArticle(),
  ),
  GoRoute(
    path: "/ChangeProfile",
    name: Routes.ChangeProfile,
    builder: (context, state) {
      BlocProvider.of<HomeCubit>(context).fecthHome();

      return ChangeProfile(
        profileData: HomeProfileData(
            "image", 'username', 0, "email", 'phone', 'address'),
      );
    },
  ),
  GoRoute(
    path: "/KonfirmasiPembayaran",
    name: "KonfirmasiPembayaranScreen",
    builder: (context, state) => const KonfirmasiPembayaranScreen(),
  ),
  GoRoute(
    path: "/PilihPembayaran",
    name: "PilihPembayaranScreen",
    builder: (context, state) => const PilihPembayaranScreen(),
  ),
]);

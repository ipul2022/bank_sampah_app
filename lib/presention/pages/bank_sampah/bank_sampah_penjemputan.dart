// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element, unnecessary_brace_in_string_interps
// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors

part of '../pages.dart';

class SampahPenjemputan extends StatefulWidget {
  final AddItemModel addItem;
  const SampahPenjemputan({
    Key? key,
    required this.addItem,
  }) : super(key: key);

  @override
  State<SampahPenjemputan> createState() => _SampahPenjemputanState();
}

class _SampahPenjemputanState extends State<SampahPenjemputan> {
  String? _layanan;
  int? _weight;
  TextEditingController lokasiController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String urlImage = "";
  File? _image;
  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(
        () {
          _image = File(pickedImage.path);
          urlImage = '';
        },
      );
    }
  }

  Future<void> _getImageFromGalery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(
        () {
          _image = File(pickedImage.path);
          urlImage = '';
        },
      );
    }
  }

  bool isProfileCompleted() {
    if (lokasiController.text.isNotEmpty && tanggalController.text.isNotEmpty
        // waktuController.text.isNotEmpty &&
        // beratController.text.isNotEmpty
        ) {
      return true;
    } else {
      return false;
    }
  }

  bool isUpdate = false;
  DateTime selectedDateTime = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateTime) {
      setState(() {
        selectedDateTime = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );

    if (picked != null) {
      setState(() {
        selectedDateTime = DateTime(selectedDateTime.year,
            selectedDateTime.month, selectedDateTime.day, 0, 0, 0);
      });
    }
  }

  double? _point;
  @override
  void initState() {
    // _serviceName = widget.addNewInquiry.service_name;
    // _price = widget.addNewInquiry.price;

    _layanan = widget.addItem.layanan;
    _weight = widget.addItem.quantity;
    _point = widget.addItem.total;
    context.read<AuthCubit>().checkToken();
    context.read<HomeCubit>().fecthHome();
    super.initState();
  }

  bool validate() {
    if (lokasiController.text.isEmpty || tanggalController.text.isEmpty) {
      Commons().showSnackbarError(context, "Semua field harus diisi.");
      return false;
    }
    if (_image == null) {
      Commons().showSnackbarError(context, 'Photo Sampah Tidak Boleh Kosong');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Bank Sampah",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              context.goNamed(Routes.BankSampahScreen);
              context.read<LayananCubit>().fecthLayanan();
            },
            child: const Icon(CupertinoIcons.arrow_left, color: Colors.black)),
      ),
      body: BlocListener<NewInquiryCubit, NewInquiryState>(
        listener: (context, state) {
          if (state is NewInquiryIsError) {
            Commons().showSnackbarError(context, state.message!);
          } else if (state is NewInquiryIsSuccess) {
            Commons().showSnackbarInfo(context, "Add New Inquiry Berhasil");
            // context.goNamed(Routes.LayananScreen);
            //  context.read<LayananCubit>().fecthLayanan();
            context.read<AuthCubit>().checkToken();
            context.read<HomeCubit>().fecthHome();
            context.go("/SuccessPenjemputan");
          }
        },
        child: isUpdate
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 26, left: 20),
                        child: Text(
                          'Atur Lokasi ',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 20, right: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: lokasiController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            suffixIcon: const Icon(Icons.location_on),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Atur lokasi penjemputan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 24, left: 20),
                        child: Text(
                          "Tanggal Penjemputan",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 20, right: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          readOnly: true,
                          controller: tanggalController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _selectDate(context);

                                tanggalController.text =
                                    DateFormat('yyyy-MM-dd HH:mm:ss')
                                        .format(selectedDateTime);
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "yyyy-MM-dd HH:mm:ss",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, right: 20),
                      child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return SizedBox(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            _getImageFromGalery();
                                          },
                                          child: const ListTile(
                                            leading: Icon(CupertinoIcons
                                                .photo_on_rectangle),
                                            title: Text(
                                              "Gallery",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _getImageFromCamera();
                                          },
                                          child: const ListTile(
                                            leading: Icon(CupertinoIcons
                                                .photo_camera_solid),
                                            title: Text(
                                              "Camera",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(_image!,
                                      width: MediaQuery.of(context).size.width,
                                      height: 125.0,
                                      fit: BoxFit.cover),
                                )
                              : Container(
                                  height: 125.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'asset/images/sampah.png'),
                                        fit: BoxFit.fill),
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 70, left: 20),
                            child: Text(
                              "Total Point",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 70, right: 20),
                              child: Text(
                                '${_point}',
                                style: TextStyle(
                                    fontSize: 22.0, color: Color(0xFF019BF1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 20, right: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8D50),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            if (validate()) {
                              setState(() {
                                isUpdate = true;
                              });

                              await BlocProvider.of<NewInquiryCubit>(context)
                                  .addQuiry(NewInquiryRequest(
                                _layanan!,
                                _weight!,
                                lokasiController.text,
                                _image!,
                                tanggalController.text,
                              ));

                              setState(() {
                                isUpdate = false;
                              });
                            }
                          },
                          child: const Text("Proses Penjemputan"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

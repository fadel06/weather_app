import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/constant.dart';
import 'package:weather_app/providers/connection_provider.dart';

import '../../common/styles.dart';
import '../../models/region.dart';
import '../../providers/region_provider.dart';
import '../../widgets/custom_typehead.dart';
import '../../widgets/input_decoration.dart';
import '../../widgets/label_text.dart';

class FormSection extends StatelessWidget {
  final RegionProvider provider;
  const FormSection({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelText("Nama"),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(color: kPrimaryColor),
                  controller: provider.nameController,
                  cursorColor: kPrimaryColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mohon masukan nama anda";
                    }
                    return null;
                  },
                  decoration: textInputDecoration("Masukan Nama Anda"),
                ),
              ),
              labelText("Provinsi"),
              customTypeAhead(
                  "Silahkan Pilih Provinsi",
                  provider.provinceController,
                  provider.getProvinces, (Region? suggestion) {
                provider.provinceController.text = suggestion!.nama;
                provider.setProvinceId(suggestion.id);
                provider
                    .setRegencyInputEnabled(!provider.isRegencyInputEnabled);
              }, "Mohon Memilih Provinsi yang Ada"),
              labelText("Kabupaten/Kota"),
              customTypeAhead(
                  "Silahkan Pilih Kabupaten/Kota",
                  provider.regencyController,
                  provider.getRegencies,
                  (Region? suggestion) =>
                      provider.regencyController.text = suggestion!.nama,
                  "Mohon Memilih Kabupaten/Kota yang Ada"),
            ],
          ),
        ),
        Consumer<ConnectionProvider>(builder: (context, connectionProvider, _) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  elevation: 8.0,
                  backgroundColor: kPrimaryColor,
                  shape: const StadiumBorder()),
              onPressed: () async {
                await connectionProvider.checkUserConnection();
                if (connectionProvider.connectionStatus ==
                    ConnectionStatus.connected) {
                  if (provider.formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Mencari kondisi cuaca')));
                  }
                } else {
                  Flushbar(
                    title: 'Koneksi bermasalah',
                    message: connectionProvider.message,
                    duration: const Duration(seconds: 4),
                    backgroundColor: Colors.red,
                    titleColor: Colors.white,
                    messageColor: Colors.white,
                    showProgressIndicator: true,
                    flushbarPosition: FlushbarPosition.TOP,
                  )..show(context);
                }
              },
              child: Text(
                "Cek Cuaca",
                style: myTextTheme.headline6?.apply(color: Colors.white),
              ),
            ),
          );
        })
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/styles/colors.dart';
import 'package:se7ety/core/styles/text.dart';
import 'package:se7ety/core/widgets/card/doctor_card.dart';
import 'package:se7ety/features/auth/data/model/doctor_model.dart';

class SpecializationSearchScreen extends StatelessWidget {
  final String specialization;
  const SpecializationSearchScreen({super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.whiteColor,
        backgroundColor: AppColor.primaryColor,
        title: Text(specialization),
      ),
      body: FutureBuilder(
        future: FirebaseProvider.getDoctorsBySpecialization(specialization),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                value: .9,
                color: Colors.black12,
              ),
            );
          } else {
            if (snapshot.data?.docs.isEmpty == true) {
              return EmptyWidget();
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                DoctorModel doctor = DoctorModel.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>,
                );

                return DoctorCard(doctor: doctor);
              },
            );
          }
        },
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/no-search.svg', width: 250),
            Text('لا يوجد دكتور بهذا التخصص حاليا', style: TextStyles.body),
          ],
        ),
      ),
    );
  }
}
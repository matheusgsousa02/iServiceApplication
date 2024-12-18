import 'package:service_app/models/appointment.dart';
import 'package:service_app/models/establishment_category.dart';
import 'package:service_app/models/monthly_report.dart';
import 'package:service_app/models/user_info.dart';

class HomeModel {
  Appointment? nextAppointment;
  UserInfo? establishment;
  UserInfo? client;
  int? totalAppointments;
  List<EstablishmentCategory>? categories;
  List<MonthlyReport>? monthlyReports;
  int? totalServicesActives;

  HomeModel({
    this.nextAppointment,
    this.establishment,
    this.client,
    this.totalAppointments,
    this.categories,
    this.monthlyReports,
    this.totalServicesActives,
  });

  // Factory method to create an instance of HomeModel from a JSON map
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      nextAppointment: json['nextAppointment'] != null
          ? Appointment.fromJson(json['nextAppointment'])
          : null,
      establishment: json['establishment'] != null
          ? UserInfo.fromJson(json['establishment'])
          : null,
      client: json['client'] != null ? UserInfo.fromJson(json['client']) : null,
      totalAppointments: json['totalAppointments'],
      categories: json['categories'] != null
          ? List<EstablishmentCategory>.from((json['categories'] as List)
              .map((item) => EstablishmentCategory.fromJson(item)))
          : null,
      monthlyReports: json['monthlyReports'] != null
          ? List<MonthlyReport>.from((json['monthlyReports'] as List)
              .map((item) => MonthlyReport.fromJson(item)))
          : null,
      totalServicesActives: json['totalServicesActives'],
    );
  }

  // Method to convert the HomeModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'nextAppointment': nextAppointment?.toJson(),
      'establishment': establishment?.toJson(),
      'client': client?.toJson(),
      'totalAppointments': totalAppointments,
      'categories': categories?.map((item) => item.toJson()).toList(),
      'monthlyReports': monthlyReports?.map((item) => item.toJson()).toList(),
      'totalServicesActives': totalServicesActives,
    };
  }
}

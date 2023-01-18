import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menoreh_library/core/_core.dart';

extension DateTimeExtension on DateTime {
  /// For [DateTime] formatting and return as [String]
  /// e.g `12 Agu 2022`
  String get yMMMd {
    DateFormat formattor = DateFormat('dd MMM yyyy');
    return formattor.format(this);
  }

  /// For [DateTime] formatting and return as [String]
  /// e.g `12 January 2022`
  String get yMMMMd {
    DateFormat formattor = DateFormat('dd MMMM yyyy');
    return formattor.format(this);
  }

  /// For "Unix epoch"
  /// e.g `1640979000000`
  int get toMillisecondsSinceEpoch => millisecondsSinceEpoch;
}

extension IntExtension on int {
  /// For [int] formatting and return as [String]
  /// e.g `12 Agustus 2022 4:23 PM`
  String get formMillisecondsSinceEpoch {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat.yMMMd().add_jm().format(date);
  }
}

extension StringExtension on String {
  /// For [DATA] date formatting and return as [DateTime]
  DateTime toDateTime({bool isHours = false}) {
    late DateFormat inputFormat;
    if (isHours) {
      inputFormat = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      );
    } else {
      inputFormat = DateFormat('yyyy-MM-dd');
    }
    return inputFormat.parse(this);
  }

  /// for [String] formating to result as `Flutter is very good`
  String get capitalize => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  /// String to currency number 
  String get numberDigitOnly => replaceAll(",", "");
}

extension DoubleExtention on double {
  /// currency number to String
  String get textDigitOnly => (NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0, name: "Rp").format(this));
}

extension SuffixTypeExtension on SuffixType {
  bool get isPercentage => this == SuffixType.percentage;
  bool get isChackButton => this == SuffixType.checkButton;
}

extension PlatformFileExtension on Uint8List {
  String formatBytes(int decimals) {
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

    if (isEmpty) return "0 B";
    var i = (log(lengthInBytes) / log(1024)).floor();
    return '${(lengthInBytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

extension BuildContextExtension on BuildContext {
  bool get isTabletUnder => width <= 1000;
  bool get isDesktop => width >= 1200;

  double get maxWidthDialog {
    late double value;
    if (isDesktop) {
      value = width / 2.4;
    } else if (isTablet) {
      value = width / 2.0;
    } else {
      value = width / 1.2;
    }
    return value;
  }

  double get maxWidthDialogDetail {
    late double value;
    if (isDesktop) {
      value = width / 1.8;
    } else {
      value = width / 1.2;
    }
    return value;
  }

  double get maxHeightDialogDetail => height / 1.2;
}

//! ENUM
extension TableTypeEnum on TableType {
  bool get isText => this == TableType.text;
  bool get isNumber => this == TableType.number;
  bool get isChip => this == TableType.chip;
  bool get isLink => this == TableType.link;
}

extension ChipTypeEnum on ChipType {
  bool get isNormal => this == ChipType.normal;
  bool get isLight => this == ChipType.light;
}

extension FieldTypeEnum on FieldType {
  bool get isBasic => this == FieldType.basic;
  bool get isDropdown => this == FieldType.dropdown;
}

extension TypeStateEnum on TypeState {
  bool get isInitial => this == TypeState.initial;
  bool get isLoading => this == TypeState.loading;
  bool get isLoaded => this == TypeState.loaded;
  bool get isNotLoaded => this == TypeState.notLoaded;
}

extension AuthStateEnum on AuthState {
  bool get isLoading => this == AuthState.loading;
  bool get isLoggedIn => this == AuthState.loggedIn;
  bool get isNotLoggedIn => this == AuthState.notLoggedIn;
}

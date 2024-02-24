import 'dart:ui';

import 'package:flutter/material.dart';

const FontWeight fontBold = FontWeight.w700;
const FontWeight fontSemiBold = FontWeight.w600;
const FontWeight fontExtraBold = FontWeight.w800;
const FontWeight fontMedium = FontWeight.w500;
const FontWeight fontRegular = FontWeight.w400;
const FontWeight fontLight = FontWeight.w300;

// Font
const String Nunito = "Nunito";
const String Helvetica = "Helvetica";
const String CarterOne = "CarterOne";
// Date Formats
const String serverDateFormat = "yyyy-MM-dd";
const String cartDateFormat = "EEEE, MMM dd yyyy ";
const String orderDetailDateFormat = "MMM dd, yyyy ";
const String orderDateFormat = "EE, MMM dd yyyy ";
const String orderCreatedDateFormat = "MMM dd,yyyy-HH:MM a";
const String serverTimeFormat = "HH:mm";
const String dateFormat = "dd-MM-yyyy";
const String timeFormat = "hh:mm a";
const String dayFormat = 'EEE';
const String mealDateFormat = 'MMM dd';

// File Type Extensions
const String extensionPDF = "pdf";
const String extensionJPG = "jpg";
const String extensionJPEG = "jpeg";
const String extensionPNG = "png";

// Padding
const double defaultPadding = 10;
const double normalPadding = 15;
const double largePadding = 20;
const double extraLargePadding = 25;
const double doubleExtraLargePadding = 50;
const double tooLargePadding = 60;
const double zeroPadding = 0;
const double smallPadding = 6;

//font Size
const double titleFont = 17.0;
const double subTitleFont = 15.0;
const double XnormalFont = 14.0;
const double smallFont = 12.0;
//const double toMiniFont = 11.0;
const double headerFont = 18.0;
const double normalFont = 16.0;
const double XmediumFont = 20.0;

const double tooMiniFont = 10.0;

const MIN_LENGTH_NAME = 2;
const MAX_LENGTH_NAME = 32;
const PASSWORD_LENGTH = 6;
const country_code = '+1';
const MOBILE_NUMBER_LENGTH = 12;


const MIN_ADDRESS_LENGTH = 10;
const MAX_ADDRESS_LENGTH = 250;

const MIN_SUBJECT_LENGTH = 5;
const MAX_SUBJECT_LENGTH = 200;

const MIN_MESSAGE_LENGTH = 30;
const MAX_MESSAGE_LENGTH = 500;

const ZIP_CODE_MIN_LENGTH = 5;
const ZIP_CODE_MAX_LENGTH = 9;

const ORDER_MAX_DAY = 3;
const ORDER_MAX_IMAGES=7;

/**
 * We remove stripe secrete and publish in future because of the payment security reason
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tergov`
  String get appName {
    return Intl.message(
      'Tergov',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password to sign in`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email and password to sign in',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Keep me logged in`
  String get keepMeLoggedIn {
    return Intl.message(
      'Keep me logged in',
      name: 'keepMeLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry sometimes people can forget too,enter your email and we will send you a link to reset your password.`
  String get forgotPasswordSubTitle {
    return Intl.message(
      'Don\'t worry sometimes people can forget too,enter your email and we will send you a link to reset your password.',
      name: 'forgotPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent`
  String get changeYourPasswordTitle {
    return Intl.message(
      'Password reset link sent',
      name: 'changeYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get changeYourPasswordSubTitle {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'changeYourPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend to Email`
  String get resendEmail {
    return Intl.message(
      'Resend to Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet?`
  String get notRegistered {
    return Intl.message(
      'Not registered yet?',
      name: 'notRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get createAccount {
    return Intl.message(
      'Create an Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Victim`
  String get victim {
    return Intl.message(
      'Victim',
      name: 'victim',
      desc: '',
      args: [],
    );
  }

  /// `Accused`
  String get accused {
    return Intl.message(
      'Accused',
      name: 'accused',
      desc: '',
      args: [],
    );
  }

  /// `Suspect`
  String get suspect {
    return Intl.message(
      'Suspect',
      name: 'suspect',
      desc: '',
      args: [],
    );
  }

  /// `Legal representative`
  String get legalRepresentative {
    return Intl.message(
      'Legal representative',
      name: 'legalRepresentative',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Total statistics`
  String get totalStats {
    return Intl.message(
      'Total statistics',
      name: 'totalStats',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Select status`
  String get selectStatus {
    return Intl.message(
      'Select status',
      name: 'selectStatus',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Profession`
  String get profession {
    return Intl.message(
      'Profession',
      name: 'profession',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Marital status`
  String get maritalStatus {
    return Intl.message(
      'Marital status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Main Information`
  String get mainInfo {
    return Intl.message(
      'Main Information',
      name: 'mainInfo',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }

  /// `Process participant, interviewed: Full name`
  String get processParticipant {
    return Intl.message(
      'Process participant, interviewed: Full name',
      name: 'processParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Residence`
  String get residence {
    return Intl.message(
      'Residence',
      name: 'residence',
      desc: '',
      args: [],
    );
  }

  /// `Select participant status`
  String get selectParticipantStatus {
    return Intl.message(
      'Select participant status',
      name: 'selectParticipantStatus',
      desc: '',
      args: [],
    );
  }

  /// `Interview conducted`
  String get interviewConducted {
    return Intl.message(
      'Interview conducted',
      name: 'interviewConducted',
      desc: '',
      args: [],
    );
  }

  /// `Chief investigator conducting the interview: Full name`
  String get chiefInvestigator {
    return Intl.message(
      'Chief investigator conducting the interview: Full name',
      name: 'chiefInvestigator',
      desc: '',
      args: [],
    );
  }

  /// `Upload signature`
  String get uploadSignature {
    return Intl.message(
      'Upload signature',
      name: 'uploadSignature',
      desc: '',
      args: [],
    );
  }

  /// `Employee conducting inquiry or investigation: Full name`
  String get employeeConductingInquiry {
    return Intl.message(
      'Employee conducting inquiry or investigation: Full name',
      name: 'employeeConductingInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Explained content of Article 211 of the Criminal Code of the Republic of Uzbekistan`
  String get articleExplanation {
    return Intl.message(
      'Explained content of Article 211 of the Criminal Code of the Republic of Uzbekistan',
      name: 'articleExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Video recording of the interview process`
  String get videoRecording {
    return Intl.message(
      'Video recording of the interview process',
      name: 'videoRecording',
      desc: '',
      args: [],
    );
  }

  /// `Interview date`
  String get interviewDate {
    return Intl.message(
      'Interview date',
      name: 'interviewDate',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Your consent`
  String get yourConsent {
    return Intl.message(
      'Your consent',
      name: 'yourConsent',
      desc: '',
      args: [],
    );
  }

  /// `Did the employee exhibit the following behaviors?`
  String get misconductOccurred {
    return Intl.message(
      'Did the employee exhibit the following behaviors?',
      name: 'misconductOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Long, unjustified waiting`
  String get longWaiting {
    return Intl.message(
      'Long, unjustified waiting',
      name: 'longWaiting',
      desc: '',
      args: [],
    );
  }

  /// `Rude behavior`
  String get rudeBehavior {
    return Intl.message(
      'Rude behavior',
      name: 'rudeBehavior',
      desc: '',
      args: [],
    );
  }

  /// `Psychological pressure`
  String get psychologicalPressure {
    return Intl.message(
      'Psychological pressure',
      name: 'psychologicalPressure',
      desc: '',
      args: [],
    );
  }

  /// `Physical pressure`
  String get physicalPressure {
    return Intl.message(
      'Physical pressure',
      name: 'physicalPressure',
      desc: '',
      args: [],
    );
  }

  /// `Bribery or extortion`
  String get bribery {
    return Intl.message(
      'Bribery or extortion',
      name: 'bribery',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Application successfully submitted`
  String get submissionSuccessful {
    return Intl.message(
      'Application successfully submitted',
      name: 'submissionSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language changed`
  String get languageChanged {
    return Intl.message(
      'Language changed',
      name: 'languageChanged',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message(
      'Mon',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tue {
    return Intl.message(
      'Tue',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wed {
    return Intl.message(
      'Wed',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get thu {
    return Intl.message(
      'Thu',
      name: 'thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message(
      'Fri',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message(
      'Sat',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sun {
    return Intl.message(
      'Sun',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `Continue as User`
  String get continueAsUser {
    return Intl.message(
      'Continue as User',
      name: 'continueAsUser',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get email_empty {
    return Intl.message(
      'Email cannot be empty',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalid_email {
    return Intl.message(
      'Invalid email address',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get password_empty {
    return Intl.message(
      'Password cannot be empty',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `{fieldName} cannot be empty`
  String field_empty(String fieldName) {
    return Intl.message(
      '$fieldName cannot be empty',
      name: 'field_empty',
      desc: 'Error message when a specified field is empty',
      args: [fieldName],
    );
  }

  /// `Participant who has had an interview: Full Name`
  String get full_name_hint {
    return Intl.message(
      'Participant who has had an interview: Full Name',
      name: 'full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Place of Residence`
  String get residence_hint {
    return Intl.message(
      'Place of Residence',
      name: 'residence_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number_hint {
    return Intl.message(
      'Phone Number',
      name: 'phone_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Select Participant Status`
  String get participant_status_hint {
    return Intl.message(
      'Select Participant Status',
      name: 'participant_status_hint',
      desc: '',
      args: [],
    );
  }

  /// `Interview Conducted`
  String get interview_conducted_hint {
    return Intl.message(
      'Interview Conducted',
      name: 'interview_conducted_hint',
      desc: '',
      args: [],
    );
  }

  /// `Investigator's Full Name`
  String get investigator_full_name_hint {
    return Intl.message(
      'Investigator\'s Full Name',
      name: 'investigator_full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Officer's Full Name`
  String get officer_full_name_hint {
    return Intl.message(
      'Officer\'s Full Name',
      name: 'officer_full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Article 211 Explanation`
  String get article_211_explanation_hint {
    return Intl.message(
      'Article 211 Explanation',
      name: 'article_211_explanation_hint',
      desc: '',
      args: [],
    );
  }

  /// `Interview Recorded`
  String get interview_recorded_hint {
    return Intl.message(
      'Interview Recorded',
      name: 'interview_recorded_hint',
      desc: '',
      args: [],
    );
  }

  /// `Interview Date`
  String get interview_start_date_hint {
    return Intl.message(
      'Interview Date',
      name: 'interview_start_date_hint',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name_field {
    return Intl.message(
      'Full Name',
      name: 'full_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Place of Residence`
  String get residence_field {
    return Intl.message(
      'Place of Residence',
      name: 'residence_field',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number_field {
    return Intl.message(
      'Phone Number',
      name: 'phone_number_field',
      desc: '',
      args: [],
    );
  }

  /// `Participant Status`
  String get participant_status_field {
    return Intl.message(
      'Participant Status',
      name: 'participant_status_field',
      desc: '',
      args: [],
    );
  }

  /// `Interview Conducted`
  String get interview_conducted_field {
    return Intl.message(
      'Interview Conducted',
      name: 'interview_conducted_field',
      desc: '',
      args: [],
    );
  }

  /// `Investigator's Full Name`
  String get investigator_full_name_field {
    return Intl.message(
      'Investigator\'s Full Name',
      name: 'investigator_full_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Officer's Full Name`
  String get officer_full_name_field {
    return Intl.message(
      'Officer\'s Full Name',
      name: 'officer_full_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Article 211 Explanation`
  String get article_211_explanation_field {
    return Intl.message(
      'Article 211 Explanation',
      name: 'article_211_explanation_field',
      desc: '',
      args: [],
    );
  }

  /// `Interview Recorded`
  String get interview_recorded_field {
    return Intl.message(
      'Interview Recorded',
      name: 'interview_recorded_field',
      desc: '',
      args: [],
    );
  }

  /// `Interview Date`
  String get interview_start_date_field {
    return Intl.message(
      'Interview Date',
      name: 'interview_start_date_field',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Fixed`
  String get fixed {
    return Intl.message(
      'Fixed',
      name: 'fixed',
      desc: '',
      args: [],
    );
  }

  /// `Not fixed`
  String get notFixed {
    return Intl.message(
      'Not fixed',
      name: 'notFixed',
      desc: '',
      args: [],
    );
  }

  /// `Did the employee exhibit the following facts?`
  String get employee_facts_hint {
    return Intl.message(
      'Did the employee exhibit the following facts?',
      name: 'employee_facts_hint',
      desc: '',
      args: [],
    );
  }

  /// `Unjustified long waits`
  String get long_waits_hint {
    return Intl.message(
      'Unjustified long waits',
      name: 'long_waits_hint',
      desc: '',
      args: [],
    );
  }

  /// `Rude behavior`
  String get rude_behavior_hint {
    return Intl.message(
      'Rude behavior',
      name: 'rude_behavior_hint',
      desc: '',
      args: [],
    );
  }

  /// `Psychological pressure`
  String get psychological_pressure_hint {
    return Intl.message(
      'Psychological pressure',
      name: 'psychological_pressure_hint',
      desc: '',
      args: [],
    );
  }

  /// `Physical pressure`
  String get physical_pressure_hint {
    return Intl.message(
      'Physical pressure',
      name: 'physical_pressure_hint',
      desc: '',
      args: [],
    );
  }

  /// `Extortion of illegal rewards`
  String get extortion_hint {
    return Intl.message(
      'Extortion of illegal rewards',
      name: 'extortion_hint',
      desc: '',
      args: [],
    );
  }

  /// `Employee facts`
  String get employee_facts_field {
    return Intl.message(
      'Employee facts',
      name: 'employee_facts_field',
      desc: '',
      args: [],
    );
  }

  /// `Long waits`
  String get long_waits_field {
    return Intl.message(
      'Long waits',
      name: 'long_waits_field',
      desc: '',
      args: [],
    );
  }

  /// `Rude behavior`
  String get rude_behavior_field {
    return Intl.message(
      'Rude behavior',
      name: 'rude_behavior_field',
      desc: '',
      args: [],
    );
  }

  /// `Psychological pressure`
  String get psychological_pressure_field {
    return Intl.message(
      'Psychological pressure',
      name: 'psychological_pressure_field',
      desc: '',
      args: [],
    );
  }

  /// `Physical pressure`
  String get physical_pressure_field {
    return Intl.message(
      'Physical pressure',
      name: 'physical_pressure_field',
      desc: '',
      args: [],
    );
  }

  /// `Extortion`
  String get extortion_field {
    return Intl.message(
      'Extortion',
      name: 'extortion_field',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Main Dashboard`
  String get mainDashboard {
    return Intl.message(
      'Main Dashboard',
      name: 'mainDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Add Admin`
  String get addAdmin {
    return Intl.message(
      'Add Admin',
      name: 'addAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Select Role`
  String get selectRole {
    return Intl.message(
      'Select Role',
      name: 'selectRole',
      desc: '',
      args: [],
    );
  }

  /// `Admin role`
  String get adminRole {
    return Intl.message(
      'Admin role',
      name: 'adminRole',
      desc: '',
      args: [],
    );
  }

  /// `Admin Email`
  String get adminEmail {
    return Intl.message(
      'Admin Email',
      name: 'adminEmail',
      desc: '',
      args: [],
    );
  }

  /// `Simple Admin`
  String get simpleAdmin {
    return Intl.message(
      'Simple Admin',
      name: 'simpleAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Super Admin`
  String get superAdmin {
    return Intl.message(
      'Super Admin',
      name: 'superAdmin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

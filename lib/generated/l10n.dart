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

  /// `It was explained to me that giving a bribe, that is, knowingly illegal provision to an official of a state body, an organization with state participation or a self-government body of citizens personally or through an intermediary of material values or property benefits for performing or not performing in the interests of the person who gave the bribe a certain action that the official should have or could have performed using his official position, provides for criminal punishment in the form of imprisonment from five to fifteen years.`
  String get warning_message_1 {
    return Intl.message(
      'It was explained to me that giving a bribe, that is, knowingly illegal provision to an official of a state body, an organization with state participation or a self-government body of citizens personally or through an intermediary of material values or property benefits for performing or not performing in the interests of the person who gave the bribe a certain action that the official should have or could have performed using his official position, provides for criminal punishment in the form of imprisonment from five to fifteen years.',
      name: 'warning_message_1',
      desc: '',
      args: [],
    );
  }

  /// `If you are not satisfied with the pre-investigation check, inquiry or preliminary investigation conducted by the investigative units of the internal affairs bodies, as well as the untimely consideration of your appeals, you can directly contact the heads of the Investigative Department at the Department of Internal Affairs of the Namangan region and its territorial divisions by the following phone numbers:Deputy Head of the Department of Internal Affairs of Namangan region – Head of the Investigative Department Ibodov Zhaongir Nasullo shgli:Tel: 998 95-318-04-00, 998 69-210-30-04`
  String get warning_message_2 {
    return Intl.message(
      'If you are not satisfied with the pre-investigation check, inquiry or preliminary investigation conducted by the investigative units of the internal affairs bodies, as well as the untimely consideration of your appeals, you can directly contact the heads of the Investigative Department at the Department of Internal Affairs of the Namangan region and its territorial divisions by the following phone numbers:Deputy Head of the Department of Internal Affairs of Namangan region – Head of the Investigative Department Ibodov Zhaongir Nasullo shgli:Tel: 998 95-318-04-00, 998 69-210-30-04',
      name: 'warning_message_2',
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

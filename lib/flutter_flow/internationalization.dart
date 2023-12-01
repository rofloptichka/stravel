import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'kk', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? kkText = '',
    String? enText = '',
  }) =>
      [ruText, kkText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Properties
  {
    'gcp4kv9k': {
      'ru': 'S-Travel',
      'en': '',
      'kk': '',
    },
    'sxl1p2xw': {
      'ru': 'Туры',
      'en': '',
      'kk': '',
    },
    'jxre6gh9': {
      'ru': 'Достопримечательности',
      'en': '',
      'kk': '',
    },
    'tznh6vgl': {
      'ru': 'Чаты',
      'en': '',
      'kk': '',
    },
    'nsmhpby5': {
      'ru': 'Профиль',
      'en': '',
      'kk': '',
    },
    'xeva2i1w': {
      'ru': 'Войти',
      'en': '',
      'kk': '',
    },
    'kd32x8o5': {
      'ru': 'Регистрация',
      'en': '',
      'kk': '',
    },
    'jdigm57j': {
      'ru': 'S-Travel',
      'en': 'MTour',
      'kk': 'MTour',
    },
    '8b3ty4pf': {
      'ru': 'Добро пожаловать!',
      'en': 'Welcome!',
      'kk': 'Қош келдіңіз!',
    },
    'zfxtvfzz': {
      'ru': 'Найдите место своей мечты для отдыха',
      'en': 'Find your Dream Space To Getaway',
      'kk': 'Өзіңіздің арманыңыздағы кеңістікті табыңыз',
    },
    'm7ek5bq9': {
      'ru': 'Достопримечательности',
      'en': 'Sightseeings',
      'kk': 'Көрнекті жерлер',
    },
    't043pmbs': {
      'ru': 'Поиск',
      'en': 'Search',
      'kk': 'Іздеу',
    },
    'ahr33p1h': {
      'ru': 'Рейтинг',
      'en': 'Rating',
      'kk': 'Рейтинг',
    },
    'dsew7f08': {
      'ru': 'Рейтинг',
      'en': '',
      'kk': '',
    },
    '8udvns4v': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // chatDetails
  {
    '54zz186b': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // searchProperties
  {
    'w7dqa93l': {
      'ru': 'Поиск',
      'en': 'Search',
      'kk': 'Іздеу',
    },
    'zut0jhnj': {
      'ru': 'Адрес\n',
      'en': 'Address, city, state...',
      'kk': 'Мекен-жайы, қаласы, елі',
    },
    'a72fecp1': {
      'ru': 'Поиск',
      'en': 'Search',
      'kk': 'Іздеу',
    },
    '5tp7q8n7': {
      'ru': 'Рейтинг',
      'en': 'Rating',
      'kk': 'Рейтинг',
    },
    '5snoq0g9': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // chatMain
  {
    'suhuu25m': {
      'ru': 'Чаты',
      'en': '',
      'kk': '',
    },
    'uprslwex': {
      'ru': 'Чат',
      'en': 'Chat',
      'kk': 'Чат',
    },
  },
  // tripDetails
  {
    'q7q3gzxi': {
      'ru': 'Детали Поездки',
      'en': '   Trip Details',
      'kk': ' Сапар Мәліметтері',
    },
    'ayzn5q5r': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    'aelhwatf': {
      'ru': 'Ваша поездка успешно окончена!',
      'en': 'Your trip has been successfully completed!',
      'kk': 'Саяхатыңыз сәтті аяқталды!',
    },
    'c4r8ww4g': {
      'ru': 'Оставить отзыв',
      'en': 'Leave Feedback',
      'kk': 'Пікір қалдыру',
    },
    'nz5vx3l8': {
      'ru': 'Информация о хосте',
      'en': 'Host Info',
      'kk': 'Хост туралы ақпарат',
    },
    '93jvmq7z': {
      'ru': 'Чат',
      'en': 'Chat',
      'kk': 'Чат',
    },
    'fq81beil': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // propertyDetails
  {
    'hji2vxku': {
      'ru': 'Обзоры',
      'en': 'Reviews',
      'kk': 'Пікірлер',
    },
    '2g5rzzps': {
      'ru': 'Описание',
      'en': 'Description',
      'kk': 'Сипаттау',
    },
    'm5x9if6o': {
      'ru': 'Удобства',
      'en': 'Amenities',
      'kk': 'Ыңғайлылықтар',
    },
    'f9xx17mn': {
      'ru': 'Что говорят люди',
      'en': 'What people are saying',
      'kk': 'Адамдар не айтып жатыр',
    },
    '7fysy7fm': {
      'ru': 'Джош Ричардсон',
      'en': 'Josh Richardson',
      'kk': 'Джош Ричардсон',
    },
    'j6ogk612': {
      'ru':
          'Важно заботиться о пациенте, следить за врачом, но это время великой боли и страданий. С годами я приду.',
      'en':
          'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering. Over the years, I will come.',
      'kk':
          'Науқасқа қамқорлық жасау, дәрігердің қадағалауы маңызды, бірақ бұл өте азапты уақыт. Жылдар өте келе мен келермін.',
    },
    '0c2xfgzb': {
      'ru': 'Джош Ричардсон',
      'en': 'Josh Richardson',
      'kk': 'Джош Ричардсон',
    },
    '62jxt5jx': {
      'ru':
          'Важно заботиться о пациенте, следить за врачом, но это время великой боли и страданий. С годами я приду.',
      'en':
          'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering. Over the years, I will come.',
      'kk':
          'Науқасқа қамқорлық жасау, дәрігердің қадағалауы маңызды, бірақ бұл өте азапты уақыт. Жылдар өте келе мен келермін.',
    },
    'gjpkvt9j': {
      'ru': '+ налоги/сборы',
      'en': '+ taxes/fees',
      'kk': '+ салықтар/алымдар',
    },
    'z0fcpc6w': {
      'ru': 'За ночь',
      'en': 'Per night',
      'kk': 'Түнге',
    },
    '9bn571om': {
      'ru': 'Забронировать сейчас',
      'en': 'Book Now',
      'kk': 'Қазір брондау',
    },
    'lsvarks8': {
      'ru': 'Редактировать',
      'en': '',
      'kk': '',
    },
    'uv3sg0lr': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // propertyReview
  {
    'aq8ch80a': {
      'ru': 'Отзывы',
      'en': 'Reviews',
      'kk': 'Пікірлер',
    },
    'k02sg0kd': {
      'ru': '2,503',
      'en': '',
      'kk': '',
    },
    'y4kqzma0': {
      'ru': ' # Рейтингов',
      'en': '# of Ratings',
      'kk': 'Рейтинг #-і',
    },
    '73nmedu9': {
      'ru': 'Средний Рейтинг',
      'en': 'Avg. Rating',
      'kk': 'Орташа Рейтинг',
    },
    '0yw1m8bm': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // profilePage
  {
    'joypw8vy': {
      'ru': 'Light Mode',
      'en': '',
      'kk': '',
    },
    'wxivh06i': {
      'ru': 'Dark Mode',
      'en': '',
      'kk': '',
    },
    'wp1z1ktl': {
      'ru': 'Детали Аккаунта',
      'en': 'Account Details',
      'kk': 'Аккаунт Мәліметтері',
    },
    'wwwxj8i7': {
      'ru': 'Изменить данные аккаунта',
      'en': 'Edit Account',
      'kk': 'Аккаунт Мәліметтерін өзгерту',
    },
    'j07orxzz': {
      'ru': 'Информация об оплате',
      'en': 'Payment Info',
      'kk': 'Төлем туралы ақпарат',
    },
    'nnu1c5kq': {
      'ru': 'Изменить пароль',
      'en': 'Change password',
      'kk': 'Құпиясөзді өзгерту',
    },
    'n3dir3pn': {
      'ru': 'Моя собственность',
      'en': 'My trips',
      'kk': 'Менің Саяхаттарым',
    },
    'qkh53sb8': {
      'ru': 'Мои брони',
      'en': 'My Bookings',
      'kk': 'Менің броньдарым',
    },
    'p65qj9dy': {
      'ru': 'Хочешь стать гидом?',
      'en': 'My Bookings',
      'kk': 'Менің броньдарым',
    },
    '0yartguh': {
      'ru': 'Добавить отзыв',
      'en': 'Add Review',
      'kk': 'Пікірды қосу',
    },
    'pglw0zv3': {
      'ru': 'Profile',
      'en': '',
      'kk': '',
    },
    '94vg6oxs': {
      'ru': 'Профиль',
      'en': 'Profile',
      'kk': 'Профиль',
    },
  },
  // bookNow
  {
    'tu9txb3i': {
      'ru': 'Выберите даты поездки',
      'en': 'Choose Dates',
      'kk': 'Күндерді таңдау',
    },
    '45xiza15': {
      'ru': 'Количество людей',
      'en': 'Number of people',
      'kk': 'Адам саны',
    },
    'ru1nnosa': {
      'ru': 'Данные оплаты',
      'en': 'Payment Details',
      'kk': 'Төлем мәліметтері',
    },
    'q5ru22ip': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'rlgv6kse': {
      'ru': 'Бронировать сейчас',
      'en': 'Book Now',
      'kk': 'Қазір брондау',
    },
    'tjxehwww': {
      'ru': 'Бронировать сейчас',
      'en': '',
      'kk': '',
    },
    '5knmh1x9': {
      'ru': 'Главная ',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // editProfile
  {
    'n69almt5': {
      'ru': 'Изменить аккаунт',
      'en': 'Change Account',
      'kk': 'Аккаунтты өзгерту',
    },
    'bvdwitkc': {
      'ru': 'Изменить фото',
      'en': 'Change Picture',
      'kk': 'Суретті өзгерту',
    },
    '0x5x5kvo': {
      'ru': 'Имя',
      'en': 'Name',
      'kk': 'Есімі',
    },
    'cridql3t': {
      'ru': 'Имя',
      'en': 'Name',
      'kk': 'Есімі',
    },
    'dkk5qpeu': {
      'ru': 'Почтовый Адрес',
      'en': 'Email Address',
      'kk': 'Пошта',
    },
    'u252oxgy': {
      'ru': 'Your email..',
      'en': '',
      'kk': '',
    },
    '1q1bu5vy': {
      'ru': 'Сохранить Изменения',
      'en': 'Save Changes',
      'kk': 'Өзгерістерді сақтау',
    },
    'iwrla7te': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // paymentInfo
  {
    'cxifcghx': {
      'ru': 'Сохранить Изменения',
      'en': 'Save Changes',
      'kk': 'Өзгерістерді сақтау',
    },
    'ibrqg550': {
      'ru': 'Данные Оплаты',
      'en': 'Payment Info',
      'kk': 'Төлем туралы ақпарат',
    },
    'kvf00uh2': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // changePassword
  {
    'y5d4bisx': {
      'ru': 'Почтовый Адрес',
      'en': 'Email Address',
      'kk': 'Пошта',
    },
    'ps7w7aml': {
      'ru': '',
      'en': 'Your email..',
      'kk': '',
    },
    '6lbugngd': {
      'ru':
          'Мы вышлем вам электронное письмо со ссылкой для сброса вашего пароля, пожалуйста, введите адрес электронной почты, связанный с вашей учетной записью выше.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email address associated with your account above.',
      'kk':
          'Құпия сөзді қалпына келтіру сілтемесі бар электрондық хат жібереміз, жоғарыдағы тіркелгіңізге байланысты электрондық пошта мекенжайын енгізіңіз.',
    },
    '37uxrov7': {
      'ru': 'Отправить ссылку для сброса',
      'en': 'Send reset link',
      'kk': 'Қалпына келтіру сілтемесін жіберу',
    },
    't7ffod0p': {
      'ru': 'Изменить пароль',
      'en': '\nChange password',
      'kk': 'Құпиясөзді Өзгерту',
    },
    'lpx2ctcg': {
      'ru': 'Главная',
      'en': 'Home',
      'kk': 'Бастапқы бет',
    },
  },
  // myProperties
  {
    '255o2ieq': {
      'ru': 'Price Per Night',
      'en': '',
      'kk': '',
    },
    'pjub4tp1': {
      'ru': 'My Properties',
      'en': '',
      'kk': '',
    },
    'lgenirci': {
      'ru': 'My Trips',
      'en': '',
      'kk': '',
    },
  },
  // myBookings
  {
    'b57v5fiu': {
      'ru': 'Предстоящие',
      'en': 'Upcoming ',
      'kk': 'Алдағы',
    },
    '823gc06f': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    'v5n3i85i': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'nwnd7bq3': {
      'ru': 'Выполнено',
      'en': 'Completed',
      'kk': 'Жасалды',
    },
    'xodzsj4p': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    'ftwb839r': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': '',
    },
    'yss1vakl': {
      'ru': 'Бронирование',
      'en': 'My Bookings',
      'kk': 'Менің Броньдарым',
    },
    'odz9ot67': {
      'ru': 'Мои Поездки',
      'en': 'My Trips',
      'kk': 'Менің Саяхаттарым',
    },
  },
  // tripDetailsHOST
  {
    'i158mye0': {
      'ru': 'Детали поездки',
      'en': 'Trip Details',
      'kk': 'Сапар мәліметтері',
    },
    'vkcomh4s': {
      'ru': 'Даты поездки',
      'en': 'Dates of trip',
      'kk': 'Саяхат күндері',
    },
    'uvcaw7o8': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    '890ponyq': {
      'ru': 'Пункт назначения',
      'en': 'Destination',
      'kk': 'Баратын жер',
    },
    'wvy8kv73': {
      'ru': 'Разбивка цен',
      'en': 'Price Breakdown',
      'kk': 'Бағаларды бөлу',
    },
    'j9s7gs9q': {
      'ru': 'Лучшая цена',
      'en': 'Base Price',
      'kk': 'Үздік баға',
    },
    '1retcf5l': {
      'ru': 'Налоги',
      'en': 'Taxes',
      'kk': 'Салықтар',
    },
    'wydxz1y3': {
      'ru': '11 549.78₸',
      'en': '25,10 \$',
      'kk': '1522,76₽',
    },
    '5l59wv0h': {
      'ru': 'Плата за уборку',
      'en': 'Cleaning Fee',
      'kk': 'Тазалау ақысы',
    },
    'qrcve4gq': {
      'ru': '71 267,52₸',
      'en': ' 154,86\$',
      'kk': '9396,13₽',
    },
    'e5utjkpa': {
      'ru': 'Итоговая цена',
      'en': 'Total',
      'kk': 'Жалпы бағасы',
    },
    'dp35os1i': {
      'ru': 'Отметить как выполненное',
      'en': 'Mark as Complete',
      'kk': 'Аяқталған деп белгілеңіз',
    },
    'gysk6oj6': {
      'ru': 'Информация о госте',
      'en': 'Guest Info',
      'kk': 'Қонақ туралы ақпарат',
    },
    'q4rpckod': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'vw0ttjs8': {
      'ru': 'Домой',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // Test
  {
    '6ujii63h': {
      'ru': 'Где вы планируете отдыхать?',
      'en': '',
      'kk': '',
    },
    'uxrn44dt': {
      'ru': 'Абайская область',
      'en': '',
      'kk': '',
    },
    'k0y2yw9t': {
      'ru': 'Область',
      'en': '',
      'kk': '',
    },
    'oco7ux5g': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    '1gan6dvq': {
      'ru': 'Где вы планируете жить во время поездки?',
      'en': '',
      'kk': '',
    },
    'nclwd02n': {
      'ru': 'Квартира',
      'en': '',
      'kk': '',
    },
    'x0lb1hbf': {
      'ru': 'Дом',
      'en': '',
      'kk': '',
    },
    'e8hbnjw6': {
      'ru': 'Отель',
      'en': '',
      'kk': '',
    },
    'pg6s51ax': {
      'ru': 'Хостел',
      'en': '',
      'kk': '',
    },
    'jc4m2dwn': {
      'ru': 'Область',
      'en': '',
      'kk': '',
    },
    'pjdhjc4x': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'uv0u50tg': {
      'ru': 'Какой у вас бюджет на жилье?',
      'en': '',
      'kk': '',
    },
    'zyx3g0nd': {
      'ru': 'У меня есть свое жилье',
      'en': '',
      'kk': '',
    },
    'npqtvv3e': {
      'ru': 'До 50,000 тенге',
      'en': '',
      'kk': '',
    },
    'g73d9zm0': {
      'ru': '50-100,000 тенге',
      'en': '',
      'kk': '',
    },
    '6xb6buam': {
      'ru': '100-200,000 тенге',
      'en': '',
      'kk': '',
    },
    'wufoztt7': {
      'ru': '200-500,000 тенге',
      'en': '',
      'kk': '',
    },
    'tv2azvcd': {
      'ru': '500-1,000,000 тенге',
      'en': '',
      'kk': '',
    },
    '6gqctha9': {
      'ru': 'Более 1,000,000 тенге',
      'en': '',
      'kk': '',
    },
    'c5ppntaq': {
      'ru': 'Выберите бюджет..',
      'en': '',
      'kk': '',
    },
    'x5nj0sn0': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'qropt27y': {
      'ru': 'Какой вы хотели бы средний чек на еду(на одного)?',
      'en': '',
      'kk': '',
    },
    'dc8q7e28': {
      'ru': 'У меня есть своя еда',
      'en': '',
      'kk': '',
    },
    '0hpwsykn': {
      'ru': 'До 1,000 тенге',
      'en': '',
      'kk': '',
    },
    '2149jx3y': {
      'ru': '2-5,000 тенге',
      'en': '',
      'kk': '',
    },
    '9rf6hkr5': {
      'ru': '5-10,000 тенге',
      'en': '',
      'kk': '',
    },
    'gu704q4e': {
      'ru': '10-20,000 тенге',
      'en': '',
      'kk': '',
    },
    'izd8yrrz': {
      'ru': 'Более 20,000 тенге',
      'en': '',
      'kk': '',
    },
    '5ciw5jv4': {
      'ru': 'Выберите бюджет..',
      'en': '',
      'kk': '',
    },
    'i7xoy6ds': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'qe8od9jz': {
      'ru': 'Сколько вы готовы тратить на развлечения?',
      'en': '',
      'kk': '',
    },
    '23h3jb8r': {
      'ru': '0 тенге',
      'en': '',
      'kk': '',
    },
    'izpqtxis': {
      'ru': 'До 1,000 тенге',
      'en': '',
      'kk': '',
    },
    'fqdret5b': {
      'ru': '2-5,000 тенге',
      'en': '',
      'kk': '',
    },
    '8nvrzici': {
      'ru': '5-10,000 тенге',
      'en': '',
      'kk': '',
    },
    '9ysoautp': {
      'ru': '10-20,000 тенге',
      'en': '',
      'kk': '',
    },
    '9hqf4dqc': {
      'ru': 'Более 20,000 тенге',
      'en': '',
      'kk': '',
    },
    'otiog57z': {
      'ru': 'Выберите бюджет..',
      'en': '',
      'kk': '',
    },
    '48dywpzy': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'droftvse': {
      'ru': 'Какой вид активностей вам больше всего нравится?',
      'en': '',
      'kk': '',
    },
    '4wbx6gp2': {
      'ru':
          'Посещение местных достопримечательностей/\nисторических местностей',
      'en': '',
      'kk': '',
    },
    '3gsy0afz': {
      'ru': 'Выставки/музеи',
      'en': '',
      'kk': '',
    },
    'zvk0jqip': {
      'ru': 'Концерты',
      'en': '',
      'kk': '',
    },
    '3be0h75a': {
      'ru': 'Горы',
      'en': '',
      'kk': '',
    },
    'heq74g2w': {
      'ru': 'Море',
      'en': '',
      'kk': '',
    },
    '5b6fs40h': {
      'ru': 'Санатории',
      'en': '',
      'kk': '',
    },
    'nrdvwocv': {
      'ru': 'Не знаю',
      'en': '',
      'kk': '',
    },
    's68oojx6': {
      'ru': 'Не знаю',
      'en': '',
      'kk': '',
    },
    'p1s1vs9c': {
      'ru': 'Пройдите тест',
      'en': '',
      'kk': '',
    },
    'id3k2i57': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // SignUp
  {
    'jzyffzx6': {
      'ru': 'S-Travel',
      'en': '',
      'kk': '',
    },
    'jix54s8k': {
      'ru': 'Create an account',
      'en': '',
      'kk': '',
    },
    'ha3y0ku2': {
      'ru': 'Let\'s get started by filling out the form below.',
      'en': '',
      'kk': '',
    },
    'd8fb6ad2': {
      'ru': 'Email',
      'en': '',
      'kk': '',
    },
    '1iu58zs2': {
      'ru': 'Password',
      'en': '',
      'kk': '',
    },
    'fnqciyrd': {
      'ru': 'Confirm Password',
      'en': '',
      'kk': '',
    },
    'w1djerl5': {
      'ru': 'Tourist',
      'en': '',
      'kk': '',
    },
    '6zd63rl2': {
      'ru': 'Guide',
      'en': '',
      'kk': '',
    },
    'd42g24lq': {
      'ru': 'Please select...',
      'en': '',
      'kk': '',
    },
    '7ayen6m2': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'vxi0814z': {
      'ru': 'Create Account',
      'en': '',
      'kk': '',
    },
    's1eebz2w': {
      'ru': 'Already have an account?  ',
      'en': '',
      'kk': '',
    },
    'dyidwsqy': {
      'ru': 'Sign in here',
      'en': '',
      'kk': '',
    },
    '4p4dlj76': {
      'ru': 'OR',
      'en': '',
      'kk': '',
    },
    'jiwzewow': {
      'ru': 'Continue with Google',
      'en': '',
      'kk': '',
    },
    'flmcpgf5': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // WelcomePageCopy
  {
    'e8a4c84b': {
      'ru': 'S-Travel',
      'en': '',
      'kk': '',
    },
    'nntcpei0': {
      'ru': 'Туры',
      'en': '',
      'kk': '',
    },
    '7v84hc6r': {
      'ru': 'Достопримечательности',
      'en': '',
      'kk': '',
    },
    'xg2lr45z': {
      'ru': 'Войти',
      'en': '',
      'kk': '',
    },
    '033e1ar9': {
      'ru': 'Регистрация',
      'en': '',
      'kk': '',
    },
    'tctw8bze': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // myTrips
  {
    'nmbsz2pf': {
      'ru': 'Поездки',
      'en': 'My Bookings',
      'kk': 'Менің Броньдарым',
    },
    'u6ih7oa7': {
      'ru': 'Предстоящие',
      'en': 'Upcoming',
      'kk': 'Алдағы',
    },
    'ya3l1por': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    '8gbvaaq7': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'bjdl1whd': {
      'ru': 'Любимые',
      'en': 'Completed',
      'kk': 'Аяқталғандар',
    },
    'pyu0ly7l': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    '8xuuzq87': {
      'ru': 'Мои Поездки',
      'en': 'My Trips',
      'kk': 'Менің Саяхаттарым',
    },
  },
  // SignIn
  {
    'kpieb3wi': {
      'ru': 'S-Travel',
      'en': '',
      'kk': '',
    },
    '7c7ulx6d': {
      'ru': 'Welcome Back',
      'en': '',
      'kk': '',
    },
    'sw6l6a91': {
      'ru': 'Let\'s get started by filling out the form below.',
      'en': '',
      'kk': '',
    },
    '5n09km7d': {
      'ru': 'Email',
      'en': '',
      'kk': '',
    },
    'vopifdik': {
      'ru': 'Password',
      'en': '',
      'kk': '',
    },
    '62vjnv8n': {
      'ru': 'Create Account',
      'en': '',
      'kk': '',
    },
    '4iajyzn2': {
      'ru': 'Forgot Password?',
      'en': '',
      'kk': '',
    },
    'awvgs4pl': {
      'ru': 'Already have an account?  ',
      'en': '',
      'kk': '',
    },
    '6ctfkg38': {
      'ru': 'Sign up here',
      'en': '',
      'kk': '',
    },
    'kyfcuvxj': {
      'ru': 'OR',
      'en': '',
      'kk': '',
    },
    'r5yybpuo': {
      'ru': 'Continue with Google',
      'en': '',
      'kk': '',
    },
    '6rcvu8vi': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // reviewPlace
  {
    '29c0zlfv': {
      'ru': ' - ',
      'en': '',
      'kk': '',
    },
    'emq3imz9': {
      'ru': 'Отправить отзыа',
      'en': 'Make Review',
      'kk': 'Пікірмен бөлісіңіз',
    },
    'fp6p0t4o': {
      'ru': 'Выберите место',
      'en': '',
      'kk': '',
    },
    'ziiljxcn': {
      'ru': 'Поездки',
      'en': 'Trips',
      'kk': 'Сапарлар',
    },
  },
  // mapp
  {
    'ygqn9a43': {
      'ru': 'Page Title',
      'en': '',
      'kk': '',
    },
    'xorcgxcf': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // UploadProperty
  {
    'vau23kuu': {
      'ru': 'Название жилья',
      'en': '',
      'kk': '',
    },
    'ckyo32of': {
      'ru': 'Описание',
      'en': '',
      'kk': '',
    },
    'mun315im': {
      'ru': 'Отель',
      'en': '',
      'kk': '',
    },
    'weqw8jfe': {
      'ru': 'Хостел',
      'en': '',
      'kk': '',
    },
    'q7oyrfdq': {
      'ru': 'Дом',
      'en': '',
      'kk': '',
    },
    '61yakelq': {
      'ru': 'Квартира',
      'en': '',
      'kk': '',
    },
    'j6989uui': {
      'ru': 'Выберите тип жилья..',
      'en': '',
      'kk': '',
    },
    'd9xnxeyo': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    'xaq2jypi': {
      'ru': 'Адрес',
      'en': '',
      'kk': '',
    },
    'rereo5fm': {
      'ru': 'Цена для одного человека',
      'en': '',
      'kk': '',
    },
    'zdd2bv23': {
      'ru': 'Скидка (%)',
      'en': '',
      'kk': '',
    },
    'i2tcika3': {
      'ru': '0',
      'en': '',
      'kk': '',
    },
    'bhjwy9md': {
      'ru': 'Select Location',
      'en': '',
      'kk': '',
    },
    'ahzxystq': {
      'ru': 'Удобства',
      'en': '',
      'kk': '',
    },
    '15mj8ja1': {
      'ru': 'Отправить',
      'en': '',
      'kk': '',
    },
    'xwjus4cz': {
      'ru': 'Добавить жилье',
      'en': '',
      'kk': '',
    },
    'pc5bahim': {
      'ru': 'Главная',
      'en': '',
      'kk': '',
    },
  },
  // forgot
  {
    'k6q8e5ef': {
      'ru': 'Забыли пароль',
      'en': '',
      'kk': '',
    },
    'l4wn804v': {
      'ru': 'Почтовый Адрес',
      'en': '',
      'kk': '',
    },
    'gzr7ao06': {
      'ru': 'Your email..',
      'en': '',
      'kk': '',
    },
    'vwr4xf7a': {
      'ru': 'Отправить заявку',
      'en': '',
      'kk': '',
    },
    'zsznbdvr': {
      'ru': 'Главная',
      'en': '',
      'kk': '',
    },
  },
  // EditProperty
  {
    'enip6g6q': {
      'ru': 'Название жилья',
      'en': '',
      'kk': '',
    },
    'xj8oezff': {
      'ru': 'Описание',
      'en': '',
      'kk': '',
    },
    'qzeqs1a9': {
      'ru': 'Отель',
      'en': '',
      'kk': '',
    },
    '03zz0cfu': {
      'ru': 'Хостел',
      'en': '',
      'kk': '',
    },
    '3r5klwyx': {
      'ru': 'Дом',
      'en': '',
      'kk': '',
    },
    'sf2z9ckn': {
      'ru': 'Квартира',
      'en': '',
      'kk': '',
    },
    'iqqdhv0j': {
      'ru': 'Выберите тип жилья..',
      'en': '',
      'kk': '',
    },
    'acth1hva': {
      'ru': 'Search for an item...',
      'en': '',
      'kk': '',
    },
    '09v7r6ma': {
      'ru': 'Адрес',
      'en': '',
      'kk': '',
    },
    'umwu4s92': {
      'ru': 'Цена для одного человека',
      'en': '',
      'kk': '',
    },
    'o4uv12zm': {
      'ru': 'Скидка (%)',
      'en': '',
      'kk': '',
    },
    'r48sn1vh': {
      'ru': 'Выбрать местоположение',
      'en': '',
      'kk': '',
    },
    '11bf1g76': {
      'ru': 'Удобства',
      'en': '',
      'kk': '',
    },
    '0j9zy2aj': {
      'ru': 'Сохранить',
      'en': '',
      'kk': '',
    },
    '0gnuc7fu': {
      'ru': 'Редактировать жилье',
      'en': '',
      'kk': '',
    },
    '0za4wbgm': {
      'ru': 'Главная',
      'en': '',
      'kk': '',
    },
  },
  // inmap
  {
    'qwgnxx2t': {
      'ru': 'Page Title',
      'en': '',
      'kk': '',
    },
    '7zjuhrue': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // bottomSheet
  {
    '30kdic0o': {
      'ru': 'Сессия забронирована!',
      'en': 'Session Booked!',
      'kk': 'Сеанс брондалған!',
    },
    '2l7szqw4': {
      'ru': 'Вы успешно забронировали сеанс на:',
      'en': 'You have successfully booked a session on:',
      'kk': 'Сіз сеансқа сәтті тапсырыс бердіңіз:',
    },
    'mtg13w5r': {
      'ru': 'Пн, 11 декабря 2021 г.',
      'en': 'Mon, Dec 11 - 2021',
      'kk': 'Пн, 11 желтоқсан 2021 ж.',
    },
  },
  // total
  {
    '34lcge50': {
      'ru': 'Весь заказ',
      'en': 'Order Total',
      'kk': 'Тапсырыс жиынтығы',
    },
    '6gpoijyd': {
      'ru':
          'Общая сумма вашего заказа представляет собой сводку всех товаров в вашем заказе за вычетом любых сборов и налогов, связанных с вашей покупкой.',
      'en':
          'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
      'kk':
          'Тапсырысыңыздың жалпы сомасы – сатып алуыңызға байланысты төлемдер мен салықтарды шегеріп тастағандағы тапсырысыңыздағы барлық элементтердің жиыны.',
    },
    'ddrp1qul': {
      'ru': 'Okay',
      'en': 'Okay',
      'kk': 'Okay',
    },
  },
  // changePhoto
  {
    'dcqxwkes': {
      'ru': ' Изменить аватар',
      'en': 'Change Profile Photo',
      'kk': 'Профиль фотосуретін өзгерту',
    },
    '0ik2ovkx': {
      'ru': 'Загрузить фото',
      'en': 'Upload Photo',
      'kk': 'Фотосуретті жүктеп салу',
    },
    'rpf2zc64': {
      'ru': 'Сохранить',
      'en': 'Save Photo',
      'kk': 'Фотосуретті сақтау',
    },
  },
  // reviewTrip
  {
    'drwq0ux2': {
      'ru': 'Оцените свою поездку',
      'en': 'Rate Your Trip',
      'kk': 'Сапарыңызды бағалаңыз',
    },
    'z41roh3e': {
      'ru': 'Дайте нам знать, что вы думаете о месте ниже!',
      'en': 'Let us know what you thought of the place below!',
      'kk': 'Төмендегі орын туралы не ойлағаныңызды бізге айтыңыз!',
    },
    'fn9hw688': {
      'ru': 'Как бы вы это оценили?',
      'en': 'How would you rate it?',
      'kk': 'Оған қандай баға берер едіңіз?',
    },
    'vhvh3bgy': {
      'ru': 'Пожалуйста, оставьте описание места...',
      'en': 'Please leave a description of the place...',
      'kk': 'Орынның сипаттамасын қалдырыңыз...',
    },
    'ee7ooep2': {
      'ru': 'Добавить отзыв',
      'en': 'Submit Review',
      'kk': 'Пікір жіберу',
    },
  },
  // changeMainPhoto
  {
    'x7rt2cqv': {
      'ru': 'Изменить основное фото',
      'en': 'Change Main Photo',
      'kk': 'Негізгі фотосуретті өзгерту',
    },
    '6m685i2h': {
      'ru': 'Загрузить фото',
      'en': 'Upload Photo',
      'kk': 'Фотосуретті жүктеп салу',
    },
    '26lq2qv8': {
      'ru': 'Сохранить фото',
      'en': 'Save Photo',
      'kk': 'Фотосуретті сақтау',
    },
  },
  // cancelTrip
  {
    'hkzr5o8l': {
      'ru': 'Отменить поездку',
      'en': 'Cancel Trip',
      'kk': 'Сапардан бас тарту',
    },
    'o1k2gvre': {
      'ru':
          'Если вы хотите отменить свою тройку, оставьте примечание ниже, чтобы отправить его хозяину.',
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'kk':
          'Егер сіз үштіктен бас тартқыңыз келсе, хостқа жіберу үшін төменде ескертпе қалдырыңыз.',
    },
    '5ljlrbus': {
      'ru': 'Ваша причина отмены...',
      'en': 'Your reason for cancelling...',
      'kk': 'Сіздің бас тарту себебіңіз...',
    },
    'vuzxfaug': {
      'ru': 'Да, отменить поездку',
      'en': 'Yes, Cancel Trip',
      'kk': 'Иә, сапардан бас тарту',
    },
    '8mocg5x9': {
      'ru': 'Неважно',
      'en': 'Never Mind',
      'kk': 'Бәрібір',
    },
  },
  // cancelTripHOST
  {
    'zpkjqmtr': {
      'ru': 'Отменить поездку',
      'en': 'Cancel Trip',
      'kk': 'Сапардан бас тарту',
    },
    'xoypdxsm': {
      'ru':
          'Если вы хотите отменить свою тройку, оставьте примечание ниже, чтобы отправить его хозяину.',
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'kk':
          'Егер сіз үштіктен бас тартқыңыз келсе, хостқа жіберу үшін төменде ескертпе қалдырыңыз.',
    },
    'a9cbbsnr': {
      'ru': 'Ваша причина отмены...',
      'en': 'Your reason for cancelling...',
      'kk': 'Сіздің бас тарту себебіңіз...',
    },
    'er07sf3e': {
      'ru': 'Да, отменить поездку',
      'en': 'Yes, Cancel Trip',
      'kk': 'Иә, сапардан бас тарту',
    },
    'c4mxbngq': {
      'ru': 'Неважно',
      'en': 'Never Mind',
      'kk': 'Бәрібір',
    },
  },
  // loading_Widget
  {
    'jq79ktti': {
      'ru': 'Analyzing your design file...',
      'en': '',
      'kk': '',
    },
    'hyk70yok': {
      'ru': 'This will take up to 30 seconds.',
      'en': '',
      'kk': '',
    },
  },
  // approval
  {
    'xzrcqzlu': {
      'ru': 'Отправьте заявку на Email',
      'en': '',
      'kk': '',
    },
    'bl5ym7y9': {
      'ru':
          'Одобрение руководства:\n1. Критерии: Согласно законодательству Казахстана, лицензия на деятельность гида не требуется, однако необходима профессиональная подготовка, подтвержденная соответствующими документами и организационно-правовой формой субъекта предпринимательской и туристической деятельности.\nНеобходимые документы:\n1) Заполненное заявление\n2) Заполненная карта-путеводитель.\n3) Копия удостоверения личности\n4) Копии сертификатов, удостоверений гида, дипломов и почетных грамот.\n5) Две фотографии 3х4.\n6) Оплата ежегодного членского взноса в размере Х тенге.\n7) Аккредитация КТА (Казахстанская Туристская Ассоциация)\n2. Послужной список – прошлый опыт работы.\n3. Собеседование – собеседование для лучшего понимания соискателя как личности.',
      'en': '',
      'kk': '',
    },
    'mcyu4ka5': {
      'ru': 'Отмена',
      'en': '',
      'kk': '',
    },
    'ee5j6olj': {
      'ru': 'Email',
      'en': '',
      'kk': '',
    },
  },
  // bottomLocation
  {
    'i3r68fgt': {
      'ru': 'Main Title',
      'en': '',
      'kk': '',
    },
    '65gp0aqf': {
      'ru': 'Subtitle for the needs of description',
      'en': '',
      'kk': '',
    },
    'yo9wftnf': {
      'ru': 'Edit',
      'en': '',
      'kk': '',
    },
    '15ktb2h0': {
      'ru': 'Return',
      'en': '',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    'w4rlzra7': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'me3vf0nr': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '9bhqluik': {
      'ru':
          'Чтобы улучшить ваш опыт, нам нужен доступ к вашему местоположению. Это помогает нам предоставлять персонализированные услуги с учетом местоположения.',
      'en': '',
      'kk': '',
    },
    'ltnztz9v': {
      'ru':
          'Будьте в курсе важных обновлений и персонализированного контента. Включите уведомления, чтобы улучшить ваш опыт.',
      'en': '',
      'kk': '',
    },
    'y9111x61': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'qhu91ggy': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '7wqz6ern': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ibhd1ax0': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '8yxfhvmi': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '08vbbo6n': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'veark6cg': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '4fq6oyo6': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'uzzqtg4w': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'unhrcxzw': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'gqxwnwdi': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ok5j9rwa': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'tqn7dltn': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'f2u90g61': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'b9dem8ni': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '64wdftdo': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'aed6vsm6': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'fqo62wv0': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'mtgwdouo': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ghd8hv0g': {
      'ru': '',
      'en': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));

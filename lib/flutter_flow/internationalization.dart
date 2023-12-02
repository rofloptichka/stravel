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
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    'sxl1p2xw': {
      'ru': 'Туры',
      'en': 'Tours',
      'kk': 'Турлар',
    },
    'jxre6gh9': {
      'ru': 'Достопримечательности',
      'en': 'Attractions',
      'kk': 'Аттракциондар',
    },
    'tznh6vgl': {
      'ru': 'Чаты',
      'en': 'Chats',
      'kk': 'Чаттар',
    },
    'nsmhpby5': {
      'ru': 'Профиль',
      'en': 'Profile',
      'kk': 'Профиль',
    },
    'xeva2i1w': {
      'ru': 'Войти',
      'en': 'To come in',
      'kk': 'Кіру үшін',
    },
    'kd32x8o5': {
      'ru': 'Регистрация',
      'en': 'Registration',
      'kk': 'Тіркеу',
    },
    'jdigm57j': {
      'ru': 'S-Travel',
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    '8b3ty4pf': {
      'ru': 'Добро пожаловать!',
      'en': 'Welcome!',
      'kk': 'Қош келдіңіз!',
    },
    'zfxtvfzz': {
      'ru': 'Найдите место проживания',
      'en': 'Find a place to live',
      'kk': 'Тұратын жер табыңыз',
    },
    'm7ek5bq9': {
      'ru': 'Жилье',
      'en': 'Housing',
      'kk': 'Тұрғын үй',
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
      'en': 'Rating',
      'kk': 'Рейтинг',
    },
    '8udvns4v': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // chatDetails
  {
    '54zz186b': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // chatMain
  {
    'suhuu25m': {
      'ru': 'Чаты',
      'en': 'Chats',
      'kk': 'Чаттар',
    },
    'a42jzwb0': {
      'ru': 'Туры и гиды',
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
      'en': 'Trip Details',
      'kk': 'Сапар мәліметтері',
    },
    'ayzn5q5r': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    'aelhwatf': {
      'ru': 'Ваша поездка успешно окончена!',
      'en': 'Your trip is successfully over!',
      'kk': 'Сапарыңыз сәтті аяқталды!',
    },
    'c4r8ww4g': {
      'ru': 'Оставить отзыв',
      'en': 'Leave feedback',
      'kk': 'Пікір қалдыру',
    },
    'nz5vx3l8': {
      'ru': 'Информация о хосте',
      'en': 'Host information',
      'kk': 'Хост туралы ақпарат',
    },
    '93jvmq7z': {
      'ru': 'Чат',
      'en': 'Chat',
      'kk': 'Чат',
    },
    'fq81beil': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
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
      'kk': 'Сипаттама',
    },
    'm5x9if6o': {
      'ru': 'Удобства',
      'en': 'Facilities',
      'kk': 'Нысандар',
    },
    'f9xx17mn': {
      'ru': 'Что говорят люди',
      'en': 'What people say',
      'kk': 'Адамдар не дейді',
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
          'It is important to take care of the patient, to follow the doctor, but this is a time of great pain and suffering. Over the years I will come.',
      'kk':
          'Науқасқа күтім жасау, дәрігердің соңынан еру маңызды, бірақ бұл өте азап пен азапты уақыт. Жылдар өте келе келемін.',
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
          'It is important to take care of the patient, to follow the doctor, but this is a time of great pain and suffering. Over the years I will come.',
      'kk':
          'Науқасқа күтім жасау, дәрігердің соңынан еру маңызды, бірақ бұл өте азап пен азапты уақыт. Жылдар өте келе келемін.',
    },
    'gjpkvt9j': {
      'ru': '+ налоги/сборы',
      'en': '+ taxes/fees',
      'kk': '+ салықтар/алымдар',
    },
    'z0fcpc6w': {
      'ru': 'За ночь',
      'en': 'Per night',
      'kk': 'Түнде',
    },
    '9bn571om': {
      'ru': 'Забронировать сейчас',
      'en': 'Book now',
      'kk': 'Қазір тапсырыс беріңіз',
    },
    'lsvarks8': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'kk': 'Өңдеу',
    },
    'uv3sg0lr': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // profilePage
  {
    'dwoy26tj': {
      'ru': 'Светлая',
      'en': 'Light',
      'kk': 'Жарық',
    },
    '2xtnqh6u': {
      'ru': 'Темная',
      'en': 'Dark',
      'kk': 'Қараңғы',
    },
    '6kv1a9yn': {
      'ru': 'Выбор языка',
      'en': 'Language selection',
      'kk': 'Тіл таңдау',
    },
    'ppdwl411': {
      'ru': 'Рус',
      'en': 'Rus',
      'kk': 'орыс',
    },
    'em3tkegd': {
      'ru': 'Қаз',
      'en': 'Kaz',
      'kk': 'Қаз',
    },
    'x7a0gm8n': {
      'ru': 'Eng',
      'en': 'Eng',
      'kk': 'Аг',
    },
    'tiug0vmt': {
      'ru': 'Сгенирировать маршрут',
      'en': 'Generate route',
      'kk': 'Маршрутты құру',
    },
    '7pt0m9mb': {
      'ru': 'Изменить данные аккаунта',
      'en': 'Change account details',
      'kk': 'Есептік жазба мәліметтерін өзгерту',
    },
    'j07orxzz': {
      'ru': 'Информация об оплате',
      'en': 'Payment Information',
      'kk': 'Төлем туралы ақпарат',
    },
    'nnu1c5kq': {
      'ru': 'Изменить пароль',
      'en': 'Change password',
      'kk': 'Құпия сөзді өзгерту',
    },
    'n3dir3pn': {
      'ru': 'Моя собственность',
      'en': 'My property',
      'kk': 'Менің мүлкім',
    },
    'a3zkb3w2': {
      'ru': 'Мои маршруты',
      'en': 'My routes',
      'kk': 'Менің маршруттарым',
    },
    'qkh53sb8': {
      'ru': 'Бронирования моих туров',
      'en': 'Booking my tours',
      'kk': 'Турларымды брондау',
    },
    'p65qj9dy': {
      'ru': 'Хочешь стать гидом?',
      'en': 'Do you want to become a guide?',
      'kk': 'Сіз гид болғыңыз келе ме?',
    },
    '1wkp5wup': {
      'ru': 'Добавить Отзыв',
      'en': '',
      'kk': '',
    },
    '3cf876eu': {
      'ru': 'SOS',
      'en': '',
      'kk': '',
    },
    'pglw0zv3': {
      'ru': 'Профиль',
      'en': 'Profile',
      'kk': 'Профиль',
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
      'en': 'Select travel dates',
      'kk': 'Саяхат күндерін таңдаңыз',
    },
    '45xiza15': {
      'ru': 'Количество людей',
      'en': 'Number of people',
      'kk': 'Адамдар саны',
    },
    'ru1nnosa': {
      'ru': 'Данные оплаты',
      'en': 'Payment details',
      'kk': 'Төлем мәліметтері',
    },
    'q5ru22ip': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'rlgv6kse': {
      'ru': 'Бронировать сейчас',
      'en': 'Book now',
      'kk': 'Қазір тапсырыс беріңіз',
    },
    'tjxehwww': {
      'ru': 'Бронировать сейчас',
      'en': 'Book now',
      'kk': 'Қазір тапсырыс беріңіз',
    },
    '5knmh1x9': {
      'ru': 'Главная ',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // editProfile
  {
    'bvdwitkc': {
      'ru': 'Изменить фото',
      'en': 'Change photo',
      'kk': 'Фотосуретті өзгерту',
    },
    '0x5x5kvo': {
      'ru': 'Имя',
      'en': 'Name',
      'kk': 'Аты',
    },
    'cridql3t': {
      'ru': 'Имя',
      'en': 'Name',
      'kk': 'Аты',
    },
    'dkk5qpeu': {
      'ru': 'Почтовый Адрес',
      'en': 'Mailing address',
      'kk': 'Пошталық мекенжай',
    },
    'u252oxgy': {
      'ru': 'Your email..',
      'en': 'Your email..',
      'kk': 'Сіздің электрондық поштаңыз..',
    },
    '1q1bu5vy': {
      'ru': 'Сохранить Изменения',
      'en': 'Save Changes',
      'kk': 'Өзгерістерді сақтау',
    },
    'nrduqolk': {
      'ru': 'Изменить аккаунт',
      'en': 'Change account',
      'kk': 'Есептік жазбаны өзгерту',
    },
    'iwrla7te': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
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
      'en': 'Payment Details',
      'kk': 'Төлем мәліметтері',
    },
    'kvf00uh2': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // changePassword
  {
    'y5d4bisx': {
      'ru': 'Почтовый Адрес',
      'en': 'Mailing address',
      'kk': 'Пошталық мекенжай',
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
      'en': 'Change password',
      'kk': 'Құпия сөзді өзгерту',
    },
    'lpx2ctcg': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // myProperties
  {
    '255o2ieq': {
      'ru': 'Price Per Night',
      'en': 'Price Per Night',
      'kk': 'Бір түннің бағасы',
    },
    'pjub4tp1': {
      'ru': 'Мои собственности',
      'en': 'My properties',
      'kk': 'Менің қасиеттерім',
    },
    'lgenirci': {
      'ru': 'My Trips',
      'en': 'My Trips',
      'kk': 'Менің сапарларым',
    },
  },
  // myBookings
  {
    'b57v5fiu': {
      'ru': 'Предстоящие',
      'en': 'Upcoming',
      'kk': 'Алдағы',
    },
    '823gc06f': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    'v5n3i85i': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'nwnd7bq3': {
      'ru': 'Выполнено',
      'en': 'Done',
      'kk': 'Дайын',
    },
    'xodzsj4p': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    'ftwb839r': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'yss1vakl': {
      'ru': 'Бронирования моих туров',
      'en': 'Booking my tours',
      'kk': 'Турларымды брондау',
    },
    'odz9ot67': {
      'ru': 'Мои Поездки',
      'en': 'My Trips',
      'kk': 'Менің сапарларым',
    },
  },
  // Route
  {
    'swttl0zp': {
      'ru': 'Детали',
      'en': 'Details',
      'kk': 'Егжей',
    },
    'g6gksweh': {
      'ru': 'Покушать',
      'en': 'Eat',
      'kk': 'Тамақ',
    },
    'ojkp7mva': {
      'ru': 'Покушать',
      'en': 'Eat',
      'kk': 'Тамақ',
    },
    '1m2nmuuz': {
      'ru': 'Покушать',
      'en': 'Eat',
      'kk': 'Тамақ',
    },
    'd34fw77u': {
      'ru': 'Детали',
      'en': 'Details',
      'kk': 'Егжей',
    },
    '5w3yd1tx': {
      'ru': 'SOS',
      'en': 'SOS',
      'kk': 'SOS',
    },
    'poupr4bd': {
      'ru': 'Маршрут',
      'en': 'Route',
      'kk': 'Маршрут',
    },
    'id3k2i57': {
      'ru': 'Route',
      'en': 'Route',
      'kk': 'Маршрут',
    },
  },
  // SignUp
  {
    'jzyffzx6': {
      'ru': 'S-Travel',
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    'jix54s8k': {
      'ru': 'Создать аккаунт',
      'en': 'Create an account',
      'kk': 'Аккаунты құру',
    },
    'ha3y0ku2': {
      'ru': 'Заполните поля',
      'en': 'Fill in the fields',
      'kk': 'Өрістерді толтырыңыз',
    },
    'd8fb6ad2': {
      'ru': 'Почта',
      'en': 'Mail',
      'kk': 'Пошта',
    },
    '1iu58zs2': {
      'ru': 'Пароль',
      'en': 'Password',
      'kk': 'Құпия сөз',
    },
    'fnqciyrd': {
      'ru': 'Подтвердить пароль',
      'en': 'Confirm password',
      'kk': 'Құпия сөзді Растау',
    },
    'w1djerl5': {
      'ru': 'Турист',
      'en': 'Tourist',
      'kk': 'Турист',
    },
    '6zd63rl2': {
      'ru': 'Гид',
      'en': 'Guide',
      'kk': 'Гид',
    },
    'xv6e74z4': {
      'ru': 'Арендодатель',
      'en': 'Landlord',
      'kk': 'Үй иесі',
    },
    'd42g24lq': {
      'ru': 'Выбрать...',
      'en': 'Choose...',
      'kk': 'Таңдау...',
    },
    '7ayen6m2': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'vxi0814z': {
      'ru': 'Создать',
      'en': 'Create',
      'kk': 'Жасау',
    },
    's1eebz2w': {
      'ru': 'Уже есть аккаунть? ',
      'en': 'Already have an account?',
      'kk': 'Есептік жазбаңыз бар ма?',
    },
    'dyidwsqy': {
      'ru': 'Войдите тут',
      'en': 'Login here',
      'kk': 'Мұнда кіріңіз',
    },
    '4p4dlj76': {
      'ru': 'ИЛИ',
      'en': 'OR',
      'kk': 'НЕМЕСЕ',
    },
    'jiwzewow': {
      'ru': 'Продолжить с Google',
      'en': 'Continue with Google',
      'kk': 'Google арқылы жалғастырыңыз',
    },
    'flmcpgf5': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // myTrips
  {
    'nmbsz2pf': {
      'ru': 'Поездки',
      'en': 'Trips',
      'kk': 'Сапарлар',
    },
    'u6ih7oa7': {
      'ru': 'Предстоящие',
      'en': 'Upcoming',
      'kk': 'Алдағы',
    },
    'ya3l1por': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    '8gbvaaq7': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'bjdl1whd': {
      'ru': 'Любимые',
      'en': 'Favorites',
      'kk': 'Таңдаулылар',
    },
    'pyu0ly7l': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    '8xuuzq87': {
      'ru': 'Мои Поездки',
      'en': 'My Trips',
      'kk': 'Менің сапарларым',
    },
  },
  // SignIn
  {
    'kpieb3wi': {
      'ru': 'S-Travel',
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    '7c7ulx6d': {
      'ru': 'С возвращением',
      'en': 'Welcome back',
      'kk': 'Оралуыңмен',
    },
    'sw6l6a91': {
      'ru': 'Заполните поля',
      'en': 'Fill in the fields',
      'kk': 'Өрістерді толтырыңыз',
    },
    '5n09km7d': {
      'ru': 'Почта',
      'en': 'Mail',
      'kk': 'Пошта',
    },
    'vopifdik': {
      'ru': 'Пароль',
      'en': 'Password',
      'kk': 'Құпия сөз',
    },
    '62vjnv8n': {
      'ru': 'Войти',
      'en': 'To come in',
      'kk': 'Кіру үшін',
    },
    '4iajyzn2': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
      'kk': 'Құпия сөзіңізді ұмыттыңыз ба?',
    },
    'awvgs4pl': {
      'ru': 'Нет аккаунта?  ',
      'en': 'Don\'t have an account?',
      'kk': 'Есептік жазбаңыз жоқ па?',
    },
    '6ctfkg38': {
      'ru': 'Создайте его здесь',
      'en': 'Create it here',
      'kk': 'Оны осында жасаңыз',
    },
    'kyfcuvxj': {
      'ru': 'ИЛИ',
      'en': 'OR',
      'kk': 'НЕМЕСЕ',
    },
    'r5yybpuo': {
      'ru': 'Продолжить с Google',
      'en': 'Continue with Google',
      'kk': 'Google арқылы жалғастырыңыз',
    },
    '6rcvu8vi': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // reviewPlace
  {
    '29c0zlfv': {
      'ru': ' - ',
      'en': '-',
      'kk': '-',
    },
    'emq3imz9': {
      'ru': 'Отправить отзыв',
      'en': 'Post a review',
      'kk': 'Пікір қалдыру',
    },
    'fp6p0t4o': {
      'ru': 'Выберите место',
      'en': 'Select a location',
      'kk': 'Орынды таңдаңыз',
    },
    'ziiljxcn': {
      'ru': 'Поездки',
      'en': 'Trips',
      'kk': 'Сапарлар',
    },
  },
  // UploadProperty
  {
    'vau23kuu': {
      'ru': 'Название жилья',
      'en': 'Property name',
      'kk': 'Меншік атауы',
    },
    'ckyo32of': {
      'ru': 'Описание',
      'en': 'Description',
      'kk': 'Сипаттама',
    },
    'mun315im': {
      'ru': 'Отель',
      'en': 'Hotel',
      'kk': 'Қонақ үй',
    },
    'weqw8jfe': {
      'ru': 'Хостел',
      'en': 'Hostel',
      'kk': 'Жатақхана',
    },
    'q7oyrfdq': {
      'ru': 'Дом',
      'en': 'House',
      'kk': 'үй',
    },
    '61yakelq': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'kk': 'Пәтер',
    },
    'j6989uui': {
      'ru': 'Выберите тип жилья..',
      'en': 'Select type of accommodation..',
      'kk': 'Тұру түрін таңдаңыз..',
    },
    'd9xnxeyo': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'xaq2jypi': {
      'ru': 'Адрес',
      'en': 'Address',
      'kk': 'Мекенжай',
    },
    'rereo5fm': {
      'ru': 'Цена для одного человека',
      'en': 'Price for one person',
      'kk': 'Бір адамға арналған баға',
    },
    'zdd2bv23': {
      'ru': 'Скидка (%)',
      'en': 'Discount (%)',
      'kk': 'Жеңілдік (%)',
    },
    'i2tcika3': {
      'ru': '0',
      'en': '0',
      'kk': '0',
    },
    'bhjwy9md': {
      'ru': 'Select Location',
      'en': 'Select Location',
      'kk': 'Орын таңдаңыз',
    },
    'ahzxystq': {
      'ru': 'Удобства',
      'en': 'Facilities',
      'kk': 'Нысандар',
    },
    '15mj8ja1': {
      'ru': 'Отправить',
      'en': 'Send',
      'kk': 'Жіберу',
    },
    'xwjus4cz': {
      'ru': 'Добавить жилье',
      'en': 'Add accommodation',
      'kk': 'Тұрғын үйді қосыңыз',
    },
    'pc5bahim': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // forgot
  {
    'l4wn804v': {
      'ru': 'Почтовый Адрес',
      'en': 'Mailing address',
      'kk': 'Пошталық мекенжай',
    },
    'gzr7ao06': {
      'ru': 'Your email..',
      'en': 'Your email..',
      'kk': 'Сіздің электрондық поштаңыз..',
    },
    'vwr4xf7a': {
      'ru': 'Отправить заявку',
      'en': 'Send a request',
      'kk': 'Өтінім жіберу',
    },
    '3v3lllc6': {
      'ru': 'Забыли пароль',
      'en': 'Forgot your password',
      'kk': 'Құпия сөзіңізді ұмыттыңыз ба',
    },
    'zsznbdvr': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // EditProperty
  {
    'enip6g6q': {
      'ru': 'Название жилья',
      'en': 'Property name',
      'kk': 'Меншік атауы',
    },
    'xj8oezff': {
      'ru': 'Описание',
      'en': 'Description',
      'kk': 'Сипаттама',
    },
    'qzeqs1a9': {
      'ru': 'Отель',
      'en': 'Hotel',
      'kk': 'Қонақ үй',
    },
    '03zz0cfu': {
      'ru': 'Хостел',
      'en': 'Hostel',
      'kk': 'Жатақхана',
    },
    '3r5klwyx': {
      'ru': 'Дом',
      'en': 'House',
      'kk': 'үй',
    },
    'sf2z9ckn': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'kk': 'Пәтер',
    },
    'iqqdhv0j': {
      'ru': 'Выберите тип жилья..',
      'en': 'Select type of accommodation..',
      'kk': 'Тұру түрін таңдаңыз..',
    },
    'acth1hva': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '09v7r6ma': {
      'ru': 'Адрес',
      'en': 'Address',
      'kk': 'Мекенжай',
    },
    'umwu4s92': {
      'ru': 'Цена для одного человека',
      'en': 'Price for one person',
      'kk': 'Бір адамға арналған баға',
    },
    'o4uv12zm': {
      'ru': 'Скидка (%)',
      'en': 'Discount (%)',
      'kk': 'Жеңілдік (%)',
    },
    'r48sn1vh': {
      'ru': 'Выбрать местоположение',
      'en': 'Select location',
      'kk': 'Орынды таңдаңыз',
    },
    '11bf1g76': {
      'ru': 'Удобства',
      'en': 'Facilities',
      'kk': 'Нысандар',
    },
    '0j9zy2aj': {
      'ru': 'Сохранить',
      'en': 'Save',
      'kk': 'Сақтау',
    },
    '0gnuc7fu': {
      'ru': 'Редактировать жилье',
      'en': 'Edit accommodation',
      'kk': 'Тұрғын үйді өңдеу',
    },
    '0za4wbgm': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // inmap
  {
    'qwgnxx2t': {
      'ru': 'Карта достопримечательностей',
      'en': 'Attractions map',
      'kk': 'Көрнекті жерлер картасы',
    },
    '7zjuhrue': {
      'ru': 'Map',
      'en': 'Map',
      'kk': 'Карта',
    },
  },
  // Test
  {
    '8p26qz5y': {
      'ru': 'Где вы планируете отдыхать?',
      'en': 'Where are you planning to vacation?',
      'kk': 'Сіз қайда демалуды жоспарлап отырсыз?',
    },
    '1z4i9ipf': {
      'ru': 'Алматы',
      'en': 'Almaty',
      'kk': 'Алматы',
    },
    'mckehslo': {
      'ru': 'Актау',
      'en': 'Aktau',
      'kk': 'Ақтау',
    },
    '861v66oj': {
      'ru': ' Астана',
      'en': '',
      'kk': '',
    },
    'gupyg6do': {
      'ru': 'Город',
      'en': 'City',
      'kk': 'Қала',
    },
    'sb6mz4b1': {
      'ru': 'Найти город..',
      'en': 'Find a city..',
      'kk': 'Қала тап..',
    },
    'ur439r7u': {
      'ru': 'Где вы планируете жить во время поездки?',
      'en': 'Where are you planning to stay during your trip?',
      'kk': 'Сапарыңыз кезінде қайда тұруды жоспарлайсыз?',
    },
    'pzwzeki3': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'kk': 'Пәтер',
    },
    'a5f5keup': {
      'ru': 'Дом',
      'en': 'House',
      'kk': 'үй',
    },
    't5x09zql': {
      'ru': 'Отель',
      'en': 'Hotel',
      'kk': 'Қонақ үй',
    },
    '37fu5313': {
      'ru': 'Хостел',
      'en': 'Hostel',
      'kk': 'Жатақхана',
    },
    'rwkjnv4p': {
      'ru': 'Вид жилья',
      'en': 'Type of housing',
      'kk': 'Тұрғын үй түрі',
    },
    'toygl5ea': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'g33hlkcv': {
      'ru': 'Какой у вас бюджет на жилье?',
      'en': 'What is your housing budget?',
      'kk': 'Сіздің тұрғын үй бюджетіңіз қандай?',
    },
    '19dh1yah': {
      'ru': 'До 50,000 тенге',
      'en': 'Up to 50,000 tenge',
      'kk': '50 000 теңгеге дейін',
    },
    'fvere9cl': {
      'ru': '50-100,000 тенге',
      'en': '50-100,000 tenge',
      'kk': '50-100 000 теңге',
    },
    'sk0k6cq8': {
      'ru': '100-200,000 тенге',
      'en': '100-200,000 tenge',
      'kk': '100-200 000 теңге',
    },
    '1qkcukp8': {
      'ru': '200-500,000 тенге',
      'en': '200-500,000 tenge',
      'kk': '200-500 000 теңге',
    },
    'rnvhzywe': {
      'ru': '500-1,000,000 тенге',
      'en': '500-1,000,000 tenge',
      'kk': '500-1 000 000 теңге',
    },
    '0oyj1jx2': {
      'ru': 'Более 1,000,000 тенге',
      'en': 'More than 1,000,000 tenge',
      'kk': '1 000 000 теңгеден астам',
    },
    'z7c9w19n': {
      'ru': 'Выберите бюджет..',
      'en': 'Select your budget..',
      'kk': 'Бюджетіңізді таңдаңыз..',
    },
    'xd2jj0ln': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'dui0alpl': {
      'ru': 'Какой вы хотели бы средний чек на еду(на одного)?',
      'en': 'What would you like to be the average food bill (per person)?',
      'kk': 'Орташа азық-түлік шотының (бір адамға) қандай болғанын қалайсыз?',
    },
    's2spzho3': {
      'ru': 'У меня есть своя еда',
      'en': 'I have my own food',
      'kk': 'Менің өз тамағым бар',
    },
    '77jpk11y': {
      'ru': 'До 1,000 тенге',
      'en': 'Up to 1,000 tenge',
      'kk': '1000 теңгеге дейін',
    },
    '6xcnuddc': {
      'ru': '2-5,000 тенге',
      'en': '2-5,000 tenge',
      'kk': '2-5000 теңге',
    },
    'unuswkl0': {
      'ru': '5-10,000 тенге',
      'en': '5-10,000 tenge',
      'kk': '5-10 000 теңге',
    },
    'xssd1auq': {
      'ru': '10-20,000 тенге',
      'en': '10-20,000 tenge',
      'kk': '10-20 000 теңге',
    },
    's6nm6tqs': {
      'ru': 'Более 20,000 тенге',
      'en': 'More than 20,000 tenge',
      'kk': '20 000 теңгеден жоғары',
    },
    'a4dveex6': {
      'ru': 'Выберите бюджет..',
      'en': 'Select your budget..',
      'kk': 'Бюджетіңізді таңдаңыз..',
    },
    'yzwoep8f': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'drh7fzu5': {
      'ru': 'Сколько вы готовы тратить на развлечения?',
      'en': 'How much are you willing to spend on entertainment?',
      'kk': 'Сіз ойын-сауыққа қанша жұмсауға дайынсыз?',
    },
    'djmdvz3c': {
      'ru': '0 тенге',
      'en': '0 tenge',
      'kk': '0 теңге',
    },
    'ck6gbjzt': {
      'ru': 'До 1,000 тенге',
      'en': 'Up to 1,000 tenge',
      'kk': '1000 теңгеге дейін',
    },
    'reb4kktf': {
      'ru': '2-5,000 тенге',
      'en': '2-5,000 tenge',
      'kk': '2-5000 теңге',
    },
    'gs9fdnep': {
      'ru': '5-10,000 тенге',
      'en': '5-10,000 tenge',
      'kk': '5-10 000 теңге',
    },
    'w2pbnnjg': {
      'ru': '10-20,000 тенге',
      'en': '10-20,000 tenge',
      'kk': '10-20 000 теңге',
    },
    'jbhi6lvh': {
      'ru': 'Более 20,000 тенге',
      'en': 'More than 20,000 tenge',
      'kk': '20 000 теңгеден жоғары',
    },
    'ua0pi83f': {
      'ru': 'Выберите бюджет..',
      'en': 'Select your budget..',
      'kk': 'Бюджетіңізді таңдаңыз..',
    },
    'g2i6g280': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '6sl656rs': {
      'ru': 'Какой вид активностей вам больше всего нравится?',
      'en': 'What type of activity do you enjoy most?',
      'kk': 'Сізге қай әрекет түрі көбірек ұнайды?',
    },
    '6v7ovdcm': {
      'ru': 'Выставки',
      'en': 'Exhibitions',
      'kk': 'Көрмелер',
    },
    '4tkf3tyg': {
      'ru': 'Концерт',
      'en': 'Concerts',
      'kk': 'Концерттер',
    },
    '6q4559o6': {
      'ru': 'Стендапы',
      'en': 'Stand-ups',
      'kk': 'Стенд-аптар',
    },
    'xflu0jig': {
      'ru': 'Фестивали',
      'en': 'Festivals',
      'kk': 'Фестивальдар',
    },
    'om3lfukv': {
      'ru': 'Шоу',
      'en': 'Show',
      'kk': 'Көрсету',
    },
    '0a2fuibl': {
      'ru': 'Когда вы планируете отдыхать?',
      'en': 'When are you planning to vacation?',
      'kk': 'Сіз демалысты қашан жоспарлайсыз?',
    },
    'jx1mkjas': {
      'ru': 'Каким будет название для вашего маршрута',
      'en': 'What will be the name for your route?',
      'kk': 'Сіздің маршрутыңыз қалай аталады?',
    },
    '1lizenva': {
      'ru': 'Название маршрута..',
      'en': 'Route name...',
      'kk': 'Маршрут атауы...',
    },
    '90lmui2h': {
      'ru': 'Пройдите тест',
      'en': 'Take the test',
      'kk': 'Тест тапсырыңыз',
    },
    'e2rq419l': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // sightDetails
  {
    'gsvjsed5': {
      'ru': 'Обзоры',
      'en': 'Reviews',
      'kk': 'Пікірлер',
    },
    'a7bhmqx0': {
      'ru': 'Описание',
      'en': 'Description',
      'kk': 'Сипаттама',
    },
    'lwpe9dru': {
      'ru': 'Что говорят люди',
      'en': 'What people say',
      'kk': 'Адамдар не дейді',
    },
    'h4jntu4o': {
      'ru': 'Джош Ричардсон',
      'en': 'Josh Richardson',
      'kk': 'Джош Ричардсон',
    },
    'bfjg5zym': {
      'ru':
          'Важно заботиться о пациенте, следить за врачом, но это время великой боли и страданий. С годами я приду.',
      'en':
          'It is important to take care of the patient, to follow the doctor, but this is a time of great pain and suffering. Over the years I will come.',
      'kk':
          'Науқасқа күтім жасау, дәрігердің соңынан еру маңызды, бірақ бұл өте азап пен азапты уақыт. Жылдар өте келе келемін.',
    },
    'xt720o9f': {
      'ru': 'Джош Ричардсон',
      'en': 'Josh Richardson',
      'kk': 'Джош Ричардсон',
    },
    'fc3f8grq': {
      'ru':
          'Важно заботиться о пациенте, следить за врачом, но это время великой боли и страданий. С годами я приду.',
      'en':
          'It is important to take care of the patient, to follow the doctor, but this is a time of great pain and suffering. Over the years I will come.',
      'kk':
          'Науқасқа күтім жасау, дәрігердің соңынан еру маңызды, бірақ бұл өте азап пен азапты уақыт. Жылдар өте келе келемін.',
    },
    'c4mgwz97': {
      'ru': '71 267,52₸',
      'en': '71,267.52₸',
      'kk': '71 267,52₸',
    },
    'q9jahbo1': {
      'ru': '+ налоги/сборы',
      'en': '+ taxes/fees',
      'kk': '+ салықтар/алымдар',
    },
    'bvlh91sf': {
      'ru': 'За ночь',
      'en': 'Per night',
      'kk': 'Түнде',
    },
    'ds4b6rs8': {
      'ru': 'Найти туры',
      'en': 'Find tours',
      'kk': 'Турларды табыңыз',
    },
    'mj0l4y6b': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // sights
  {
    'gnw13kju': {
      'ru': 'S-Travel',
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    'b2wf67js': {
      'ru': 'Туры',
      'en': 'Tours',
      'kk': 'Турлар',
    },
    '46gihy52': {
      'ru': 'Достопримечательности',
      'en': 'Attractions',
      'kk': 'Аттракциондар',
    },
    'sd8texcj': {
      'ru': 'Чаты',
      'en': 'Chats',
      'kk': 'Чаттар',
    },
    'ghuv3s5z': {
      'ru': 'Профиль',
      'en': 'Profile',
      'kk': 'Профиль',
    },
    'adk7yqsw': {
      'ru': 'Войти',
      'en': 'To come in',
      'kk': 'Кіру үшін',
    },
    'pr7h87mq': {
      'ru': 'Регистрация',
      'en': 'Registration',
      'kk': 'Тіркеу',
    },
    'm01uzrhi': {
      'ru': 'S-Travel',
      'en': 'S-Travel',
      'kk': 'S-Travel',
    },
    '23c5pq0c': {
      'ru': 'Добро пожаловать!',
      'en': 'Welcome!',
      'kk': 'Қош келдіңіз!',
    },
    'vveng7ys': {
      'ru': 'Найдите место своей мечты для отдыха',
      'en': 'Find your dream holiday destination',
      'kk': 'Сіздің арманыңыздағы демалыс орнын табыңыз',
    },
    '1u04u5m2': {
      'ru': 'Достопримечательности',
      'en': 'Attractions',
      'kk': 'Аттракциондар',
    },
    '2hbbx8ri': {
      'ru': 'Поиск',
      'en': 'Search',
      'kk': 'Іздеу',
    },
    '5f5z282s': {
      'ru': 'Рейтинг',
      'en': 'Rating',
      'kk': 'Рейтинг',
    },
    'n1iqvt55': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'үй',
    },
  },
  // Tours
  {
    '7x3u2772': {
      'ru': 'Найти туров и гидов',
      'en': 'Add Tours or Guides',
      'kk': 'Турларды немесе гидтерді қосыңыз',
    },
    'j529zhu7': {
      'ru': 'Найти туры..',
      'en': 'Search Tours...',
      'kk': 'Турларды іздеу...',
    },
    'b6su1taq': {
      'ru': 'Туры',
      'en': 'Tours',
      'kk': 'Турлар',
    },
    'sni27vdd': {
      'ru': 'UserName',
      'en': 'UserName',
      'kk': 'Пайдаланушы аты',
    },
    '7hmpebxu': {
      'ru': 'Remove',
      'en': 'Remove',
      'kk': 'Жою',
    },
    'hzxiwve9': {
      'ru': 'UserName',
      'en': 'UserName',
      'kk': 'Пайдаланушы аты',
    },
    'r9wtpnno': {
      'ru': 'Remove',
      'en': 'Remove',
      'kk': 'Жою',
    },
    'jzaetgmf': {
      'ru': 'Гиды',
      'en': 'Guides',
      'kk': 'Гидтер',
    },
    'yuyrupjw': {
      'ru': 'Chat',
      'en': 'Chat',
      'kk': 'Чат',
    },
    'jkue48gr': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // List06UserSearch
  {
    'gec77h5m': {
      'ru': 'Add Members',
      'en': 'Add Members',
      'kk': 'Мүшелерді қосу',
    },
    'qmqwmo7q': {
      'ru': 'Search members...',
      'en': 'Search members...',
      'kk': 'Мүшелерді іздеу...',
    },
    'cth0b10z': {
      'ru': 'Members in Project',
      'en': 'Members in Project',
      'kk': 'Жобадағы мүшелер',
    },
    '4wyew7gd': {
      'ru': 'UserName',
      'en': 'UserName',
      'kk': 'Пайдаланушы аты',
    },
    'o65rdkqo': {
      'ru': 'Remove',
      'en': 'Remove',
      'kk': 'Жою',
    },
    'wl7rgy8i': {
      'ru': 'UserName',
      'en': 'UserName',
      'kk': 'Пайдаланушы аты',
    },
    'pxkzjuc4': {
      'ru': 'Remove',
      'en': 'Remove',
      'kk': 'Жою',
    },
    'wpv2b446': {
      'ru': 'UserName',
      'en': 'UserName',
      'kk': 'Пайдаланушы аты',
    },
    'td3096qc': {
      'ru': 'Remove',
      'en': 'Remove',
      'kk': 'Жою',
    },
    '2ysxwfta': {
      'ru': 'Add Members',
      'en': 'Add Members',
      'kk': 'Мүшелерді қосу',
    },
    '4mq7zbuk': {
      'ru': 'user@domainname.com',
      'en': 'user@domainname.com',
      'kk': 'user@domainname.com',
    },
    '4z5hpxbf': {
      'ru': 'View',
      'en': 'View',
      'kk': 'Көру',
    },
    'vr00e0qu': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // myRoutes
  {
    '08mf8imb': {
      'ru': 'Мои Маршруты',
      'en': 'My Routes',
      'kk': 'Менің маршруттарым',
    },
    'z7xwmkxy': {
      'ru': 'Предстоящие',
      'en': 'Upcoming',
      'kk': 'Алдағы',
    },
    'ienoru05': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    'it9sgdif': {
      'ru': 'Завершенные',
      'en': 'Completed',
      'kk': 'Аяқталды',
    },
    '4hkw9swy': {
      'ru': 'Итого',
      'en': 'Total',
      'kk': 'Барлығы',
    },
    '28e6xrak': {
      'ru': 'Мои Поездки',
      'en': 'My Trips',
      'kk': 'Менің сапарларым',
    },
  },
  // bottomSheet
  {
    '30kdic0o': {
      'ru': 'Сессия забронирована!',
      'en': 'Session booked!',
      'kk': 'Сеанс жазылды!',
    },
    '2l7szqw4': {
      'ru': 'Вы успешно забронировали сеанс на:',
      'en': 'You have successfully booked a session for:',
      'kk': 'Сіз сеансқа сәтті тапсырыс бердіңіз:',
    },
    'mtg13w5r': {
      'ru': 'Пн, 11 декабря 2021 г.',
      'en': 'Mon, Dec 11, 2021',
      'kk': 'Дүйсенбі, 11 желтоқсан, 2021 жыл',
    },
  },
  // changePhoto
  {
    'dcqxwkes': {
      'ru': ' Изменить аватар',
      'en': 'Change avatar',
      'kk': 'Аватарды өзгерту',
    },
    '0ik2ovkx': {
      'ru': 'Загрузить фото',
      'en': 'Upload a photo',
      'kk': 'Фото жүктеп салыңыз',
    },
    'rpf2zc64': {
      'ru': 'Сохранить',
      'en': 'Save',
      'kk': 'Сақтау',
    },
  },
  // reviewTrip
  {
    'drwq0ux2': {
      'ru': 'Оцените свою поездку',
      'en': 'Rate your trip',
      'kk': 'Сапарыңызды бағалаңыз',
    },
    'z41roh3e': {
      'ru': 'Дайте нам знать, что вы думаете о месте ниже!',
      'en': 'Let us know what you think of the place below!',
      'kk': 'Төмендегі орын туралы не ойлайтыныңызды бізге айтыңыз!',
    },
    'fn9hw688': {
      'ru': 'Как бы вы это оценили?',
      'en': 'How would you rate it?',
      'kk': 'Сіз оны қалай бағалар едіңіз?',
    },
    'vhvh3bgy': {
      'ru': 'Пожалуйста, оставьте описание места...',
      'en': 'Please leave a description of the place...',
      'kk': 'Орынның сипаттамасын қалдырыңыз...',
    },
    'ee7ooep2': {
      'ru': 'Добавить',
      'en': 'Add a review',
      'kk': 'Пікір қосу',
    },
    'z5kbbwov': {
      'ru': 'Сгенерировать',
      'en': '',
      'kk': '',
    },
  },
  // changeMainPhoto
  {
    'x7rt2cqv': {
      'ru': 'Изменить основное фото',
      'en': 'Change main photo',
      'kk': 'Негізгі фотосуретті өзгерту',
    },
    '6m685i2h': {
      'ru': 'Загрузить фото',
      'en': 'Upload a photo',
      'kk': 'Фото жүктеп салыңыз',
    },
    '26lq2qv8': {
      'ru': 'Сохранить фото',
      'en': 'Save photo',
      'kk': 'Фотосуретті сақтау',
    },
  },
  // cancelTrip
  {
    'hkzr5o8l': {
      'ru': 'Отменить поездку',
      'en': 'Cancel trip',
      'kk': 'Сапардан бас тарту',
    },
    'o1k2gvre': {
      'ru':
          'Если вы хотите отменить свою тройку, оставьте примечание ниже, чтобы отправить его хозяину.',
      'en':
          'If you would like to cancel your threesome, please leave a note below to send to the host.',
      'kk':
          'Егер сіз үштіктен бас тартқыңыз келсе, хостқа жіберу үшін төменде жазба қалдырыңыз.',
    },
    '5ljlrbus': {
      'ru': 'Ваша причина отмены...',
      'en': 'Your reason for canceling...',
      'kk': 'Бас тарту себебіңіз...',
    },
    'vuzxfaug': {
      'ru': 'Да, отменить поездку',
      'en': 'Yes, cancel the trip',
      'kk': 'Иә, сапардан бас тартыңыз',
    },
    '8mocg5x9': {
      'ru': 'Неважно',
      'en': 'Doesn\'t matter',
      'kk': 'Маңызды емес',
    },
  },
  // cancelTripHOST
  {
    'zpkjqmtr': {
      'ru': 'Отменить поездку',
      'en': 'Cancel trip',
      'kk': 'Сапардан бас тарту',
    },
    'xoypdxsm': {
      'ru':
          'Если вы хотите отменить свою тройку, оставьте примечание ниже, чтобы отправить его хозяину.',
      'en':
          'If you would like to cancel your threesome, please leave a note below to send to the host.',
      'kk':
          'Егер сіз үштіктен бас тартқыңыз келсе, хостқа жіберу үшін төменде жазба қалдырыңыз.',
    },
    'a9cbbsnr': {
      'ru': 'Ваша причина отмены...',
      'en': 'Your reason for canceling...',
      'kk': 'Бас тарту себебіңіз...',
    },
    'er07sf3e': {
      'ru': 'Да, отменить поездку',
      'en': 'Yes, cancel the trip',
      'kk': 'Иә, сапардан бас тартыңыз',
    },
    'c4mxbngq': {
      'ru': 'Неважно',
      'en': 'Doesn\'t matter',
      'kk': 'Маңызды емес',
    },
  },
  // loading_Widget
  {
    'jq79ktti': {
      'ru': 'Analyzing your design file...',
      'en': 'Analyzing your design file...',
      'kk': 'Дизайн файлы талдануда...',
    },
    'hyk70yok': {
      'ru': 'This will take up to 30 seconds.',
      'en': 'This will take up to 30 seconds.',
      'kk': 'Бұл 30 секундқа дейін уақыт алады.',
    },
  },
  // approval
  {
    'xzrcqzlu': {
      'ru': 'Отправьте заявку на Email',
      'en': 'Send your request by email',
      'kk': 'Сұрауыңызды электрондық пошта арқылы жіберіңіз',
    },
    'bl5ym7y9': {
      'ru':
          'Одобрение руководства:\n1. Критерии: Согласно законодательству Казахстана, лицензия на деятельность гида не требуется, однако необходима профессиональная подготовка, подтвержденная соответствующими документами и организационно-правовой формой субъекта предпринимательской и туристической деятельности.\nНеобходимые документы:\n1) Заполненное заявление\n2) Заполненная карта-путеводитель.\n3) Копия удостоверения личности\n4) Копии сертификатов, удостоверений гида, дипломов и почетных грамот.\n5) Две фотографии 3х4.\n6) Оплата ежегодного членского взноса в размере Х тенге.\n7) Аккредитация КТА (Казахстанская Туристская Ассоциация)\n2. Послужной список – прошлый опыт работы.\n3. Собеседование – собеседование для лучшего понимания соискателя как личности.',
      'en':
          'Management Approval:\n1. Criteria: According to the legislation of Kazakhstan, a license to act as a guide is not required, but professional training is required, confirmed by relevant documents and the organizational and legal form of a business and tourism entity.\nRequired documents:\n1) Completed application\n2) Completed guide map.\n3) Copy of ID\n4) Copies of certificates, guide certificates, diplomas and diplomas.\n5) Two 3x4 photographs.\n6) Payment of an annual membership fee in the amount of X tenge.\n7) Accreditation by KTA (Kazakhstan Tourist Association)\n2. Track record – past work experience.\n3. Interview – an interview to better understand the applicant as a person.',
      'kk':
          'Басқаруды бекіту:\n1. Критерийлер: Қазақстан заңнамасына сәйкес гид қызметін атқару үшін лицензия талап етілмейді, бірақ кәсіпкерлік және туризм субъектісінің тиісті құжаттармен және ұйымдық-құқықтық нысанымен расталған кәсіптік даярлық қажет.\nҚажетті құжаттар:\n1) Аяқталған өтініш\n2) Аяқталған нұсқаулық картасы.\n3) жеке басын куәландыратын құжаттың көшірмесі\n4) Сертификаттардың, гид сертификаттарының, дипломдар мен дипломдардың көшірмелері.\n5) 3х4 екі фотосурет.\n6) Х теңге мөлшерінде жыл сайынғы мүшелік жарнаны төлеу.\n7) ҚТА (Қазақстан туристік қауымдастығы) аккредитациясы\n2. Еңбек өтілі – өткен жұмыс тәжірибесі.\n3. Сұхбат – өтініш берушіні тұлға ретінде жақсырақ түсіну үшін сұхбат.',
    },
    'mcyu4ka5': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'kk': 'Болдырмау',
    },
    'ee5j6olj': {
      'ru': 'Email',
      'en': 'Email',
      'kk': 'Электрондық пошта',
    },
  },
  // bottomLocation
  {
    '28sjuwyj': {
      'ru': 'О достопримечательности',
      'en': 'About the attraction',
      'kk': 'Аттракцион туралы',
    },
    '15ktb2h0': {
      'ru': 'Назад',
      'en': 'Return',
      'kk': 'Қайту',
    },
  },
  // SOSNumbers
  {
    'przyzial': {
      'ru': 'Экстренный вызов',
      'en': 'Emergency call',
      'kk': 'Жедел қоңырау',
    },
    'ou2uosrf': {
      'ru': 'Пожарная служба',
      'en': 'Fire Department',
      'kk': 'Өрт сөндіру бөлімі',
    },
    'af0wh1wl': {
      'ru': 'Полиция',
      'en': 'Police',
      'kk': 'Полиция',
    },
    'xgq07g29': {
      'ru': 'Скорая медицинская помощь',
      'en': 'Emergency',
      'kk': 'Төтенше жағдай',
    },
    'nikbnici': {
      'ru': 'МЧС',
      'en': 'Ministry of Emergency Situations',
      'kk': 'Төтенше жағдайлар министрлігі',
    },
    'rr2qr3q8': {
      'ru': 'Отправить СМС с местоположением',
      'en': '',
      'kk': '',
    },
  },
  // bottomLocationCopy
  {
    'l64gm7zn': {
      'ru': 'Return',
      'en': 'Return',
      'kk': 'Қайту',
    },
  },
  // chatgpt
  {
    '54vi8jn7': {
      'ru': 'Write your text...',
      'en': '',
      'kk': '',
    },
    'f8bm772l': {
      'ru': 'Russian',
      'en': '',
      'kk': '',
    },
    'havte6ut': {
      'ru': 'Kazakh',
      'en': '',
      'kk': '',
    },
    '8ofi0osf': {
      'ru': 'English',
      'en': '',
      'kk': '',
    },
    's5ac6nki': {
      'ru': 'Generate Text',
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
    'jkb5xd4m': {
      'ru': 'Нам нужна информация о вашем местоположении.',
      'en': '',
      'kk': '',
    },
    '9bhqluik': {
      'ru':
          'Чтобы улучшить ваш опыт, нам нужен доступ к вашему местоположению. Это помогает нам предоставлять персонализированные услуги с учетом местоположения.',
      'en':
          'To improve your experience, we need access to your location. This helps us provide personalized, location-based services.',
      'kk':
          'Тәжірибеңізді жақсарту үшін бізге орналасқан жеріңізге рұқсат қажет. Бұл жекелендірілген, орынға негізделген қызметтерді ұсынуға көмектеседі.',
    },
    'ltnztz9v': {
      'ru':
          'Будьте в курсе важных обновлений и персонализированного контента. Включите уведомления, чтобы улучшить ваш опыт.',
      'en':
          'Stay up to date with important updates and personalized content. Turn on notifications to improve your experience.',
      'kk':
          'Маңызды жаңартулар мен жекелендірілген мазмұннан хабардар болыңыз. Тәжірибеңізді жақсарту үшін хабарландыруларды қосыңыз.',
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

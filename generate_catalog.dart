import 'dart:io';
import 'dart:convert';

void main() async {
  final catalog = <String, dynamic>{'libraries': <String, dynamic>{}};

  // Process Icons8
  await processLibrary(
    'Icons8',
    'assets/icons8.com',
    '#4285F4',
    'Professional icon library with 1,187+ icons',
    catalog,
  );

  // Process LottieFiles
  await processLibrary(
    'LottieFiles',
    'assets/lottiefiles.com',
    '#9C27B0',
    'Community-driven animations with 756+ icons',
    catalog,
  );

  // Process Useanimations
  await processLibrary(
    'Useanimations',
    'assets/useanimations.com',
    '#4CAF50',
    'Clean micro-interactions with 80+ icons',
    catalog,
  );

  // Process Lordicon
  await processLibrary(
    'Lordicon',
    'assets/lordicon.com',
    '#FF9800',
    'Premium animated icons with 154+ icons',
    catalog,
  );

  // Process LottieFlow
  await processLibrary(
    'LottieFlow',
    'assets/lottieflow.com',
    '#F44336',
    'Creative flow animations with 277+ icons',
    catalog,
  );

  // Write the catalog to file
  final jsonString = JsonEncoder.withIndent('  ').convert(catalog);
  await File('example/assets/icon_catalog.json').writeAsString(jsonString);

  // ignore: avoid_print
  print('Icon catalog generated successfully!');
  // ignore: avoid_print
  print('Total libraries: ${catalog['libraries'].length}');

  for (var entry in catalog['libraries'].entries) {
    final library = entry.value as Map<String, dynamic>;
    final categories = library['categories'] as Map<String, dynamic>;
    int totalIcons = 0;
    for (var category in categories.values) {
      totalIcons += (category as List).length;
    }
    // ignore: avoid_print
    print('${entry.key}: $totalIcons icons in ${categories.length} categories');
  }
}

Future<void> processLibrary(
  String libraryName,
  String assetPath,
  String color,
  String description,
  Map<String, dynamic> catalog,
) async {
  final directory = Directory(assetPath);
  if (!await directory.exists()) {
    // ignore: avoid_print
    print('Directory $assetPath does not exist');
    return;
  }

  final files = await directory
      .list()
      .where((entity) => entity is File && entity.path.endsWith('.json'))
      .cast<File>()
      .toList();

  final categories = <String, List<String>>{};

  for (final file in files) {
    final fileName = file.path.split('/').last.replaceAll('.json', '');
    final category = categorizeIcon(fileName, libraryName);

    if (!categories.containsKey(category)) {
      categories[category] = <String>[];
    }
    categories[category]!.add(fileName);
  }

  // Sort categories and icons within categories
  final sortedCategories = <String, List<String>>{};
  final sortedCategoryNames = categories.keys.toList()..sort();

  for (final categoryName in sortedCategoryNames) {
    final icons = categories[categoryName]!..sort();
    sortedCategories[categoryName] = icons;
  }

  catalog['libraries'][libraryName] = {
    'name': libraryName,
    'description': description,
    'color': color,
    'categories': sortedCategories,
  };
}

String categorizeIcon(String fileName, String libraryName) {
  // Convert file name to lowercase for easier matching
  final name = fileName.toLowerCase();

  // Icons8 categorization
  if (libraryName == 'Icons8') {
    if (name.contains('facebook') ||
        name.contains('twitter') ||
        name.contains('instagram') ||
        name.contains('linkedin') ||
        name.contains('youtube') ||
        name.contains('github') ||
        name.contains('behance') ||
        name.contains('dribbble') ||
        name.contains('whatsapp') ||
        name.contains('telegram') ||
        name.contains('viber') ||
        name.contains('vk') ||
        name.contains('twitch') ||
        name.contains('wordpress')) {
      return 'Social Media';
    }
    if (name.contains('heart') ||
        name.contains('like') ||
        name.contains('love') ||
        name.contains('favorite') ||
        name.contains('star') ||
        name.contains('bookmark')) {
      return 'Favorites & Likes';
    }
    if (name.contains('bell') ||
        name.contains('notification') ||
        name.contains('alert') ||
        name.contains('warning') ||
        name.contains('reminder')) {
      return 'Notifications';
    }
    if (name.contains('arrow') ||
        name.contains('up') ||
        name.contains('down') ||
        name.contains('left') ||
        name.contains('right') ||
        name.contains('back') ||
        name.contains('forward') ||
        name.contains('navigation')) {
      return 'Navigation';
    }
    if (name.contains('play') ||
        name.contains('pause') ||
        name.contains('stop') ||
        name.contains('video') ||
        name.contains('camera') ||
        name.contains('music') ||
        name.contains('audio') ||
        name.contains('microphone') ||
        name.contains('volume')) {
      return 'Media & Audio';
    }
    if (name.contains('download') ||
        name.contains('upload') ||
        name.contains('share') ||
        name.contains('copy') ||
        name.contains('paste') ||
        name.contains('cut') ||
        name.contains('delete') ||
        name.contains('trash')) {
      return 'Actions';
    }
    if (name.contains('settings') ||
        name.contains('gear') ||
        name.contains('configuration') ||
        name.contains('preferences') ||
        name.contains('options') ||
        name.contains('tune')) {
      return 'Settings';
    }
    if (name.contains('search') ||
        name.contains('find') ||
        name.contains('look')) {
      return 'Search';
    }
    if (name.contains('home') ||
        name.contains('house') ||
        name.contains('building')) {
      return 'Home & Building';
    }
    if (name.contains('user') ||
        name.contains('person') ||
        name.contains('profile') ||
        name.contains('account') ||
        name.contains('people')) {
      return 'User & Profile';
    }
    if (name.contains('calendar') ||
        name.contains('date') ||
        name.contains('time') ||
        name.contains('clock') ||
        name.contains('timer') ||
        name.contains('schedule')) {
      return 'Time & Calendar';
    }
    if (name.contains('email') ||
        name.contains('mail') ||
        name.contains('message') ||
        name.contains('chat') ||
        name.contains('call') ||
        name.contains('phone')) {
      return 'Communication';
    }
    if (name.contains('lock') ||
        name.contains('key') ||
        name.contains('security') ||
        name.contains('shield') ||
        name.contains('privacy') ||
        name.contains('protection')) {
      return 'Security';
    }
    if (name.contains('folder') ||
        name.contains('file') ||
        name.contains('document') ||
        name.contains('archive') ||
        name.contains('storage')) {
      return 'Files & Storage';
    }
    if (name.contains('wifi') ||
        name.contains('bluetooth') ||
        name.contains('battery') ||
        name.contains('signal') ||
        name.contains('network') ||
        name.contains('connection')) {
      return 'Technology';
    }
    if (name.contains('weather') ||
        name.contains('sun') ||
        name.contains('moon') ||
        name.contains('cloud') ||
        name.contains('rain') ||
        name.contains('snow') ||
        name.contains('storm') ||
        name.contains('wind')) {
      return 'Weather';
    }
    if (name.contains('food') ||
        name.contains('pizza') ||
        name.contains('burger') ||
        name.contains('coffee') ||
        name.contains('tea') ||
        name.contains('beer') ||
        name.contains('wine') ||
        name.contains('cake') ||
        name.contains('restaurant')) {
      return 'Food & Drink';
    }
    if (name.contains('sport') ||
        name.contains('basketball') ||
        name.contains('football') ||
        name.contains('soccer') ||
        name.contains('tennis') ||
        name.contains('golf') ||
        name.contains('swimming') ||
        name.contains('running') ||
        name.contains('cycling')) {
      return 'Sports';
    }
    if (name.contains('car') ||
        name.contains('bus') ||
        name.contains('train') ||
        name.contains('plane') ||
        name.contains('aircraft') ||
        name.contains('bike') ||
        name.contains('motorcycle') ||
        name.contains('ship') ||
        name.contains('taxi')) {
      return 'Transportation';
    }
    if (name.contains('book') ||
        name.contains('library') ||
        name.contains('school') ||
        name.contains('university') ||
        name.contains('education') ||
        name.contains('study') ||
        name.contains('learn') ||
        name.contains('teacher')) {
      return 'Education';
    }
    if (name.contains('medical') ||
        name.contains('hospital') ||
        name.contains('doctor') ||
        name.contains('nurse') ||
        name.contains('medicine') ||
        name.contains('health') ||
        name.contains('fitness') ||
        name.contains('gym')) {
      return 'Health & Medical';
    }
    if (name.contains('shopping') ||
        name.contains('cart') ||
        name.contains('bag') ||
        name.contains('basket') ||
        name.contains('store') ||
        name.contains('shop') ||
        name.contains('buy') ||
        name.contains('sell') ||
        name.contains('money') ||
        name.contains('credit') ||
        name.contains('card') ||
        name.contains('wallet')) {
      return 'Shopping & Money';
    }
    if (name.contains('game') ||
        name.contains('controller') ||
        name.contains('dice') ||
        name.contains('puzzle') ||
        name.contains('movie') ||
        name.contains('tv') ||
        name.contains('theater') ||
        name.contains('concert') ||
        name.contains('entertainment')) {
      return 'Entertainment';
    }
    if (name.contains('tool') ||
        name.contains('hammer') ||
        name.contains('wrench') ||
        name.contains('screwdriver') ||
        name.contains('toolbox') ||
        name.contains('gear')) {
      return 'Tools';
    }
    if (name.contains('chart') ||
        name.contains('graph') ||
        name.contains('analytics') ||
        name.contains('statistics') ||
        name.contains('report') ||
        name.contains('dashboard') ||
        name.contains('business')) {
      return 'Business & Analytics';
    }
    if (name.contains('emotion') ||
        name.contains('happy') ||
        name.contains('sad') ||
        name.contains('angry') ||
        name.contains('surprised') ||
        name.contains('confused') ||
        name.contains('smile') ||
        name.contains('wink') ||
        name.contains('blushing') ||
        name.contains('tongue') ||
        name.contains('vomited') ||
        name.contains('yummy')) {
      return 'Emotions & Faces';
    }
    return 'General';
  }

  // LottieFiles categorization
  if (libraryName == 'LottieFiles') {
    if (name.contains('icon') &&
        (name.contains('social') ||
            name.contains('facebook') ||
            name.contains('instagram') ||
            name.contains('linkedin'))) {
      return 'Social Media';
    }
    if (name.contains('icon') &&
        (name.contains('download') ||
            name.contains('upload') ||
            name.contains('share') ||
            name.contains('copy'))) {
      return 'Actions';
    }
    if (name.contains('icon') &&
        (name.contains('bell') ||
            name.contains('notification') ||
            name.contains('alert') ||
            name.contains('warning'))) {
      return 'Notifications';
    }
    if (name.contains('icon') &&
        (name.contains('hamburger') ||
            name.contains('menu') ||
            name.contains('navigation'))) {
      return 'Navigation';
    }
    if (name.contains('icon') &&
        (name.contains('google') ||
            name.contains('android') ||
            name.contains('translate') ||
            name.contains('maps'))) {
      return 'Google Services';
    }
    if (name.contains('icon') &&
        (name.contains('shield') ||
            name.contains('security') ||
            name.contains('lock'))) {
      return 'Security';
    }
    if (name.contains('icon') &&
        (name.contains('music') ||
            name.contains('play') ||
            name.contains('video') ||
            name.contains('audio'))) {
      return 'Media';
    }
    if (name.contains('icon') &&
        (name.contains('setting') ||
            name.contains('gear') ||
            name.contains('configuration'))) {
      return 'Settings';
    }
    if (name.contains('icon') &&
        (name.contains('check') ||
            name.contains('success') ||
            name.contains('error') ||
            name.contains('loading'))) {
      return 'Status';
    }
    if (name.contains('icon') &&
        (name.contains('book') ||
            name.contains('bookmark') ||
            name.contains('file') ||
            name.contains('folder'))) {
      return 'Files & Documents';
    }
    if (name.contains('icon') &&
        (name.contains('heart') ||
            name.contains('like') ||
            name.contains('favorite'))) {
      return 'Favorites';
    }
    if (name.contains('icon') &&
        (name.contains('shopping') ||
            name.contains('cart') ||
            name.contains('bag') ||
            name.contains('store'))) {
      return 'Shopping';
    }
    if (name.contains('icon') &&
        (name.contains('location') ||
            name.contains('gps') ||
            name.contains('map'))) {
      return 'Location';
    }
    if (name.contains('icon') &&
        (name.contains('mobile') ||
            name.contains('phone') ||
            name.contains('device'))) {
      return 'Devices';
    }
    if (name.contains('icon') &&
        (name.contains('chat') ||
            name.contains('message') ||
            name.contains('communication'))) {
      return 'Communication';
    }
    if (name.contains('icon') &&
        (name.contains('growth') ||
            name.contains('chart') ||
            name.contains('analytics'))) {
      return 'Analytics';
    }
    if (name.contains('icon') &&
        (name.contains('quality') ||
            name.contains('standard') ||
            name.contains('certificate'))) {
      return 'Quality & Standards';
    }
    if (name.contains('icon') &&
        (name.contains('truck') ||
            name.contains('delivery') ||
            name.contains('shipping'))) {
      return 'Delivery & Shipping';
    }
    if (name.contains('icon') &&
        (name.contains('coupon') ||
            name.contains('discount') ||
            name.contains('offer'))) {
      return 'Offers & Coupons';
    }
    if (name.contains('icon') &&
        (name.contains('robot') ||
            name.contains('ai') ||
            name.contains('automation'))) {
      return 'AI & Automation';
    }
    if (name.contains('icon') &&
        (name.contains('house') ||
            name.contains('home') ||
            name.contains('building'))) {
      return 'Home & Building';
    }
    if (name.contains('icon') &&
        (name.contains('subscribe') ||
            name.contains('follow') ||
            name.contains('notification'))) {
      return 'Subscriptions';
    }
    if (name.contains('icon') &&
        (name.contains('recycle') ||
            name.contains('environment') ||
            name.contains('green'))) {
      return 'Environment';
    }
    if (name.contains('icon') &&
        (name.contains('handshake') ||
            name.contains('partnership') ||
            name.contains('agreement'))) {
      return 'Partnerships';
    }
    if (name.contains('icon') &&
        (name.contains('arrow') ||
            name.contains('direction') ||
            name.contains('navigation'))) {
      return 'Navigation';
    }
    if (name.contains('icon') &&
        (name.contains('bitcoin') ||
            name.contains('crypto') ||
            name.contains('currency'))) {
      return 'Cryptocurrency';
    }
    if (name.contains('icon') &&
        (name.contains('fingerprint') ||
            name.contains('biometric') ||
            name.contains('security'))) {
      return 'Biometrics';
    }
    if (name.contains('icon') &&
        (name.contains('eye') ||
            name.contains('vision') ||
            name.contains('examination'))) {
      return 'Vision & Eye Care';
    }
    if (name.contains('icon') &&
        (name.contains('glasses') || name.contains('eyewear'))) {
      return 'Eyewear';
    }
    if (name.contains('icon') &&
        (name.contains('idea') ||
            name.contains('innovation') ||
            name.contains('creativity'))) {
      return 'Ideas & Innovation';
    }
    if (name.contains('icon') &&
        (name.contains('call') ||
            name.contains('phone') ||
            name.contains('contact'))) {
      return 'Communication';
    }
    if (name.contains('icon') &&
        (name.contains('toggle') ||
            name.contains('switch') ||
            name.contains('control'))) {
      return 'Controls';
    }
    if (name.contains('icon') &&
        (name.contains('app') ||
            name.contains('application') ||
            name.contains('software'))) {
      return 'Applications';
    }
    if (name.contains('icon') &&
        (name.contains('development') ||
            name.contains('design') ||
            name.contains('coding'))) {
      return 'Development';
    }
    if (name.contains('icon') &&
        (name.contains('web') ||
            name.contains('website') ||
            name.contains('internet'))) {
      return 'Web Development';
    }
    if (name.contains('icon') &&
        (name.contains('ux') ||
            name.contains('ui') ||
            name.contains('user experience'))) {
      return 'UX/UI Design';
    }
    if (name.contains('icon') &&
        (name.contains('3d') ||
            name.contains('three') ||
            name.contains('dimensional'))) {
      return '3D Design';
    }
    if (name.contains('icon') &&
        (name.contains('search') ||
            name.contains('find') ||
            name.contains('look'))) {
      return 'Search';
    }
    if (name.contains('icon') &&
        (name.contains('customer') ||
            name.contains('service') ||
            name.contains('support'))) {
      return 'Customer Service';
    }
    if (name.contains('icon') &&
        (name.contains('schedule') ||
            name.contains('calendar') ||
            name.contains('time'))) {
      return 'Scheduling';
    }
    if (name.contains('icon') &&
        (name.contains('sort') ||
            name.contains('organize') ||
            name.contains('arrange'))) {
      return 'Organization';
    }
    if (name.contains('icon') &&
        (name.contains('clock') ||
            name.contains('time') ||
            name.contains('timer'))) {
      return 'Time';
    }
    if (name.contains('icon') &&
        (name.contains('dapp') ||
            name.contains('blockchain') ||
            name.contains('decentralized'))) {
      return 'Blockchain';
    }
    if (name.contains('icon') &&
        (name.contains('megaphone') ||
            name.contains('announcement') ||
            name.contains('broadcast'))) {
      return 'Announcements';
    }
    if (name.contains('icon') &&
        (name.contains('line') ||
            name.contains('progress') ||
            name.contains('loading'))) {
      return 'Progress & Loading';
    }
    if (name.contains('icon') &&
        (name.contains('dots') ||
            name.contains('loader') ||
            name.contains('spinner'))) {
      return 'Loading Indicators';
    }
    if (name.contains('icon') &&
        (name.contains('package') ||
            name.contains('bundle') ||
            name.contains('collection'))) {
      return 'Packages & Bundles';
    }
    if (name.contains('icon') &&
        (name.contains('power') ||
            name.contains('energy') ||
            name.contains('battery'))) {
      return 'Power & Energy';
    }
    if (name.contains('icon') &&
        (name.contains('compass') ||
            name.contains('direction') ||
            name.contains('navigation'))) {
      return 'Navigation';
    }
    if (name.contains('icon') &&
        (name.contains('setting') ||
            name.contains('configuration') ||
            name.contains('preferences'))) {
      return 'Settings';
    }
    if (name.contains('icon') &&
        (name.contains('download') ||
            name.contains('transfer') ||
            name.contains('sync'))) {
      return 'Data Transfer';
    }
    if (name.contains('icon') &&
        (name.contains('headphone') ||
            name.contains('audio') ||
            name.contains('sound'))) {
      return 'Audio';
    }
    if (name.contains('icon') &&
        (name.contains('sync') ||
            name.contains('synchronize') ||
            name.contains('update'))) {
      return 'Synchronization';
    }
    if (name.contains('icon') &&
        (name.contains('lock') ||
            name.contains('security') ||
            name.contains('protection'))) {
      return 'Security';
    }
    if (name.contains('icon') &&
        (name.contains('call') ||
            name.contains('phone') ||
            name.contains('communication'))) {
      return 'Communication';
    }
    return 'General';
  }

  // Useanimations categorization
  if (libraryName == 'Useanimations') {
    if (name.contains('arrow') || name.contains('navigation')) {
      return 'Navigation';
    }
    if (name.contains('play') ||
        name.contains('pause') ||
        name.contains('media')) {
      return 'Media Controls';
    }
    if (name.contains('menu') ||
        name.contains('toggle') ||
        name.contains('ui')) {
      return 'UI Elements';
    }
    if (name.contains('notification') || name.contains('alert')) {
      return 'Notifications';
    }
    if (name.contains('loading') || name.contains('infinity')) {
      return 'Loading States';
    }
    if (name.contains('facebook') ||
        name.contains('twitter') ||
        name.contains('instagram') ||
        name.contains('linkedin') ||
        name.contains('github') ||
        name.contains('behance') ||
        name.contains('dribbble') ||
        name.contains('codepen') ||
        name.contains('pocket') ||
        name.contains('youtube')) {
      return 'Social Media';
    }
    if (name.contains('user') || name.contains('person')) {
      return 'User Management';
    }
    if (name.contains('visibility') || name.contains('view')) {
      return 'Visibility';
    }
    if (name.contains('zoom')) {
      return 'Zoom';
    }
    if (name.contains('help') || name.contains('support')) {
      return 'Help & Support';
    }
    return 'Core Actions';
  }

  // Lordicon categorization
  if (libraryName == 'Lordicon') {
    if (name.contains('share')) {
      return 'Sharing';
    }
    if (name.contains('analytics') || name.contains('chart')) {
      return 'Analytics';
    }
    if (name.contains('wifi') || name.contains('connection')) {
      return 'Connectivity';
    }
    if (name.contains('arrow') || name.contains('navigation')) {
      return 'Navigation';
    }
    if (name.contains('message') ||
        name.contains('call') ||
        name.contains('email')) {
      return 'Communication';
    }
    if (name.contains('play') ||
        name.contains('pause') ||
        name.contains('video')) {
      return 'Media';
    }
    if (name.contains('setting') || name.contains('gear')) {
      return 'Settings';
    }
    if (name.contains('lock') || name.contains('security')) {
      return 'Security';
    }
    if (name.contains('check') ||
        name.contains('cross') ||
        name.contains('status')) {
      return 'Status';
    }
    if (name.contains('user') ||
        name.contains('account') ||
        name.contains('profile')) {
      return 'User';
    }
    if (name.contains('ticket') || name.contains('booking')) {
      return 'Tickets & Booking';
    }
    if (name.contains('newspaper') || name.contains('news')) {
      return 'News & Media';
    }
    if (name.contains('alarm') || name.contains('reminder')) {
      return 'Alarms & Reminders';
    }
    if (name.contains('shopping') ||
        name.contains('bag') ||
        name.contains('cart')) {
      return 'Shopping';
    }
    if (name.contains('wallet') ||
        name.contains('money') ||
        name.contains('payment')) {
      return 'Wallet & Payments';
    }
    if (name.contains('file') ||
        name.contains('document') ||
        name.contains('folder')) {
      return 'Files & Documents';
    }
    if (name.contains('error') || name.contains('warning')) {
      return 'Errors & Warnings';
    }
    if (name.contains('folder') || name.contains('category')) {
      return 'Categories & Folders';
    }
    if (name.contains('notification') || name.contains('bell')) {
      return 'Notifications';
    }
    if (name.contains('chat') || name.contains('message')) {
      return 'Chat & Messaging';
    }
    if (name.contains('favorite') || name.contains('heart')) {
      return 'Favorites';
    }
    if (name.contains('upload') || name.contains('download')) {
      return 'File Transfer';
    }
    if (name.contains('calendar') || name.contains('date')) {
      return 'Calendar';
    }
    if (name.contains('clock') || name.contains('time')) {
      return 'Time';
    }
    if (name.contains('savings') || name.contains('money')) {
      return 'Savings & Finance';
    }
    if (name.contains('pizza') || name.contains('food')) {
      return 'Food';
    }
    if (name.contains('butt') || name.contains('target')) {
      return 'Targeting';
    }
    if (name.contains('help') || name.contains('question')) {
      return 'Help & Support';
    }
    if (name.contains('phone') || name.contains('call')) {
      return 'Phone & Calls';
    }
    if (name.contains('email') || name.contains('mail')) {
      return 'Email';
    }
    if (name.contains('shopping') || name.contains('store')) {
      return 'Shopping';
    }
    if (name.contains('wallet') || name.contains('payment')) {
      return 'Wallet';
    }
    if (name.contains('account') || name.contains('profile')) {
      return 'Account';
    }
    if (name.contains('disabled') || name.contains('accessibility')) {
      return 'Accessibility';
    }
    if (name.contains('build') || name.contains('construction')) {
      return 'Construction & Building';
    }
    if (name.contains('view') || name.contains('display')) {
      return 'Views & Display';
    }
    if (name.contains('play') || name.contains('media')) {
      return 'Media';
    }
    if (name.contains('info') || name.contains('information')) {
      return 'Information';
    }
    if (name.contains('cross') || name.contains('close')) {
      return 'Close & Cancel';
    }
    if (name.contains('anchor') || name.contains('link')) {
      return 'Links & Anchors';
    }
    if (name.contains('check') || name.contains('success')) {
      return 'Success & Confirmation';
    }
    if (name.contains('videocam') || name.contains('camera')) {
      return 'Video & Camera';
    }
    if (name.contains('speed') || name.contains('performance')) {
      return 'Performance';
    }
    if (name.contains('code') || name.contains('programming')) {
      return 'Programming';
    }
    if (name.contains('compare') || name.contains('comparison')) {
      return 'Comparison';
    }
    if (name.contains('expand') || name.contains('fullscreen')) {
      return 'Expand & Fullscreen';
    }
    if (name.contains('compress') || name.contains('minimize')) {
      return 'Compress & Minimize';
    }
    if (name.contains('credit') || name.contains('card')) {
      return 'Credit Cards';
    }
    if (name.contains('trash') || name.contains('delete')) {
      return 'Delete & Trash';
    }
    if (name.contains('calculate') || name.contains('math')) {
      return 'Calculations';
    }
    if (name.contains('attribution') || name.contains('credit')) {
      return 'Attribution';
    }
    return 'General';
  }

  // LottieFlow categorization
  if (libraryName == 'LottieFlow') {
    if (name.contains('404') || name.contains('error')) {
      return 'Error Pages';
    }
    if (name.contains('background')) {
      return 'Backgrounds';
    }
    if (name.contains('arrow')) {
      return 'Arrows';
    }
    if (name.contains('loading') || name.contains('spinner')) {
      return 'Loading';
    }
    if (name.contains('success')) {
      return 'Success';
    }
    if (name.contains('navigation') || name.contains('menu')) {
      return 'Navigation';
    }
    if (name.contains('message') || name.contains('chat')) {
      return 'Communication';
    }
    if (name.contains('play') || name.contains('video')) {
      return 'Media';
    }
    if (name.contains('social')) {
      return 'Social';
    }
    if (name.contains('business') || name.contains('chart')) {
      return 'Business';
    }
    if (name.contains('search')) {
      return 'Search';
    }
    if (name.contains('slider')) {
      return 'Sliders';
    }
    if (name.contains('scrolling') || name.contains('scroll')) {
      return 'Scrolling';
    }
    if (name.contains('radio')) {
      return 'Radio Controls';
    }
    if (name.contains('multimedia')) {
      return 'Multimedia';
    }
    return 'General';
  }

  return 'General';
}

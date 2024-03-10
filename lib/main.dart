import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForbiddenGram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ГеймDevky и GameБойчики'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterLike = 0;
  int _counterComment = 0;
  int _counterShare = 0;

  void _incrementLike() {
    setState(() {
      _counterLike++;
    });
  }

  void _incrementComment() {
    setState(() {
      _counterComment++;
    });
  }

  void _incrementShare() {
    setState(() {
      _counterShare++;
    });
  }

  void _showProfileInfo() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Дата рождения: 15.05.2001'),
              Text('Семейное положение: не замужем'),
              Text('Любимый вестерн: Хороший, Плохой, Злой'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/ava.png'),
                      ),
                      Text(
                        'Середа Элеонора Игоревна',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.monitor_heart_sharp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  const Text('Счастливая мама 34 ангелочков',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 18),
                  Text(
                    'Я очень старалась сделать красиво, вроде бы получилось похоже на соцсеть.'
                        ' Тут работают лайки (потому что у них такой же принцип, как у базовой кнопки (простое прибавление)).'
                        ' Можно на остальные тоже понажимать! Смогла кое-как вкрутить подачу дополнительной информации, '
                        'но это я украла с ютуба, все еще не совсем понимаю, как контекст работает. Очень сложно было с аватаркой, потому что никак не могла понять, как работают изображения,'
                        'и с цветом текста, но в итоге разобралась, с иконками тоже поигралась.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _incrementLike,
                        icon: const Icon(Icons.thumb_up),
                        label: Text('Нраица $_counterLike'),
                      ),
                      TextButton.icon(
                        onPressed: _incrementComment,
                        icon: const Icon(Icons.comment_bank),
                        label: Text('Торжественный комментарий $_counterComment'),
                      ),
                      TextButton.icon(
                        onPressed: _incrementShare,
                        icon: const Icon(Icons.share),
                        label: Text('Циркуль упал $_counterShare'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.surfaceTint,
              height: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showProfileInfo,
        tooltip: 'Информация о пользователе',
        child: const Icon(Icons.info),
      ),
    );
  }
}

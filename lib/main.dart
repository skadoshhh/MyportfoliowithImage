import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4F8FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087EDB),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// =====================================================
// MAIN SCREEN
// =====================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    AboutPage(),
    SkillsPage(),
    ProjectPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFDCEEFF),
        height: 72,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'About',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline),
            selectedIcon: Icon(Icons.star),
            label: 'Skills',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'Project',
          ),
          NavigationDestination(
            icon: Icon(Icons.mail_outline),
            selectedIcon: Icon(Icons.mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF087EDB),
              Color(0xFF0A69B9),
              Color(0xFFF4F8FC),
            ],
            stops: [0.0, 0.34, 0.58],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =================================================
              // HEADER
              // =================================================

              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Portfolio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Building Ideas • Creating Impact',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // =================================================
              // PROFILE
              // =================================================

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white70,
                          width: 5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/image.jpg',
                          width: 105,
                          height: 105,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 65,
                              color: Color(0xFF087EDB),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      "Hi, I'm Jiro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Web Developer | Designer | Creator',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // =================================================
              // BSIT CARD
              // =================================================

              whiteCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BSIT',
                      style: TextStyle(
                        color: Color(0xFF173B63),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Bachelor of Science in Information Technology',
                      style: TextStyle(
                        color: Color(0xFF60758B),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // =================================================
              // IMAGE CAROUSEL
              // =================================================

              whiteCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'IMAGE CAROUSEL',
                      style: TextStyle(
                        color: Color(0xFF173B63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          portfolioImage(
                            'assets/image1.jpg',
                          ),

                          portfolioImage(
                            'assets/image2.jpg',
                          ),

                          portfolioImage(
                            'assets/image3.jpg',
                          ),

                          portfolioImage(
                            'assets/image4.jpg',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        '● ○ ○ ○',
                        style: TextStyle(
                          color: Color(0xFF087EDB),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // =================================================
              // ABOUT BUTTON
              // =================================================

              bigButton(
                text: 'About Me',
                icon: Icons.person,
                onPressed: () {
                  openPage(
                    context,
                    const AboutPage(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// ABOUT PAGE
// =====================================================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      title: 'About Me',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            whiteCard(
              child: Column(
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF58BFFF),
                          Color(0xFF087EDB),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/image.jpg',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 75,
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Jiro Pitogo',
                    style: TextStyle(
                      color: Color(0xFF173B63),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'BSIT Student',
                    style: TextStyle(
                      color: Color(0xFF087EDB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173B63),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'I am a BSIT student interested in web development, '
              'UI/UX design, programming, and creating useful '
              'digital projects. I enjoy learning new technologies '
              'and improving my skills through different projects.',
              style: TextStyle(
                color: Color(0xFF60758B),
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 25),

            bigButton(
              text: 'My Skills',
              icon: Icons.star,
              onPressed: () {
                openPage(
                  context,
                  const SkillsPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SKILLS PAGE
// =====================================================

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      title: 'My Skills',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle('MY SKILLS'),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.12,
              children: [
                skillCard(
                  'HTML',
                  Icons.language,
                ),
                skillCard(
                  'CSS',
                  Icons.style,
                ),
                skillCard(
                  'JavaScript',
                  Icons.code,
                ),
                skillCard(
                  'Flutter',
                  Icons.phone_android,
                ),
                skillCard(
                  'Python',
                  Icons.terminal,
                ),
                skillCard(
                  'UI/UX Design',
                  Icons.palette,
                ),
              ],
            ),

            const SizedBox(height: 25),

            sectionTitle('SKILL DETAILS'),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: smallDetail(
                    'HTML & CSS',
                    'Web layouts',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: smallDetail(
                    'JavaScript',
                    'Interactive UI',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: smallDetail(
                    'Python',
                    'Programming',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: smallDetail(
                    'UI/UX',
                    'Interface Design',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            bigButton(
              text: 'My Project',
              icon: Icons.folder,
              onPressed: () {
                openPage(
                  context,
                  const ProjectPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// PROJECT PAGE
// =====================================================

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      title: 'My Project',

      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            sectionTitle('MY PROJECTS'),

            const SizedBox(height: 15),

            // =================================================
            // PROJECT 1 - SYSARCH
            // =================================================

            projectCard(
              title: 'Sysarch Project',

              description:
                  'Sample system architecture project focused '
                  'on web development and responsive design.',

              image: 'assets/system.jpg',

              // ILAGAY DITO ANG LINK NG SYSARCH PROJECT MO
              link: 'https://graveplotmanagement.freehosting.dev/?i=1',
            ),

            const SizedBox(height: 16),

            // =================================================
            // PROJECT 2 - PORTFOLIO
            // =================================================

            projectCard(
              title: 'Portfolio Website',

              description:
                  'A personal portfolio website showcasing '
                  'skills, projects, and contact information.',

              image: 'assets/portfolio.jpg',

              // ILAGAY DITO ANG LINK NG PORTFOLIO MO
              link: 'https://skadoshhh.github.io/JIRO-PITOGO-PORTFOLIO/',
            ),

            const SizedBox(height: 22),

            // =================================================
            // CONTACT BUTTON
            // =================================================

            bigButton(
              text: 'Contact Me',
              icon: Icons.mail,

              onPressed: () {
                openPage(
                  context,
                  const ContactPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// CONTACT PAGE
// =====================================================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      title: 'Contact Me',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle('CONTACT INFO'),

            const SizedBox(height: 18),

            contactCard(
              Icons.phone,
              'Contact Number',
              '09911856810',
            ),

            contactCard(
              Icons.email,
              'Email Address',
              'pitogojiro@gmail.com',
            ),

            contactCard(
              Icons.location_on,
              'Location',
              'Caloocan City, Philippines',
            ),

            const SizedBox(height: 18),

            bigButton(
              text: "Let's Connect!",
              icon: Icons.send,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Thank you for contacting me!',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 35),

            const Center(
              child: Text(
                "Let's Connect!",
                style: TextStyle(
                  color: Color(0xFF087EDB),
                  fontSize: 27,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// PAGE TEMPLATE
// FIXED BACK BUTTON
// =====================================================

Widget pageTemplate({
  required String title,
  required Widget child,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFFF4F8FC),

    appBar: AppBar(
      backgroundColor: const Color(0xFF087EDB),
      foregroundColor: Colors.white,
      elevation: 0,

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      // FIX:
      // Gumamit ng Builder para magkaroon ng valid context.
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    ),

    body: child,
  );
}

// =====================================================
// WHITE CARD
// =====================================================

Widget whiteCard({
  required Widget child,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),

      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 14,
          offset: Offset(0, 5),
        ),
      ],
    ),

    child: child,
  );
}

// =====================================================
// CAROUSEL IMAGE
// =====================================================

Widget portfolioImage(
  String imagePath,
) {
  return Container(
    width: 180,
    height: 140,
    margin: const EdgeInsets.only(
      right: 12,
    ),

    decoration: BoxDecoration(
      color: const Color(0xFFEAF4FF),
      borderRadius: BorderRadius.circular(13),

      border: Border.all(
        color: const Color(0xFFD2E7FA),
      ),
    ),

    clipBehavior: Clip.antiAlias,

    child: Image.asset(
      imagePath,
      width: 180,
      height: 140,
      fit: BoxFit.cover,

      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const Center(
          child: Icon(
            Icons.image,
            color: Color(0xFF087EDB),
            size: 50,
          ),
        );
      },
    ),
  );
}

// =====================================================
// BIG BUTTON
// =====================================================

Widget bigButton({
  required String text,
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 56,

    child: ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF087EDB),
        foregroundColor: Colors.white,
        elevation: 5,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
      ),

      child: Row(
        children: [
          Icon(icon),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward,
          ),
        ],
      ),
    ),
  );
}

// =====================================================
// SKILL CARD
// =====================================================

Widget skillCard(
  String name,
  IconData icon,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),

      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: Offset(0, 5),
        ),
      ],
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 48,
          color: const Color(0xFF087EDB),
        ),

        const SizedBox(height: 10),

        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF173B63),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// SMALL DETAIL
// =====================================================

Widget smallDetail(
  String title,
  String subtitle,
) {
  return Container(
    padding: const EdgeInsets.all(13),

    decoration: BoxDecoration(
      color: const Color(0xFFE7F3FF),
      borderRadius: BorderRadius.circular(13),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF173B63),
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF60758B),
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
// =====================================================
// PROJECT CARD
// =====================================================

Widget projectCard({
  required String title,
  required String description,
  required String image,
  required String link,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),

      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 14,
          offset: Offset(0, 6),
        ),
      ],
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // =================================================
        // PROJECT IMAGE
        // =================================================

        Container(
          width: double.infinity,
          height: 180,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),

          clipBehavior: Clip.antiAlias,

          child: Image.asset(
            image,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,

            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDCEEFF),
                      Color(0xFFB9DEFF),
                    ],
                  ),
                ),

                child: const Center(
                  child: Icon(
                    Icons.image,
                    color: Color(0xFF087EDB),
                    size: 60,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 13),

        // =================================================
        // PROJECT TITLE
        // =================================================

        Text(
          title,

          style: const TextStyle(
            color: Color(0xFF173B63),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        // =================================================
        // PROJECT DESCRIPTION
        // =================================================

        Text(
          description,

          style: const TextStyle(
            color: Color(0xFF60758B),
            height: 1.4,
          ),
        ),

        const SizedBox(height: 13),

        // =================================================
        // VIEW PROJECT BUTTON
        // =================================================

        SizedBox(
          width: double.infinity,

          child: ElevatedButton.icon(

            onPressed: () async {

              final Uri projectUrl = Uri.parse(link);

              await launchUrl(
                projectUrl,
                mode: LaunchMode.externalApplication,
              );
            },

            icon: const Icon(
              Icons.open_in_new,
            ),

            label: const Text(
              'View Project',
            ),

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF087EDB),
              foregroundColor: Colors.white,

              padding: const EdgeInsets.symmetric(
                vertical: 13,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// CONTACT CARD
// =====================================================

Widget contactCard(
  IconData icon,
  String title,
  String value,
) {
  return Container(
    width: double.infinity,

    margin: const EdgeInsets.only(
      bottom: 12,
    ),

    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),

      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: Offset(0, 5),
        ),
      ],
    ),

    child: Row(
      children: [

        CircleAvatar(
          radius: 25,

          backgroundColor: const Color(
            0xFFE2F1FF,
          ),

          child: Icon(
            icon,
            color: const Color(0xFF087EDB),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF173B63),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF60758B),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// SECTION TITLE
// =====================================================

Widget sectionTitle(
  String text,
) {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start,

    children: [

      Text(
        text,
        style: const TextStyle(
          color: Color(0xFF173B63),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 7),

      Container(
        width: 40,
        height: 3,

        decoration: BoxDecoration(
          color: const Color(0xFF087EDB),
          borderRadius:
              BorderRadius.circular(5),
        ),
      ),
    ],
  );
}

// =====================================================
// OPEN PAGE
// =====================================================

void openPage(
  BuildContext context,
  Widget page,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
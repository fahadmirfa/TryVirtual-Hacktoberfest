import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto', // Replace with your preferred font
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    'https://example.com/your_logo_url.png', // Replace with your logo URL
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(height: 20),
              Text(
                'Virtual Trial Room App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Trial Room App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto', // Replace with your preferred font
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Virtual Trial Room App'),
      ),
      body: Center(
        child: _buildScreen(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Outfits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Try It Virtual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black, // Active icon and text color
        unselectedItemColor: Colors.grey, // Inactive icon and text color
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        // Home Screen
        return const HomeScreen();
      case 1:
        // Outfits Screen
        return const OutfitsScreen();
      case 2:
        // Try It Virtual Screen
        return const TryItVirtualScreen();
      case 3:
        // Cart Screen
        return const CartScreen();
      case 4:
        // Profile Screen
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        _buildCard(
          context,
          'Summer Collection',
          'Explore our latest summer collection for a fresh look.',
          'https://example.com/assets/images/summer_collection.jpg',
          'https://example.com/summer-collection',
        ),
        _buildCard(
          context,
          'Special Offer',
          'Limited-time offer: Get 20% off on all new arrivals.',
          'https://example.com/assets/images/special_offer.jpg',
          'https://example.com/special-offer',
        ),
        _buildCard(
          context,
          'New Arrivals',
          'Check out our latest arrivals and stay trendy!',
          'https://example.com/assets/images/new_arrivals.jpg',
          'https://example.com/new-arrivals',
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String title, String description,
      String imagePath, String link) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: GestureDetector(
                  onTap: () {
                    // Open the link in a web browser
                    // launchUrl(Uri.parse(link));
                  },
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue, // Badge background color
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10.0)),
                ),
                child: const Text(
                  'Badge Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Open the link in a web browser
                    // launchUrl(Uri.parse(link));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).primaryColor, // Use primary color
                  ),
                  child: const Text(
                    'Shop Now',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OutfitsScreen extends StatelessWidget {
  const OutfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Outfits Screen'),
    );
  }
}

class TryItVirtualScreen extends StatelessWidget {
  const TryItVirtualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Try It Virtual Screen'),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}

void main() {
  runApp(const MyApp());
}

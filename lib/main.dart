import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaGameShop(),
    );
  }
}

class PantallaGameShop extends StatelessWidget {
  const PantallaGameShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. TÍTULO Y CARRITO
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Game',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'shop',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.shopping_cart_outlined,
                        size: 30, color: Colors.black),
                  ],
                ),
              ),

              // 2. BARRA DE BÚSQUEDA
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'SEARCH',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),

              // 3. BANNER PRINCIPAL
              Container(
                margin: const EdgeInsets.all(16.0),
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage('https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/Gemini_Generated_Image_jqz8d3jqz8d3jqz8.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 4. CATEGORÍAS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _crearCategoria(Icons.directions_run, 'Acción'),
                    _crearCategoria(Icons.landscape, 'Aventura'),
                    _crearCategoria(Icons.shield, 'RPG'),
                    _crearCategoria(Icons.sports_soccer, 'Deportes'),
                  ],
                ),
              ),

              // 5. PRIMERA FILA DE PRODUCTOS
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: _crearTarjetaProducto(
                            '\$20.99', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/juego1.jpg')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _crearTarjetaProducto(
                            '\$201.86', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/gacha.jpg')),
                  ],
                ),
              ),

              // 6. SEGUNDA FILA DE PRODUCTOS (Nuevos precios)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: _crearTarjetaProducto(
                            '\$15.50', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/juego2.jpg')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _crearTarjetaProducto(
                            '\$45.00', 'https://raw.githubusercontent.com/CarlosLozano0257/Imagenes-para-flutter-6J-11-02-2026/refs/heads/main/juego3.jpg')),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Espacio final
            ],
          ),
        ),
      ),

      // BARRA DE NAVEGACIÓN INFERIOR
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 2.5)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.cyan, size: 36),
            Icon(Icons.chat_bubble_outline, color: Colors.black, size: 32),
            Icon(Icons.favorite_border, color: Colors.black, size: 32),
            Icon(Icons.person_outline, color: Colors.black, size: 32),
          ],
        ),
      ),
    );
  }

  // --- MÉTODOS AYUDANTES ---

  Widget _crearCategoria(IconData icono, String titulo) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.cyan,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2.5),
          ),
          child: Icon(icono, color: Colors.black, size: 28),
        ),
        const SizedBox(height: 6),
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Modificado para aceptar la URL de la imagen
  Widget _crearTarjetaProducto(String precio, String urlImagen) {
    return Container(
      height: 220, // Aumenté un poco la altura para que luzca mejor
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias, // Para que la imagen respete los bordes
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                urlImagen,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            precio,
            style: const TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
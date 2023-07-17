import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicionário'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomIconButton(
                  icon: Icons.list,
                  label: 'Word List',
                  isSelected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    print('Botão Word List pressionado!');
                    // Adicione a lógica para navegar para a tela de "Word List"
                  },
                ),
                _CustomIconButton(
                  icon: Icons.favorite,
                  label: 'Favorites',
                  isSelected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    print('Botão Favorites pressionado!');
                    // Adicione a lógica para navegar para a tela de "Favorites"
                  },
                ),
                _CustomIconButton(
                  icon: Icons.history,
                  label: 'History',
                  isSelected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    print('Botão History pressionado!');
                    // Adicione a lógica para navegar para a tela de "History"
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Conteúdo da tela principal'),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _CustomIconButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 32.0,
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

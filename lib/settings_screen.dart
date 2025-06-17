import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.primaryColor.withAlpha(60),
          appBar: AppBar(
            title: const Text('Configurações'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Escolha o tema do aplicativo:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: ThemeProvider.themeColors.length,
                    itemBuilder: (context, index) {
                      final themeName = ThemeProvider.themeColors.keys.elementAt(index);
                      final themeColor = ThemeProvider.themeColors[themeName]!;
                      final isSelected = themeProvider.selectedTheme == themeName;
                      
                      return GestureDetector(
                        onTap: () {
                          themeProvider.setTheme(themeName);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Tema "$themeName" selecionado!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColor.withAlpha(60),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? themeColor : Colors.grey.withAlpha(60),
                              width: isSelected ? 3 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: themeColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeColor.withAlpha(60),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                themeName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? themeColor : Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(60),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: themeProvider.primaryColor.withAlpha(60),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: themeProvider.primaryColor,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Informações',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sua escolha de tema será salva automaticamente e aplicada em todo o aplicativo, incluindo a cor de fundo.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


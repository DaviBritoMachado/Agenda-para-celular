import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class Description extends StatelessWidget {
  final String nome;
  final String description;
  const Description({super.key, required this.nome, required this.description});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child)
    {
      return Scaffold(
        backgroundColor: themeProvider.primaryColor.withAlpha(60),
        appBar: AppBar(
          title: Text(nome),
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
        ),
        body: content()
      );
    });
  }
  Widget content() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
      child: Text(
        description,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
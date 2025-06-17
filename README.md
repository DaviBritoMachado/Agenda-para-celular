# Cool Agenda

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

Um aplicativo de agenda simples e intuitivo desenvolvido em Flutter, projetado para ajudar você a organizar seus eventos e compromissos diários de forma eficiente. Com uma interface limpa e funcionalidades essenciais, o Cool Agenda torna o gerenciamento da sua rotina mais fácil e agradável.

## ✨ Funcionalidades

- **Visualização de Calendário**: Navegue facilmente pelos dias, semanas e meses com um calendário interativo.
- **Adição de Eventos**: Crie e gerencie seus eventos com detalhes importantes.
- **Personalização de Tema**: Altere o visual do aplicativo com 5 opções de cores vibrantes, incluindo uma cor de fundo dinâmica que se adapta ao tema escolhido.
- **Persistência de Dados**: Suas configurações de tema são salvas automaticamente e mantidas entre as sessões do aplicativo.

## 🚀 Como Usar

### Navegação Principal

Ao abrir o aplicativo, você será direcionado para a tela principal, onde o calendário e a lista de eventos do dia selecionado são exibidos. Você pode navegar entre os dias tocando nas datas no calendário.

### Adicionar um Evento

1. Toque no botão de ação flutuante (Floating Action Button) no canto inferior direito da tela.
2. Uma caixa de diálogo será exibida para você inserir o nome do evento.
3. Preencha o nome do evento e toque em "Salvar".

### Personalizar o Tema

1. Na tela principal, toque no ícone de **Configurações** (⚙️) localizado na barra superior (AppBar).
2. Você será levado à tela de configurações, onde encontrará 5 opções de cores para o tema do aplicativo.
3. Toque em qualquer um dos cards coloridos para selecionar um novo tema. A cor de fundo do aplicativo mudará instantaneamente para refletir sua escolha.
4. Uma mensagem de confirmação aparecerá na parte inferior da tela.
5. Sua escolha de tema será salva automaticamente e persistirá mesmo se você fechar e reabrir o aplicativo.

## 🛠️ Instalação e Execução

Para configurar e executar este projeto em sua máquina local, siga os passos abaixo:

### Pré-requisitos

Certifique-se de ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado e configurado em seu ambiente de desenvolvimento.

### Clonar o Repositório

```bash
git clone https://github.com/DaviBritoMachado/Agenda-para-celular.git
cd Agenda-para-celular
```

### Instalar Dependências

Navegue até o diretório do projeto e execute o comando para obter as dependências:

```bash
flutter pub get
```

### Executar o Aplicativo

Conecte um dispositivo Android ou iOS (ou inicie um emulador/simulador) e execute o aplicativo:

```bash
flutter run
```

## 📦 Dependências Utilizadas

As principais dependências deste projeto incluem:

- `flutter`: O framework principal para desenvolvimento de aplicativos.
- `table_calendar`: Um widget de calendário personalizável para Flutter.
- `intl`: Para internacionalização e formatação de datas.
- `provider`: Um pacote popular para gerenciamento de estado no Flutter, utilizado para gerenciar o tema do aplicativo.
- `shared_preferences`: Para persistir dados simples, como a escolha do tema do usuário, no dispositivo.

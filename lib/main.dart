import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:cool_agenda/utils.dart';
import 'package:cool_agenda/theme_provider.dart';
import 'package:cool_agenda/settings_screen.dart';
import 'package:cool_agenda/event_description.dart';

void main() {
  initializeDateFormatting("pt_BR", null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider()..loadTheme(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Cool Agenda',
            theme: themeProvider.themeData,
            home: const MyHomePage(title: 'Cool Agenda'),
          );
        },
      ),
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
  DateTime selectedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState((){
      selectedDay = day;
      _selectedEvents.value = _getEventsForDay(day);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.primaryColor.withAlpha(60),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                tooltip: 'Configurações',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Novo Evento"),
                    content: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            TextField(
                              controller: _eventController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome do evento',
                                )
                            ),
                            SizedBox(height: 16,),
                            TextField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Descrição do evento',
                              ),
                              maxLines: null,
                            )
                          ],
                        )
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            events.addAll({selectedDay: [Event(_eventController.text, _descriptionController.text)]});
                            Navigator.of(context).pop();
                            _selectedEvents.value = _getEventsForDay(selectedDay);
                            _eventController.clear();
                            _descriptionController.clear();
                          },
                          child: Text("Salvar"))
                    ],
                  );
                });
            },
              child: const Icon(Icons.add),
          ),
          body: content(),
        );
      },
    );
  }
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          //Text("Dia selecionado: " + selectedDay.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              locale: "pt_BR",
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true, titleTextStyle:TextStyle(fontSize: 18, color: Colors.white),),
              availableGestures: AvailableGestures.all,
              rowHeight: 43,
              eventLoader: _getEventsForDay,
              selectedDayPredicate: (day) => isSameDay(day, selectedDay),
              onDaySelected: _onDaySelected,
              focusedDay: selectedDay,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              calendarStyle: CalendarStyle(
                defaultTextStyle:TextStyle(color: Colors.white),
                weekNumberTextStyle:TextStyle(color: Colors.white),
                weekendTextStyle:TextStyle(color: Colors.white),

              ),
            )
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final event = value[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => //print('${value[index]}'),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              nome: event.title,
                              description: event.description,
                            ),
                          ),
                        ),
                        title: Text(event.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Cor do texto
                        )
                      ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intro_flutter_11_listview/model/day_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text("ListView"),
          centerTitle: true, //al posto di Center()
        ),
        body: Center(child: body()));
  }
}

// ListView:
// Visualizza una lista di elementi.
// A differenza di Column, ListView supporta lo scrolling,
// il che significa che può visualizzare un numero illimitato
// di widget figli fintanto che ci sia spazio sullo schermo
// per scorrere.

//v1.
// Widget body() => ListView(
//       //per ciclare tutti i giorni uso List.generate:
//       children: List.generate(
//         days.length,
//         (index) => DayOfTheMonth(days[index]),
//       ),
//     );

//v2 migliore:
// Utilizza ListView.builder per creare la lista di widget.
// Questo metodo è più efficiente perché crea solo i widget
// che sono attualmente visibili sullo schermo.
// Widget body() => ListView.builder(
//       //contatore:
//       itemCount: days.length,
//       // ritorna il widget da renderizzare:
//       itemBuilder: (context, index) => DayOfTheMonth(days[index]),
//       //per ciclare tutti i giorni uso List.generate:
//     );

// v3 con il separated + divider:
Widget body() => ListView.separated(
      itemCount: days.length,
      itemBuilder: (context, index) => DayOfTheMonth(days[index]),
      // posso mettere qualsiasi elemento per separare un elemento da un altro.
      // posso anche aggiungere della logica ad esso.
      separatorBuilder: (context, index) => index % 2 == 0
          ? const Divider(color: Colors.pink)
          : const Divider(color: Colors.blue),
    );

class DayOfTheMonth extends StatelessWidget {
  final DayModel model;
  const DayOfTheMonth(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    // le liste sono simili al componente Column
    // solo che è possiible scrollare in automatico
    // fa anche l'ottimizzazione grafico
    return ListTile(
      // per centrare il leading, creo una colonna che centra il tutto:
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.number.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      title: Text(model.day.toString()),
      subtitle: Text(model.month.toString()),
      // trailing: Text("trailing"),
    );
  }
}

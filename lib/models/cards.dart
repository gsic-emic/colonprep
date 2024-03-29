import 'dart:convert';
import 'dart:io';

import 'package:hospital/models/card.dart';
import 'package:hospital/services/cards_manager.dart';
import 'package:hospital/services/local_file.dart';

class Cards {
    List<Card>? cards;

    Cards({
        this.cards,
    });

    factory Cards.fromJson(String str) => Cards.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cards.fromMap(Map<String, dynamic> json) => Cards(
        cards: json["cards"] == null ? [] : List<Card>.from(json["cards"]!.map((x) => Card.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toMap())),
    };

    static Future<Cards> loadCards() async {
      try {
        File file = await LocalFile.getFile(LocalFile.cards);
        String leido = file.readAsStringSync();
        Cards cardsObj = Cards.fromJson(leido);
        cardsObj.sortCardsByTimestamp();
        return cardsObj;
      } on PathNotFoundException {
        return Cards();
      }
    }

    void sortCardsByTimestamp() {
      cards?.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
    }

    int getNumberOfToDoCards() {
      return cards?.where((card) => card.type == CardsManager.toDo).length ?? 0;
    }

    void saveCards() async {
      File file = await LocalFile.getFile(LocalFile.cards);
      file.openWrite(mode: FileMode.write);
      file.writeAsStringSync(toJson());
    }

    static Future<void> removeCards() async {
      File file = await LocalFile.getFile(LocalFile.cards);
      if(await file.exists()) {
        await file.delete();
      }
    }
}
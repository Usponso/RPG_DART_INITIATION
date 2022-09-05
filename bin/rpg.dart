import 'package:rpg/rpg.dart' as rpg;
import 'dart:math';

void main(List<String> arguments) {
  print("RPG GAME");

  rpg.Character c1 = rpg.Character("Toto", 100, 100, 100, 100, 5);
  rpg.Character c2 = rpg.Character("Tutu", 80, 80, 80, 80, 5);

  List<rpg.Character> order = <rpg.Character>[];

  int cpt = 1;

  while(c1.hp > 0 && c2.hp > 0){

    print("VERIF HP : ${c1.name} : ${c1.hp}HP - ${c2.name} : ${c2.hp}HP");
    int coinflip = Random().nextInt(2);
    
    order.clear();

    print("\n✦✦ TOUR $cpt ✦✦");

    if(coinflip==1){
      print("${c1.name} is starting");
      order.add(c1);
      order.add(c2);
    }else{
      print("${c2.name} is starting");
      order.add(c2);
      order.add(c1);
    }

    if((order[0].hp<=order[0].hpMax*0.3)){
      if(order[0].mana >= order[0].manaMax){
        order[0].heal();
      }
    }
    if(order[0].checkUlt()){
      print("🌟 ${order[0].name} ult 🌟");
      order[1].hp -= order[0].attack();
      order[0].cdUlt = 5;
    }else{
      order[0].reduceCD();
    }
    order[1].hp -= order[0].attack();
    order[0].finTour();

    if((order[1].hp<=order[1].hpMax*0.3)){
      if(order[1].mana >= order[1].manaMax){
        order[1].heal();
      }
    }
    if(order[1].checkUlt()){
      print("🌟 ${order[1].name} ult 🌟");
      order[0].hp -= order[1].attack();
      order[1].cdUlt = 5;
    }else{
      order[1].reduceCD();
    }
    order[0].hp -= order[1].attack();
    order[1].finTour();

    cpt++;
  }

  if(c1.hp <= 0){
    print("\n⭐⭐ ${c2.name} WON ! ⭐⭐");
  }else{
    print("\n⭐⭐ ${c1.name} WON ! ⭐⭐");
  }

  print("\nRESULTAT : ${c1.name} : ${c1.hp}HP / ${c2.name} : ${c2.hp}HP");
}

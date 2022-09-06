import 'package:rpg/character.dart' as rpg;
import 'dart:math';
import 'package:rpg/weapon.dart';

void main(List<String> arguments) {
  play();
}

void play(){
  print("RPG GAME");

  Axe axe = Axe("My axe");
  Sword sword = Sword("Excalibur");
  Bow bow = Bow("My bow");

  rpg.Character c1 = rpg.Character("Toto", 100, 100, 100, 100, 5, axe);
  rpg.Character c2 = rpg.Character("Tutu", 80, 80, 80, 80, 5, sword);

  List<rpg.Character> order = <rpg.Character>[];

  int cpt = 1;

  bool verif;

  while(c1.hp > 0 && c2.hp > 0){
    verif = false;

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
        verif = true;
      }
    }
    
    if(!verif){
      if(order[0].checkUlt()){
        order[1].hp -= order[0].ult();
        order[0].cdUlt = 5;
      }else{
        order[1].hp -= order[0].attack();
        order[0].reduceCD();
      }
    }
    order[0].finTour();

    verif = false;

    if((order[1].hp<=order[1].hpMax*0.3)){
      if(order[1].mana >= order[1].manaMax){
        order[1].heal();
        verif = true;
      }
    }
    
    if(!verif){
      if(order[1].checkUlt()){
        order[0].hp -= order[1].ult();
        order[1].cdUlt = 5;
      }else{
        order[0].hp -= order[1].attack();
        order[1].reduceCD();
      }
    }
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

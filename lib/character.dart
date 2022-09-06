import 'dart:math';
import 'weapon.dart';

int calculate() {
  return 6 * 7;
}

class Character{
  final String name;
  double hp;
  final double hpMax;
  double mana;
  final double manaMax;
  double cdUlt;
  Weapon weapon;

  Character(this.name,this.hp, this.hpMax,this.mana, this.manaMax,this.cdUlt,this.weapon);

  double attack(){
    print("WEAPON : ${weapon.name} / DAMAGES : ${weapon.damages}");
    double value = (Random().nextInt(10)+1) + (weapon.damages);
    print("💫 $name attacking : -$value 💫");
    return value;
  }

  void heal(){
    print("✨ $name healing.. ✨");
    mana = 0;
    hp+=(hpMax*0.5);
    // print("Healed : $hp HP");
  }

  void finTour(){
    mana+=2;
  }

  void reduceCD(){
    cdUlt--;
  }

  bool checkUlt(){
    return (cdUlt == 0) ? true : false;
  }

  double ult(){
    if(checkUlt()){ //If ult is available
      print("🌟 $name ult 🌟");
      double damages = weapon.specialAttack();
      print("💫 $name attacking : -$damages 💫");
      return damages; //Use the special attack of the weapon
    }
    else{ //If the ult is not ready
      return (Random().nextInt(10)+1) + (weapon.damages); //Basic attack
    }
  }
}

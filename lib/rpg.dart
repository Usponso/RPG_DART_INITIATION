import 'dart:math';

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

  Character(this.name,this.hp, this.hpMax,this.mana, this.manaMax,this.cdUlt);

  int attack(){
    int value = Random().nextInt(10)+1;
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
}

import 'dart:math';

class Weapon{
  final String name;
  double damages = 1;

  Weapon(this.name);

  double specialAttack(){
    return 0;
  }
}

class Axe extends Weapon{

  Axe(super.name);

  @override
  get damages => 3;

  @override
  double specialAttack(){
    return Random().nextInt(11)+10; //Random attack between 10 and 20 damages
  }
}

class Bow extends Weapon{

  Bow(super.name);

  @override
  get damages => 1;

  @override
  double specialAttack(){
    return (Random().nextInt(10)+1)*(Random().nextInt(10)+2); //Random attack multiplied
  }
}

class Sword extends Weapon{

  Sword(super.name);

  @override
  get damages => 2;

  @override
  double specialAttack(){
    return (Random().nextInt(10)+1)+(Random().nextInt(10)+1); //Random double attack
  }
}
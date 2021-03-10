
void entrcbt() {
  mapmusic.pause();
  design();  
  ennemi();
  combat();
  if (victoire==1) {// teleporte à la prochaine zone, les type 3 5 7 sont des boss 
    x = 4;// on est teleporté en debut de combat car même si on perd on ne va pas continuer dans la nouvelle zone
    y=36;
    victoire = 0;
  }
  if (victoire==2) {
    x = 45;
    y=8;
    victoire = 0;
  }
}


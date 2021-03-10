void design() {
  background(combat);
  if (hp>30) {
    fill(0, 255, 0);
  }
  if (hp<30) {
    fill(255, 0, 0);
  }
  rect(width/1.4-4, height/2, hp*1.36, 18);//hp du hero
  if (hpa>0) {// si l'ennemi est vivant, c'est pour éviter d'avoir une barre qui va dans les negatif quand l'ennemi a moin de 0 hp
    fill(0, 255, 0);
    rect(width/8.1-1, height/8+4, hpa/2*1.36, 18);// hp ennemi
  }
  fill(0, 0, 255);
  rect(width/1.4-4, height/1.85, mana*1.36, 5);// mana
  fill(0, 177, 177);
  rect(width/1.58, height/1.60, exp/niveau*1.8, 10);//exp
  fill(0);
  textSize(20);
  text("Lvl"+niveau, width/1.4-4, height/2.02);// Affiche notre niveau 
  text("Lvl"+lvennemi, width/8.1, height/8);// Affiche le niveau de l'ennemi 
  image(hero, width/8.1, height/2.81);// le hero qui se trouve en bas a gauche
}  


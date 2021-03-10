void map() {
  background(0);
  for (int i=0; i<100; i++) {
    for (int j=0; j<100; j++) { //naviguer dans le tableau
      if (plateau[i][j]==0) {
        image(sol, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120); //afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==10) {
        image(mur_hautv, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==11) {
        image(mur, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);
      }
      if (plateau[i][j]==12) {
        image(mur_hauth, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==1) {
        image(type1m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==4) {
        image(type4m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==5) {
        image(type5m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==6) {
        image(type6m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==7) {
        image(type7m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==2) {
        image(type2m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==3) {
        image(type3m, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==52) {
        image(os, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==50) {
        image(portegauche, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==51) {
        image(portedroite, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
      }
      if (plateau[i][j]==20) { 
        if (c==0) {  // coffre fermer
          image(coffre_fermer, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
        }
        if (c==1) {
          image(coffre_ouvert, (i-1-(x-3))*40*3, (j-1-(y-3))*120, 120, 120);//afficher une image en fonction du contenu du tableau
        }
      }
    }
  }
  fill(0, 255, 0);
  if (d==1) {
    image(dos, 240, 240, 120, 120);//image du perso quand on se déplace vers le haut
  }
  if (d==2) {
    image(face, 240, 240, 120, 120);//image du perso quand on se déplace vers le bas
  }
  if (d==3) {
    image(gauche, 240, 240, 120, 120);//image du perso quand on se déplace vers le gauche
  }
  if (d==4) {
    image(droite, 240, 240, 120, 120);//image du perso quand on se déplace vers le droit
  }
  if (touches['r']) { // revenir au menu sans sauvegarder
    mapmusic.pause();
    inmenu=1;
  }
  if (touches['z']) { //aller vers le haut
    if (plateau[x][y-1]==0) {// seulement si la case en haut est un sol
      y--;
      d=1;
      touches['z']=false;
    }
  }
  if (touches['s']) {//aller vers le bas
    if (plateau[x][y+1]==0) {// seulement si la case en bas est un sol
      y++;
      d=2;
      touches['s']=false;
    }
  }
  if (touches['q']) {//aller vers la gauche
    if (plateau[x-1][y]==0) {// seulement si la case à gauche est un sol
      x--;
      d=3;
      touches['q']= false;
    }
  }
  if (touches['d']) {//aller vers la droite
    if (plateau[x+1][y]==0) {// seulement si la case à droite est un sol
      x++;
      d=4;
      touches['d'] = false;
    }
  }
  if (touches['e']) {//interagir avec e
    touches['e']=false;
    if (plateau[x][y-1]==1 || plateau[x][y+1]==1 || plateau[x-1][y]==1 || plateau[x+1][y]==1) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=1;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==2 || plateau[x][y+1]==2 || plateau[x-1][y]==2 || plateau[x+1][y]==2) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=2;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==3 || plateau[x][y+1]==3 || plateau[x-1][y]==3 || plateau[x+1][y]==3) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=3;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==4 || plateau[x][y+1]==4 || plateau[x-1][y]==4 || plateau[x+1][y]==4) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=4;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==5 || plateau[x][y+1]==5 || plateau[x-1][y]==5 || plateau[x+1][y]==5) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=5;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==6 || plateau[x][y+1]==6 || plateau[x-1][y]==6 || plateau[x+1][y]==6) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=6;//type d'ennemi
      zero();
    }
    if (plateau[x][y-1]==7 || plateau[x][y+1]==7 || plateau[x-1][y]==7 || plateau[x+1][y]==7) {//seulement si ennemi à proximité
      battlemusic.play();//jouer musique de combat;
      battlemusic.loop();
      cbt=1;//entrer en combat
      type=7;//type d'ennemi
      zero();
    }
    if (c==0) {//si le coffre est fermé
      if (plateau[x][y-1]==20 || plateau[x][y+1]==20 || plateau[x-1][y]==20 || plateau[x+1][y]==20) { //si il 'a un coffre à proximité
        compteur=millis();
        tpdepause=1500;//temps d'affichage du texte de coffre
        c = 1;//le coffre est ouvert
        nbhp = int(random(1, 3));//contenu du coffre
        nbma = int(random(1, 3));
        potionhp = potionhp+nbhp;//addition à l'inventaire
        potionmana = potionmana+nbma;
        touches['e'] = false;
      }
    }
  }
  if (touches['w']) {//w pour revenir au menu en sauvegardant
    mapmusic.pause();//arreter la musique de map
    sauve();//sauvegarder
    output.flush();
    output.close();//fermer le fichier de sauvegarde
    inmenu=1;//revenir au menu
    saved=1;//un jeu est sauvegarder
    selectionpremenu=1;//selection sur nouvelle partie dans pré menu
  }
  if (millis()<=compteur+tpdepause) {  //afficher texte du coffre  pdt un temps      
    fill(255);
    textSize(10);
    rect(200, 235, 200, 50);
    fill(0);
    text("coffre ouvert : "+nbhp+" potion de vie", 225, 255);
    text("potion de vie ; "+nbma+" potion de mana", 225, 275);
  }
}
void keyPressed() {// boolean
  if (key<256)
    touches[key]=true;
}
void keyReleased() {
  if (key<256)
    touches[key]=false;
}


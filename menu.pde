AudioPlayer musique;
int selectionpremenu=1;
void menu() {
  if (inmenu==1) {
    musique.play();// une musique se joue quand on est dans le menu
    musique.loop();// en boucle
    background(menu);
    if (touches ['f'] ) {// on accede au second menu
      inmenu=2;
    }
  }
  if (inmenu==2) {
    textSize(32);
    background(0);
    fill(255);
    text("Continuer", 340, 250);
    text("Nouveau", 110, 250);
    text(" jeu", 150, 280);
    fill(133, 61, 43);
    text("Castle Crusher", 200, 100);
    fill(255);
    if (selectionpremenu==1) {// même type de selection que pour les combats
      text(">", width/8.6, height/2.4);
      if (touches['e']) {
        newsave();// on remet tout a zero, on retourne au niveau 1 et on est a la zone de depart 
        inmenu=3;
        mapmusic.play();
        mapmusic.loop();
        musique.pause();
      }
      if (touches['d']) {
        selectionpremenu=2;
        touches['d']=false;
      }
    }
    if (selectionpremenu==2) {
      if (touches['q']) {
        selectionpremenu=1;
        touches['q']=false;
      }
      if (touches['e']) {
        inmenu=3;
        mapmusic.play();
        mapmusic.loop();
        newsave();// on charge les données de depart
        load();// et on les remplace par celles sauvegardées 
        musique.pause();// la musique s'arrête
        touches['e']=false;// si on se trouve à coté d'un ennemi après avoir chargé la sauvegarde  ça empechera de lancer le combat directement
      }
      text(">", width/2, height/2.4);
    }
  }
}


//Projet du BAC en isn de Jean-Ethem, Mohammad Askar et Rayane Djaffar ts2 
PrintWriter output;//Sert pour sauvegarder
import ddf.minim.*;//Sert a inserer la musique
Minim minim;//Sert a inserer la musique 
AudioPlayer mapmusic;
AudioPlayer battlemusic;
AudioSample epee;//On initialise le son de l'epee
AudioSample loup;//On initialise le son du loup
AudioSample atkspe;//On initialise le son de l'attaque special
AudioSample block; //On initialise le son du bouclier quand on bloque 
AudioSample popo;//On initialise le son qui se joue quand on boit une potion
boolean[] touches=new boolean[256]; // on utilise un tableau boolean 
int inmenu=1;//variable pour savoir si on est en jeu, ou dans un menu et quel menu
int d=1;// variable definissant la direction du personnage
int[][] plateau; 
int x=3;// position à l'horizontal du personnage
int y=5;// position à la verticale du personnage
String[] lect;
int c=0; // coffre ouvert/fermé, le coffre n'est ouvrable qu'une fois par zone
int victoire=0;
int critique=int(random(0, 100));
int nbhp=0;// nombre de potion d'hp trouvé dans le coffre
int nbma=0;// nombre de potion de mana  trouvé dans le coffre
int cbt=0;// variable pour savoir si on est en combat
int hp=100; // vie
int mana=100; // mana
int niveau=0; // lvl
int exp=0; // experience
int hpa=200; // hp ennemi
int catk=2*niveau; // competence force tape + fort
int cdef=2*niveau; // competence defense plus de vie
int type=1; // variable defini
int degat=0;  //variable pour calculer les degats infligé par l'ennemi
int degaten=0;// variable pour calculer les degats infligé a l'ennemi
int compteur=0; // variable qui  sera utile pour faire une pause lors du combat pour laisser l'ennemi jouer 
int potionhp=0;// nombre de potion de vie
int potionmana=0; // nombre de potion de mana
int saved=0;//pour savoir si on a sauvegardé, utile quand on perd pour savoir si on prend la sauvegarde ou on recommence   
PImage mur_hautv;// image du mur verticale
PImage mur_hauth;// image du mur horizontale
PImage mur;// image du mur
PImage os;//image d'os
PImage portegauche;// image de la partie gauche de la porte 
PImage portedroite;// image de la partie droite de la porte
PImage dos;// image du hero de dos
PImage face;// image du hero de face
PImage gauche;// image du gero de gauche
PImage droite;// image du gero de droite
PImage sol;// image du sol
PImage combat; // image de fond du combat
PImage toural;//  image de selection entre attaque/sac
PImage touratk; // image de selection entre les attaques
PImage touritem; // image de selection entre les objets
PImage gameover;// image de fin de jeu si l'on perd
PImage type1;// image de l'ennemi 1 en combat 
PImage type1m;// image de l'ennemi 1 sur la map
PImage type2;// image de l'ennemi 2 en combat 
PImage type2m;// image de l'ennemi 2 sur la map
PImage type3;// image de l'ennemi 3 en combat 
PImage type3m;// image de l'ennemi 3 sur la map
PImage type4;// image de l'ennemi 4 en combat 
PImage type4m;// image de l'ennemi 4 sur la map
PImage type5;// image de l'ennemi 5 en combat 
PImage type5m;// image de l'ennemi 5 sur la map
PImage type6;// image de l'ennemi 6 en combat 
PImage type6m;// image de l'ennemi 6 sur la map
PImage type7;// image de l'ennemi 7 en combat 
PImage type7m;// image de l'ennemi 7 sur la map
PImage hero;// image du hero en combat
PImage menu;// image du menu
PImage coffre_ouvert; // Image du coffre ouvert 
PImage coffre_fermer; // Image du coffre ferme
PImage fin;//image de fin
void setup() {
  plateau = new int[100][100];
  lect=loadStrings("map.txt");
  for (int i = 0; i<100; i++) {
    String valeur[] = split(lect[i], " ");
    for (int j = 0; j<100; j++) {
      plateau[j][i]= int (valeur[j]);
    }
  }
  minim=new Minim(this);
  mapmusic=minim.loadFile("mapmusic.mp3");
  battlemusic=minim.loadFile("battlemusic.mp3");
  epee=minim.loadSample("epee.mp3");
  loup=minim.loadSample("loup.mp3");
  atkspe=minim.loadSample("atkspe.mp3");
  block=minim.loadSample("block.mp3");
  popo=minim.loadSample("mana.mp3");
  musique=minim.loadFile("musique1.mp3");
  coffre_fermer = loadImage("coffre_fermer.png");// on charge l'image du coffre fermé
  coffre_ouvert = loadImage("coffre_ouvert.png");// on charge l'image du coffre ouvert
  sol = loadImage("sol.png");// on charge l'image du sol
  mur_hautv = loadImage("mur_hautv.png");// on charge l'image du mur verticale
  mur_hauth = loadImage("mur_hauth.png");// on charge l'image du mur horizontale
  dos = loadImage("dos.png");// on charge l'image du hero de dos
  face = loadImage("face.png");// on charge l'image du hero de face
  gauche = loadImage("gauche.png");// on charge l'image du hero vers la gauche
  droite = loadImage("droite.png");// on charge l'image du hero vers la droite
  mur = loadImage("mur.png");// on charge l'image du mur
  portegauche = loadImage("portegauche.png");// on charge l'image de la partie gauche de la porte
  portedroite = loadImage("portedroite.png");// on charge l'image de la partie droite de la porte
  menu=loadImage("menu.jpg");// on charge l'image du menu
  combat=loadImage("combat.jpg");// on charge l'image du combat
  toural=loadImage("tour.jpg");// on charge l'image du tour
  touratk=loadImage("touratk.jpg");// on charge l'image de la selection d'attaque
  touritem=loadImage("touritem.jpg");// on charge l'image de la selection d'objet
  gameover=loadImage("gameover.jpg");// on charge l'image de fin de jeu
  hero=loadImage("hero.png");// on charge l'image du hero en combat
  type1=loadImage("type1.png");// on charge l'image de l'ennemi 1 en combat
  type1m=loadImage("type1m.png");// on charge l'image de l'ennemi 1 sur la map
  type2=loadImage("type2.png");// on charge l'image de l'ennemi 2 en combat
  os=loadImage("os.png");// on charge l'image d'os
  type2m=loadImage("type2m.png");// on charge l'image de l'ennemi 2 sur la map
  type3=loadImage("type3.png");// on charge l'image de l'ennemi 3 en combat
  type3m=loadImage("type3m.png");// on charge l'image de l'ennemi 3 sur la map
  type4=loadImage("type4.png");// on charge l'image de l'ennemi 4 en combat
  type4m=loadImage("type4m.png");// on charge l'image de l'ennemi 4 sur la map
  type5=loadImage("type5.png");// on charge l'image de l'ennemi 5 en combat
  type5m=loadImage("type5m.png");// on charge l'image de l'ennemi 5 sur la map
  type6=loadImage("type6.png");// on charge l'image de l'ennemi 6 en combat
  type6m=loadImage("type6m.png");// on charge l'image de l'ennemi 6 sur la map
  type7=loadImage("type7.png");// on charge l'image de l'ennemi 7 en combat
  type7m=loadImage("type7m.png");// on charge l'image de l'ennemi 7 sur la map
  fin = loadImage("fin.png");// on charge l'image de fin
  size(600, 600); // taille de l'ecran
}
void draw () {
  if (inmenu==1||inmenu==2) {//si on est dans le menu
    menu();
  }
  if (inmenu==3) {// si on est en dehors du  menu
    if (cbt==0) {//  si on est pas en combat
      map();
    }
    if (cbt==1) {//si on est en combat
      entrcbt();// on charge le combat
    }
  }
}


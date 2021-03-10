
void sauve() {
  output = createWriter("sauve.txt");// on crée le fichier
  output.println(hp);   // on met a la premiere ligne la vie qu'il nous reste 
  output.println(mana);
  output.println(niveau);
  output.println(exp);
  output.println(potionhp);
  output.println(potionmana);
  output.println(x);
  output.println(y);
  output.println(c);
  output.println(saved);
}
void load() {
  cbt=0;
  String  [] charg;
  charg=loadStrings("sauve.txt");//on charge le fichier txt présent dans le dossier
  hp=int(charg[0]);// on charge la vie qu'on a sauvegardé dans la premiere ligne
  mana=int(charg[1]);
  niveau=int(charg[2]);
  exp=int(charg[3]);
  potionhp=int(charg[4]);
  potionmana=int(charg[5]);
  x=int(charg[6]);
  y=int(charg[7]);
  c=int(charg[8]);
  saved = 1;
  tour = 0;
  catk=5*niveau; 
  cdef=2*niveau;
}
void newsave() {
  hp=100;
  mana=100;
  niveau=1;
  exp=0;
  potionhp=0;
  potionmana=0;
  x=3;
  y=5;
  c = 0;
  catk=2*niveau; 
  cdef=2*niveau;
  saved=0;
}

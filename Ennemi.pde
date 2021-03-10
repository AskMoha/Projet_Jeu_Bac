int lvennemi=1; //  niveau de l'ennemi
int defenn=0; // defense de l'ennemi
int atkenn=0; // attaque de l'ennemi
int expdonne=0; // exp que l'ennemi donne après l'avoir tué 
void ennemi() {
  if (type==1) {//loup dompté
    defenn=-5;
    atkenn=10;
    lvennemi=1;
    expdonne=50;
    image(type1, width/1.6, height/8);// Image du loup dans le coin haut droite
  }
  if (type==2) {//soldat lancier
    defenn=5;
    atkenn=10;
    lvennemi=3;
    expdonne=90;
    image(type2, width/1.6, height/8);// Image du soldat dans le coin haut droite
  }
  if (type==3) {// garde rouge
    defenn=10;
    atkenn=25;
    lvennemi=5;
    expdonne=200;
    image(type3, width/1.6, height/8);// Image du garde dans le coin haut droite
  }
  if (type==4) {// archer
    defenn=-30;
    atkenn=30;
    lvennemi=10;
    expdonne=120;
    image(type4, width/1.6, height/8);// Image du garde dans le coin haut droite
  }
  if (type==5) {// berserker
    defenn=70;
    atkenn=25;
    lvennemi=15;  
    expdonne=200;
    image(type5, width/1.6, height/8);// Image du garde dans le coin haut droite
  }
  if (type==6) {//garde royale
    defenn=60;
    atkenn=35;
    lvennemi=20;
    expdonne=200;
    image(type6, width/1.6, height/8);// Image du garde dans le coin haut droite
  }
  if (type==7) {// roi
    defenn=80;
    atkenn=50;
    lvennemi=0;
    expdonne=0;
    image(type7, width/1.6, height/8);// Image du garde dans le coin haut droite
  }
}

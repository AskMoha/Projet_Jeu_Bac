int tour=0;// Variable qui permet de chacun jouer a son tour 
int selection=1;// Variable permettant de selectionner l'attaque ou le sac 
int selectionitem=0;// Variable permettant de selectionner l'objet
int selectionatk=0;// Variable permettant de selectionner l'attaque 
int cooldownennemi1=0;// Permet à l'ennemi de faire une attaque spéciale, vu qu'il n'a pas de mana on lui met un temps de repos a son attaque 
int tpdepause=0;// Permet de mettre un temps de pause apres une action pour laisser l'ennemi faire son tour ou pour laisser un temps de repos entre deux actions
int def=0;//  Permet de bloquer l'attaque de l'ennemi
int fait=0;// Empeche de faire certaine action deux fois d'affilé
int atke=0;// Permet à l'ennemi d'attaquer normalement pendant le cooldown de son attaque spécial
void combat() {
  if (tour%2==0 &&hpa>0) {// tour utilisateur
    image(toural, width/2.32, height/1.45);//carre avec attaque et sac
    textSize(34);
    if (selection==1) { // petite fleche
      text(">", width/2.15, height/1.22);
    }
    if (touches['s'] && selection==1) {// petite fleche descend
      selection=2;// fleche devant sac
      touches['s']=false;//empeche l'utilisateur de selectionner deux menus en meme temps
    }
    if (touches['e']&& selection==1) {// on selectionne attaque
      selection=3;// permet de faire disparaitre le menu de choix entre attaque et sac
      selectionatk=1;// petite fleche devant l'attaque permet de selectionner
      touches['e']=false;//  regle des problemes dans certains cas
    }
    if (selection==3) {//on rentre dans la selection de l'attaque
      image(touratk, width/2.32, height/1.45);
      if (selectionatk==1) {// fleche devant premiere attaque
        text(">", width/2.15, height/1.22);
        if (catk*10>defenn) {// afficher la prévisualisation des dégâts 
          degaten=catk*10-defenn;
          text("- "+degaten, 250, 100);
        }
      }
      if (touches['e']&&selectionatk==1) {//on selectionne la premiere attaque
        if (defenn>catk*10) {
          degaten=0;// si l'ennemi a plus de defense que notre attaque l'attaque s'annule, si l'attaque se fait quand meme on fait une operation - (-..)  ce qui va soigner au lieu de taper
        }
        if (catk*10>defenn) {//  si l'attaque est superieur à la defense ennemi 
          degaten=catk*10-defenn;// on calcule les degats occasioné
          if (critique<10) {// pour les dégâts critiques
            degaten = degaten*2;
            critique = int(random(0, 100));
          }
          hpa=hpa-degaten;// et on la retire à la vie de l'ennemi
        }
        if (hpa-degaten<=0&&type==3) {
          victoire=1;
        }
        if (hpa-degaten<=0&&type==5) {
          victoire=2;
        }
        epee.trigger();// on joue le son de l'eppe
        atke=0;//permet à l'ennemi d'attaquer pendant que le temps de repos est superieur à 0
        tour++; // c'est le tour de l'ennemi
        compteur=millis();// On prend le moment où le tour de l'utilisateur a finit
        tpdepause=1500;// on met 1 seconde et demi d'attente
        def=0;//pas deux fois block d'affilé
        if (mana+5<100) {// on rend de la mana si la mana actuelle + celle gagnée n'est pas supérieur a 100
          mana=mana+5;
        }
      }
      if (touches['s'] &&selectionatk==1) {//descend  la selection
        selectionatk=2;// fleched devant attaque sp;
        touches['s']=false;//  empeche l'utilisateur de selectionner plusieurs attaque a la fois
      }
      if (touches['z'] &&selectionatk==2) {//monte la selection
        selectionatk=1;
        touches['z']=false;
      }
      if (touches['d']) {// prend la selection a droite
        if (selectionatk==1|selectionatk==2) {
          selectionatk=3;
          touches['d']=false;
        }
      }
      if (touches['r']) {// retourne a la selection entre attaque et objets 
        selectionatk=1;
        selection=1;
        touches['r']=false;
      }
    }
    if (selectionatk==2) {//attaque spéciale
      text(">", width/2.15, height/1.08);// fleche devant
      if (catk*12>defenn) {// afficher la prévisualisation des dégâts
        degaten=catk*12-defenn;
        text("- "+degaten, 250, 100);
      }
      if (touches['e']&&mana>=80) {// si on a assez de mana et qu'on appuie e
        if (defenn>catk*12) {// meme systeme que pour l'attaque normale
          degaten=0;
        }
        if (catk*12>defenn) {// 
          degaten=catk*12-defenn;
          hpa=hpa-degaten;
        }
        if (hpa-degaten<=0&&type==3) {
          victoire=1;
        }
        if (hpa-degaten<=0&&type==5) {
          victoire=2;
        }
        atkspe.trigger();// joue le son de l'attaque spéciale
        atke=0;
        tour++;
        mana=mana-80;// retire de la mana 
        selectionatk=0;
        if (hp+degaten/3>100) {
          hp=100;
        }
        if (hp+degaten/3<100) {//rend de la vie en fonction des degats infligé si la vie rendu nous permet pas d'avoir plus de 100hp
          hp=hp+degaten/3;
        }

        compteur=millis();
        tpdepause=1500;
        def=0;
      }
    }

    if (selectionatk==3) {//bloque
      text(">", width/1.39, height/1.22);
      if (touches['q']) {
        selectionatk=1;
      }
      if (touches['e']&&def<1) {
        compteur=millis();
        tpdepause=1500;
        tour++;
        def++;//permet de bloquer l'attaque ennemi
        block.trigger();
        if (mana+20<100) {// rend 20 mana si la mana recupérée ne permet pas d'obtenir plus de 100 mana, bloquer sert a temporiser un tour pour recuperer assez de mana pour l'attaque spéciale
          mana=mana+20;
        }
      }
    }
    if (selection==2) {// si on estdevant le menu d'objets
      text(">", width/2.15, height/1.08);
    }
    if (touches['z'] && selection==2) {
      selection=1;
    }
    if (touches['e']&&selection==2) {
      selection=4;// ouvre le menu objet
      selectionitem=1;
      touches['e']=false;
    }
    if (selection==4) {
      image(touritem, width/2.32, height/1.45);

      if (selectionitem==1) {
        text("> "+ potionhp, width/2.30, height/1.22); // fleche devant potion de vie, montre aussi le nombre de potion
        if (touches['e']&&potionhp>0) {//si on a plus de 50 hp( car sinon on a >100hp) et qu'on a au moin 1 potion
          popo.trigger();// le son de la potion se joue
          if (hp>=50) {
            hp=100;//permet de ne pas dépasser 100
          }//rend de la vie au hero
          if  (hp+50<100) {
            hp=hp+50; //rend de la vie au héros
          }
          potionhp--;// retire une potion
          tour++;// passe le tour
          atke=0;
          compteur=millis();
          tpdepause=2500;
          def=0;
        }
        if (touches['s']) {// selectionne la mana
          selectionitem=2;
          touches['s']=false;
        }
      }
      if (selectionitem==2) {
        text("> "+potionmana, width/2.30, height/1.08);
        if (touches['e']&&potionmana>0) {// ici il faut juste avoir au moin une potion de mana car la potion remet directement 100 mana au lieu d'en donner en addition 
          popo.trigger();// meme chose
          mana=100;
          potionmana--;
          tour++;
          compteur=millis();
          tpdepause=3000;
          def=0;
        }
        if (touches['z']) {
          selectionitem=1;
          touches['z']=false;
        }
      }
      if (touches['r']) {
        selection=1;
        selectionitem=0;
      }
    }
  }
  if (tour%2!=0&&touches['e']==false&&hpa>0) {// tour ennemi
    while (millis ()<compteur+tpdepause) {// tant  que le temps actuel n'est pas atteint par le temps mis en stock plus le temps d'attente il ne se passe rien
    }
    if (type==1) {
      if (def==0) {// si on se defend pas 
        degat=atkenn-cdef;
        if (degat>0) {
          hp=hp-degat;
        }
      }
      loup.trigger();// on joue le son du loup
      tour++;// c'est au tour de l'utilisateur
      selection=1;// on remet la selection a 1 
      selectionatk=1; // et la selection atk a 1
    }
    if (type==2) {// meme pour lui
      if (def==0) {
        degat=atkenn-cdef;
        if (degat>0) {
          hp=hp-degat;
        }
      }
      epee.trigger();// on joue le son de l'eppe
      tour++;
      selection=1;
      selectionatk=1;
    }
    if (type==3) {
      if (cooldownennemi1<=0) {// attaque spéciale de l'ennemi
        cooldownennemi1=5;// on met un cooldown a 5 tour
        if (def==0) {// si on defend pas 
          degat=atkenn*2-cdef;// on prend des degats plus fort que ceux qu'on aurait pris normalement
          if (degat>0) {
            hp=hp-degat;
          }
        }
      } else {
        if (def==0) {// après une attaque spéciale l'ennemi attaque normalement
          degat=atkenn-cdef;
          if (degat>0) {
            hp=hp-degat;
          }
          cooldownennemi1--;
        }
      }
      if (def==1) {//si on se defend le cooldown ne fait que baisser
        cooldownennemi1--;
      }
      epee.trigger();// on joue le son de l'eppe
      tour++;
      selection=1;
      selectionatk=1;
    }
    if (type==4) {
      if (cooldownennemi1<=0) {
        cooldownennemi1=5;
        if (def==0) {
          degat=atkenn*2-cdef;
          if (degat>0) {
            hp=hp-degat;
          }
        }
      } else {
        if (def==0) {
          degat=atkenn-cdef;
          if (degat>0) {
            hp=hp-degat;
          }
          cooldownennemi1--;
        }
      }
      if (def==1) {
        cooldownennemi1--;
      }
      epee.trigger();// on joue le son de l'eppe
      tour++;
      selection=1;
      selectionatk=1;
    }
    if (type==5) {
      if (cooldownennemi1<=0) {
        cooldownennemi1=5;
        if (def==0) {
          degat=atkenn*2-cdef;
          if (degat>0) {
            hp=hp-degat;
          }
        }
      } 
      if (def==0&&cooldownennemi1>0) {
        degat=atkenn-cdef;
        if (degat>0) {
          hp=hp-degat;
        }
        cooldownennemi1--;
      }
      if (def==1) {
        cooldownennemi1--;
      }
      epee.trigger();// on joue le son de l'eppe
      tour++;
      selection=1;
      selectionatk=1;
    }
    if (type==6) {
      if (def==0) {
        degat=atkenn-cdef;
        if (degat>0) {
          hp=hp-degat;
        }
        cooldownennemi1--;
      }      
      if (def==1) {
        cooldownennemi1--;
      }
      epee.trigger();// on joue le son de l'eppe
      tour++;
      selection=1;
      selectionatk=1;
    }
    if (type==7) {
      if (cooldownennemi1<=0&&selectionatk==2) {// l'attaque spéciale du boss finale ne se declenche que si on l'attaque avec une attaque spéciale, il la renvoie plus faiblement et se heal
        atkenn=atkenn+5;// il augmente son attaque en absorbant votre attaque spéciale
        if (degaten/2>0) {
          hp=hp-degaten/2;
        }// et vous renvoie une partie
        cooldownennemi1=4;//un cooldown est mis
        hpa=hpa+degaten;// et il se heal
        atke=1;// l'empeche de faire une attaque spéciale et attaque normale en meme temps
      } else {
        if (def==0&&atke==0) {// attaque normale
          degat=atkenn-cdef;
          if (degat>0) {
            hp=hp-degat;
          }
          cooldownennemi1--;
        }
        if (def==1) {
          cooldownennemi1--;
        }
        epee.trigger();// on joue le son de l'eppe
        tour++;
        selection=1;
        selectionatk=1;
      }
    }
  }
  if (type==7&&hpa<=0) {
    if (fait==0) {// on prend un temps de pause, qu'une fois 
      battlemusic.pause();//on stoppe la musique de combat
      compteur=millis();
      tpdepause=3000;
      fait=1;
    }
    if (millis()>compteur+tpdepause) {
      noLoop();
      background(fin);
    }
  }
  if (hpa<=0&&type!=7) {// si ce n'est pas le boss finale
    c=0;// referme le coffre
    nbhp = int(random(1, 3));//rechange les recompenses
    nbma = int(random(1, 3));
    selection=1;// retour a la selection entre le sac et l'attaque pour le prochain combat
    textSize(32);
    text("Vous avez gagné "+ expdonne + " exp", width/40, height/1.17);
    type=0;
    if (fait==0) {// empeche de donner l'exp a l'infini et la donne qu'une fois
      exp=exp+expdonne;// on  ajoute l'exp gagnée à celle qu'on à déjà 
      compteur=millis();// on reprend le temps qu'il est 
      tpdepause=3000;// et on y ajoutera 3 seconde de pause 
      fait=1;//on empeche les actions de se repeter
      tour++;// permet au prochain combat de se jouer normalement
      if (type==3) {
        victoire=1;
      }
      if (type==5) {
        victoire=2;
      }
    }
    if (millis()>compteur+tpdepause) {// après la pause
      mapmusic.play();
      mapmusic.loop();
      battlemusic.pause();//on stoppe la musique de combat
      cbt=0;// on retourne dans la carte
    }
  }
  if (exp>=100*niveau) {// permet de monter de niveau, on multiplie par niveau l'xp requise pour que ce soit de plus en plus dure de monter de niveau
    niveau++;
    exp=0;
    hp=100;// toute notre vie est rendue
    mana=100;// ainsi que notre mana
    catk=2*niveau;// niveau augmente donc coompetence augmente 
    cdef=2*niveau;
  }
  if (hp<=0) {//si on meurt
    if (fait==0) {// on prend un temps de pause, qu'une fois 
      battlemusic.pause();//on stoppe la musique de combat
      compteur=millis();
      tpdepause=3000;
      fait=1;
    }
    background(gameover);// le background change
    if (millis()>compteur+tpdepause) {// et après la pause
      cbt=0;// le combat ne termine
      tour++;// permet au prochain combat de se jouer normalement
      if (saved==1) {
        load();//on reprend la derniere sauvegarde
        mapmusic.play();
        mapmusic.loop();
      }
      if (saved==0) {
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
        tour=0;
        mapmusic.play();
        mapmusic.loop();
      }
    }
  }
}


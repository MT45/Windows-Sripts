::Creation des user
net user President /add
net user Secretaire /add
net user Tresorier /add
net user Entraineur /add
net user Animateur /add
net user Preparateur_Physique /add
net user Kine /add
net user Joueur_1 /add
net user Joueur_2 /add
net user Joueur_3 /add
net user Joueur_4 /add
net user Joueur_5 /add
net user Joueur_6 /add
net user Joueur_7 /add
net user Joueur_8 /add
net user Joueur_9 /add
net user Joueur_10 /add
net user Benvole_1 /add
net user Benvole_2 /add

::Creation des Groupes
net localgroup Administration /add
net localgroup Equipe_Encadrante /add
net localgroup Equipe_Medical /add
net localgroup Equipe_Sport /add

::Ajout des user dans les groupes
net localgroup Administration President Secretaire Tresorier /add
net localgroup Equipe_Encadrante Entraineur Animateur Preparateur_Physique Kine Benvole_1 Benvole_2 /add
net localgroup Equipe_Medical Preparateur_Physique Kine /add
net localgroup Equipe_Sport Entraineur Animateur Joueur_1 Joueur_2 Joueur_3 Joueur_4 Joueur_5 Joueur_6 Joueur_7 Joueur_8 Joueur_9 Joueur_10 /add

pause
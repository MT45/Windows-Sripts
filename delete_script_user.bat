::Delete des user
net user President /delete
net user Secretaire /delete
net user Tresorier /delete
net user Entraineur /delete
net user Animateur /delete
net user Preparateur_Physique /delete
net user Kine /delete
net user Joueur_1 /delete
net user Joueur_2 /delete
net user Joueur_3 /delete
net user Joueur_4 /delete
net user Joueur_5 /delete
net user Joueur_6 /delete
net user Joueur_7 /delete
net user Joueur_8 /delete
net user Joueur_9 /delete
net user Joueur_10 /delete
net user Benvole_1 /delete
net user Benvole_2 /delete

::Delete des user dans les groupes
net localgroup Administration President Secretaire Tresorier /delete
net localgroup Equipe_Encadrante Entraineur Animateur Preparateur_Physique Kine Benvole_1 Benvole_2 /delete
net localgroup Equipe_Medical Preparateur_Physique Kine /delete
net localgroup Equipe_Sport Entraineur Animateur Joueur_1 Joueur_2 Joueur_3 Joueur_4 Joueur_5 Joueur_6 Joueur_7 Joueur_8 Joueur_9 Joueur_10 /delete

::Delete des Groupes
net localgroup Administration /delete
net localgroup Equipe_Encadrante /delete
net localgroup Equipe_Medical /delete
net localgroup Equipe_Sport /delete
pause
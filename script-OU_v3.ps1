Import-Module ActiveDirectory

# ======================================================
# DOMAIN BASE
# ======================================================
$DomainDN = "DC=tip17,DC=local"
$Domain = "@tip17.local"
$Password = ConvertTo-SecureString "Afp@2026*" -AsPlainText -Force

# ======================================================
# ROOT OUs
# ======================================================
New-ADOrganizationalUnit -Name "Entreprise" -Path $DomainDN -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Administration" -Path "OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Equipes" -Path "OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

# ======================================================
# ADMINISTRATION
# ======================================================

# ================= PDG =================
New-ADOrganizationalUnit -Name "PDG" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=PDG,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=PDG,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Christian Signol" -GivenName "Christian" -Surname "Signol" `
-SamAccountName "christian.signol" -UserPrincipalName "christian.signol$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=PDG,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Administration =================
New-ADOrganizationalUnit -Name "Administration" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Christian Jacq" -GivenName "Christian" -Surname "Jacq" `
-SamAccountName "christian.jacq" -UserPrincipalName "christian.jacq$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Paolo Cuelho" -GivenName "Paolo" -Surname "Cuelho" `
-SamAccountName "paolo.cuelho" -UserPrincipalName "paolo.cuelho$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Administration,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Secretaire =================
New-ADOrganizationalUnit -Name "Secretaire" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "JK Rowling" -GivenName "JK" -Surname "Rowling" `
-SamAccountName "jk.rowling" -UserPrincipalName "jk.rowling$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Robin Hoob" -GivenName "Robin" -Surname "Hoob" `
-SamAccountName "robin.hoob" -UserPrincipalName "robin.hoob$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Anne Robillard" -GivenName "Anne" -Surname "Robillard" `
-SamAccountName "anne.robillard" -UserPrincipalName "anne.robillard$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Secretaire,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= RH =================
New-ADOrganizationalUnit -Name "RH" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=RH,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=RH,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=RH,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=RH,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=RH,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Henri Loevenbruck" -GivenName "Henri" -Surname "Loevenbruck" `
-SamAccountName "henri.loevenbruck" -UserPrincipalName "henri.loevenbruck$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=RH,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Camilla Lackberg" -GivenName "Camilla" -Surname "Lackberg" `
-SamAccountName "camilla.lackberg" -UserPrincipalName "camilla.lackberg$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=RH,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Comptable =================
New-ADOrganizationalUnit -Name "Comptable" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Philip K.Dick" -GivenName "Philip" -Surname "Dick" `
-SamAccountName "philip.dick" -UserPrincipalName "philip.dick$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Oscar Wilde" -GivenName "Oscar" -Surname "Wilde" `
-SamAccountName "oscar.wilde" -UserPrincipalName "oscar.wilde$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Comptable,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Ventes =================
New-ADOrganizationalUnit -Name "Ventes" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Leon Tolstoï" -GivenName "Leon" -Surname "Tolstoi" `
-SamAccountName "leon.tolstoi" -UserPrincipalName "leon.tolstoi$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Pierre Lemaitre" -GivenName "Pierre" -Surname "Lemaitre" `
-SamAccountName "pierre.lemaitre" -UserPrincipalName "pierre.lemaitre$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Ventes,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Commercial =================
New-ADOrganizationalUnit -Name "Commercial" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Hari Murakami" -GivenName "Hari" -Surname "Murakami" `
-SamAccountName "hari.murakami" -UserPrincipalName "hari.murakami$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Ken Follett" -GivenName "Ken" -Surname "Follett" `
-SamAccountName "ken.follett" -UserPrincipalName "ken.follett$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Lewis Caroll" -GivenName "Lewis" -Surname "Caroll" `
-SamAccountName "lewis.caroll" -UserPrincipalName "lewis.caroll$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Commercial,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ================= Logistique =================
New-ADOrganizationalUnit -Name "Logistique" -Path "OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Adjoint" -Path "OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoint,OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoint,OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Umberto Eco" -GivenName "Umberto" -Surname "Eco" `
-SamAccountName "umberto.eco" -UserPrincipalName "umberto.eco$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "David Gemmell" -GivenName "David" -Surname "Gemmell" `
-SamAccountName "david.gemmell" -UserPrincipalName "david.gemmell$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Guillaume Musso" -GivenName "Guillaume" -Surname "Guillaume" `
-SamAccountName "guillaume.musso" -UserPrincipalName "guillaume.musso$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoint,OU=Logistique,OU=Administration,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ======================================================
# EQUIPES
# ======================================================

# ================= Centre des Services =================
New-ADOrganizationalUnit -Name "Centre des Services" -Path "OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

# Adjoints
New-ADOrganizationalUnit -Name "Adjoints" -Path "OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Adjoints,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Adjoints,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Agatha Christie" -GivenName "Agatha" -Surname "Christie" `
-SamAccountName "agatha.christie" -UserPrincipalName "agatha.christie$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Adjoints,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# Managers
New-ADOrganizationalUnit -Name "Managers" -Path "OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Managers,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Managers,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Franck Thilliez" -GivenName "Franck" -Surname "Thilliez" `
-SamAccountName "franck.thilliez" -UserPrincipalName "franck.thilliez$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Managers,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Marc Levy" -GivenName "Marc" -Surname "Levy" `
-SamAccountName "marc.levy" -UserPrincipalName "marc.levy$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Managers,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# Developpeurs
New-ADOrganizationalUnit -Name "Developpeurs" -Path "OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Developpeurs,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Developpeurs,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Michel Houellebecq" -GivenName "Michel" -Surname "Houellebecq" `
-SamAccountName "michel.houellebecq" -UserPrincipalName "michel.houellebecq$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Developpeurs,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Michel Bussy" -GivenName "Michel" -Surname "Bussy" `
-SamAccountName "michel.bussy" -UserPrincipalName "michel.bussy$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Developpeurs,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# Responsables
New-ADOrganizationalUnit -Name "Responsables" -Path "OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "JRR Tolkien" -GivenName "JRR" -Surname "Tolkien" `
-SamAccountName "jrr.tolkien" -UserPrincipalName "jrr.tolkien$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Maxime Chattam" -GivenName "Maxime" -Surname "Chattam" `
-SamAccountName "maxime.chattam" -UserPrincipalName "maxime.chattam$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Amelie Nothomb" -GivenName "Amelie" -Surname "Nothomb" `
-SamAccountName "amelie.nothomb" -UserPrincipalName "amelie.nothomb$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Jean Paul Sartres" -GivenName "Jean-Paul" -Surname "Sartres" `
-SamAccountName "jean-paul.sartres" -UserPrincipalName "jean-paul.sartres$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Responsables,OU=Centre des Services,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

# ======================================================
# EQUIPE NIV1
# ======================================================
New-ADOrganizationalUnit -Name "Equipe Niv1" -Path "OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "Alfred de Vigny" -GivenName "Alfred" -Surname "de Vigny" `
-SamAccountName "alfred.devigny" -UserPrincipalName "alfred.devigny$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Joachim Du Bellay" -GivenName "Joachim" -Surname "Du Bellay" `
-SamAccountName "joachim.dubellay" -UserPrincipalName "joachim.dubellay$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Louis Ferdinand Celine" -GivenName "Louis" -Surname "Celine" `
-SamAccountName "louis.celine" -UserPrincipalName "louis.celine$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Paul Eluard" -GivenName "Paul" -Surname "Eluard" `
-SamAccountName "paul.eluard" -UserPrincipalName "paul.eluard$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Victor Hugo" -GivenName "Victor" -Surname "Hugo" `
-SamAccountName "victor.hugo" -UserPrincipalName "victor.hugo$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv1,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true


# ======================================================
# EQUIPE NIV2
# ======================================================
New-ADOrganizationalUnit -Name "Equipe Niv2" -Path "OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "User" -Path "OU=Equipe Niv2,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Computer" -Path "OU=Equipe Niv2,OU=Equipes,OU=Entreprise,$DomainDN" -ProtectedFromAccidentalDeletion $false

New-ADUser -Name "William Shakespeare" -GivenName "William" -Surname "Shakespeare" `
-SamAccountName "william.shakespeare" -UserPrincipalName "william.shakespeare$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv2,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Edgar Allan Poe" -GivenName "Edgar" -Surname "Poe" `
-SamAccountName "edgar.poe" -UserPrincipalName "edgar.poe$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv2,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true

New-ADUser -Name "Ernest Hemingway" -GivenName "Ernest" -Surname "Hemingway" `
-SamAccountName "ernest.hemingway" -UserPrincipalName "ernest.hemingway$Domain" `
-AccountPassword $Password -Enabled $true `
-Path "OU=User,OU=Equipe Niv2,OU=Equipes,OU=Entreprise,$DomainDN" `
-PasswordNeverExpires $true


Write-Host "✅ COMPLETED" -ForegroundColor Green
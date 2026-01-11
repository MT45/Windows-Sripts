#############################################
# ROOT OU
#############################################

New-ADOrganizationalUnit -Name "Entreprise" -Path "DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

#############################################
# Responsable
#############################################

New-ADOrganizationalUnit -Name "Morthal" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Morthal,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Morthal-Group" -GroupScope Global -Path "OU=Morthal,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Morthal User1" -GivenName "Morthal" -Surname "User1" -SamAccountName "MorthalUser1" -UserPrincipalName "MorthalUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Morthal,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Morthal User2" -GivenName "Morthal" -Surname "User2" -SamAccountName "MorthalUser2" -UserPrincipalName "MorthalUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Morthal,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Morthal User3" -GivenName "Morthal" -Surname "User3" -SamAccountName "MorthalUser3" -UserPrincipalName "MorthalUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Morthal,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Morthal-Group" -Members "MorthalUser1","MorthalUser2","MorthalUser3"


#############################################
# AUBETROILE
#############################################

New-ADOrganizationalUnit -Name "Aubetroile" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Aubetroile,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Aubetroile-Group" -GroupScope Global -Path "OU=Aubetroile,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Aubetroile User1" -GivenName "Aubetroile" -Surname "User1" -SamAccountName "AubetroileUser1" -UserPrincipalName "AubetroileUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Aubetroile,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Aubetroile User2" -GivenName "Aubetroile" -Surname "User2" -SamAccountName "AubetroileUser2" -UserPrincipalName "AubetroileUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Aubetroile,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Aubetroile User3" -GivenName "Aubetroile" -Surname "User3" -SamAccountName "AubetroileUser3" -UserPrincipalName "AubetroileUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Aubetroile,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Aubetroile-Group" -Members "AubetroileUser1","AubetroileUser2","AubetroileUser3"


#############################################
# BLANCHERIVE
#############################################

New-ADOrganizationalUnit -Name "Blancherive" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Blancherive,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Blancherive-Group" -GroupScope Global -Path "OU=Blancherive,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Blancherive User1" -GivenName "Blancherive" -Surname "User1" -SamAccountName "BlancheriveUser1" -UserPrincipalName "BlancheriveUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Blancherive,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Blancherive User2" -GivenName "Blancherive" -Surname "User2" -SamAccountName "BlancheriveUser2" -UserPrincipalName "BlancheriveUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Blancherive,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Blancherive User3" -GivenName "Blancherive" -Surname "User3" -SamAccountName "BlancheriveUser3" -UserPrincipalName "BlancheriveUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Blancherive,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Blancherive-Group" -Members "BlancheriveUser1","BlancheriveUser2","BlancheriveUser3"


#############################################
# FORTDHIVER
#############################################

New-ADOrganizationalUnit -Name "Fortdhiver" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Fortdhiver,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Fortdhiver-Group" -GroupScope Global -Path "OU=Fortdhiver,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Fortdhiver User1" -GivenName "Fortdhiver" -Surname "User1" -SamAccountName "FortdhiverUser1" -UserPrincipalName "FortdhiverUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Fortdhiver,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Fortdhiver User2" -GivenName "Fortdhiver" -Surname "User2" -SamAccountName "FortdhiverUser2" -UserPrincipalName "FortdhiverUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Fortdhiver,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Fortdhiver User3" -GivenName "Fortdhiver" -Surname "User3" -SamAccountName "FortdhiverUser3" -UserPrincipalName "FortdhiverUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Fortdhiver,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Fortdhiver-Group" -Members "FortdhiverUser1","FortdhiverUser2","FortdhiverUser3"


#############################################
# MARKARTH
#############################################

New-ADOrganizationalUnit -Name "Markarth" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Markarth,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Markarth-Group" -GroupScope Global -Path "OU=Markarth,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Markarth User1" -GivenName "Markarth" -Surname "User1" -SamAccountName "MarkarthUser1" -UserPrincipalName "MarkarthUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Markarth,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Markarth User2" -GivenName "Markarth" -Surname "User2" -SamAccountName "MarkarthUser2" -UserPrincipalName "MarkarthUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Markarth,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Markarth User3" -GivenName "Markarth" -Surname "User3" -SamAccountName "MarkarthUser3" -UserPrincipalName "MarkarthUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Markarth,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Markarth-Group" -Members "MarkarthUser1","MarkarthUser2","MarkarthUser3"


#############################################
# SOLITUDE
#############################################

New-ADOrganizationalUnit -Name "Solitude" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Solitude,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Solitude-Group" -GroupScope Global -Path "OU=Solitude,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Solitude User1" -GivenName "Solitude" -Surname "User1" -SamAccountName "SolitudeUser1" -UserPrincipalName "SolitudeUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Solitude,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Solitude User2" -GivenName "Solitude" -Surname "User2" -SamAccountName "SolitudeUser2" -UserPrincipalName "SolitudeUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Solitude,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Solitude User3" -GivenName "Solitude" -Surname "User3" -SamAccountName "SolitudeUser3" -UserPrincipalName "SolitudeUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Solitude,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Solitude-Group" -Members "SolitudeUser1","SolitudeUser2","SolitudeUser3"


#############################################
# FAILLAISE
#############################################

New-ADOrganizationalUnit -Name "Faillaise" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Faillaise,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Faillaise-Group" -GroupScope Global -Path "OU=Faillaise,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Faillaise User1" -GivenName "Faillaise" -Surname "User1" -SamAccountName "FaillaiseUser1" -UserPrincipalName "FaillaiseUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Faillaise,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Faillaise User2" -GivenName "Faillaise" -Surname "User2" -SamAccountName "FaillaiseUser2" -UserPrincipalName "FaillaiseUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Faillaise,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Faillaise User3" -GivenName "Faillaise" -Surname "User3" -SamAccountName "FaillaiseUser3" -UserPrincipalName "FaillaiseUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Faillaise,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Faillaise-Group" -Members "FaillaiseUser1","FaillaiseUser2","FaillaiseUser3"


#############################################
# VENDOME
#############################################

New-ADOrganizationalUnit -Name "Vendome" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Vendome,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Vendome-Group" -GroupScope Global -Path "OU=Vendome,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Vendome User1" -GivenName "Vendome" -Surname "User1" -SamAccountName "VendomeUser1" -UserPrincipalName "VendomeUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Vendome,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Vendome User2" -GivenName "Vendome" -Surname "User2" -SamAccountName "VendomeUser2" -UserPrincipalName "VendomeUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Vendome,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Vendome User3" -GivenName "Vendome" -Surname "User3" -SamAccountName "VendomeUser3" -UserPrincipalName "VendomeUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Vendome,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Vendome-Group" -Members "VendomeUser1","VendomeUser2","VendomeUser3"


#############################################
# FALKREATH
#############################################

New-ADOrganizationalUnit -Name "Falkreath" -Path "OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Forts" -Path "OU=Falkreath,OU=Entreprise,DC=tip8,DC=local" -ProtectedFromAccidentalDeletion $False

New-ADGroup -Name "Falkreath-Group" -GroupScope Global -Path "OU=Falkreath,OU=Entreprise,DC=tip8,DC=local"

New-ADUser -Name "Falkreath User1" -GivenName "Falkreath" -Surname "User1" -SamAccountName "FalkreathUser1" -UserPrincipalName "FalkreathUser1@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Falkreath,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Falkreath User2" -GivenName "Falkreath" -Surname "User2" -SamAccountName "FalkreathUser2" -UserPrincipalName "FalkreathUser2@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Falkreath,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True
New-ADUser -Name "Falkreath User3" -GivenName "Falkreath" -Surname "User3" -SamAccountName "FalkreathUser3" -UserPrincipalName "FalkreathUser3@tip8.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "Afp@2026*" -Force) -Enabled $true -ChangePasswordAtLogon $false -Path "OU=Falkreath,OU=Entreprise,DC=tip8,DC=local" -PasswordNeverExpires $True

Add-ADGroupMember -Identity "Falkreath-Group" -Members "FalkreathUser1","FalkreathUser2","FalkreathUser3"
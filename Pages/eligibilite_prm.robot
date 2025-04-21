*** Settings ***
Library    OperatingSystem
Library  RequestsLibrary
Library    JSONLibrary
Library  Collections


*** Variables ***
${TCM_API_eligibilite}    https://particuliers-alpiq.oc-i.eu/api/ext/eligibilite-prm   #https://particuliers-alpiq.oc-i.eu/api/ext/souscription    #https://particuliers-alpiq.oc-i.eu/souscription/1   #https://particuliers-alpiq.oc-i.eu/conseiller #https://alpiq.oc-i.eu/ext/souscription    #
#${JSON FILE}    C:/Users/ITNV/PycharmProjects/PythonProject/.venv/JsonFiles/Souscription.json
${token_val}    Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ0ZXN0QHRlc3QuY29tIiwic2VjcmV0IjoidGVzdCJ9.XHO_6pHJsswmCqeDJw8-Vjc8a_GB2COG22RR8gHbG-o
${JSON_PATH}    C:/Users/ITNV/PycharmProjects/PythonProject/Poc_API/JsonFiles/


*** Test Cases ***
Test API ELIGIBILITE PRM
  [Documentation]   Test pour valider le GET request API eligibilite PRM
  ...   Cette route permet de retourner, pour un PDL son éligibilité à l’offre Alpiq.
  ...   Vérification dans Opencell, qu’il n’existe pas un OrderItem en création ou en cours pour le PDL demandé.

  [Tags]  GET

    Create Session  alias  ${TCM_API_eligibilite}   #verify=true
    &{HEADERS}   Create Dictionary    Content-Type=application/json; charset=utf-8   Authorization=${token_val}

    ${json}  Get Binary File   ${JSON_PATH}Souscription.json
    ${response}=   GET ON Session  alias  ${TCM_API_eligibilite}  data=${json}   headers=${HEADERS}
    log  data
    Should Be Equal As Numbers    ${response.status_code}    200


#Ceci un commentaire
#Lire un Fichier JSON
#    Log  ${JSON FILE}
#    ${data}=    Load JSON From File    ${JSON FILE}
#    Log    ${data}

#
#Accéder à une Valeur Spécifique Dans le JSON
#    ${data}=    Load JSON From File    ${JSON FILE}
#    ${value}=   Get From JSON    ${data}    key1
#    Log    ${value}
#
#Modifier une Valeur Dans le JSON
#    ${data}=    Load JSON From File    ${JSON FILE}
#    Set To JSON    ${data}    key1    nouvelle_valeur
#    Save JSON To File    ${data}    ${JSON FILE}















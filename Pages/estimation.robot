*** Settings ***
Library    OperatingSystem
Library  RequestsLibrary
Library    JSONLibrary
Library  Collections


*** Variables ***
${TCM_API_estimation}          https://particuliers-alpiq.oc-i.eu/estimation   #https://particuliers-alpiq.oc-i.eu/api/ext/esigibilite-prm   #https://particuliers-alpiq.oc-i.eu/api/ext/souscription    #https://particuliers-alpiq.oc-i.eu/souscription/1   #https://particuliers-alpiq.oc-i.eu/conseiller #https://alpiq.oc-i.eu/ext/souscription    #
#${JSON FILE}    C:/Users/ITNV/PycharmProjects/PythonProject/.venv/JsonFiles/Souscription.json
${token_val}    Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ0ZXN0QHRlc3QuY29tIiwic2VjcmV0IjoidGVzdCJ9.XHO_6pHJsswmCqeDJw8-Vjc8a_GB2COG22RR8gHbG-o
${JSON_PATH}    C:/Users/ITNV/PycharmProjects/PythonProject/Poc_API/JsonFiles/


*** Test Cases ***

Test API ESTIMATION
  [Documentation]   Test pour valider le GET request API Estimation
  ...  Cette route permet de retourner, pour une consommation, une puissance souscrite et une option tarifaire,
  ...  une estimation de budget et mensualité d’une offre donnée.
  ...  Le retour contient 2 éléments, un correspondant aux prix pour une énergie verte à 0% et l’autre à 100%.

  [Tags]  GET

    Create Session  alias  ${TCM_API_estimation}
    &{HEADERS}   Create Dictionary    Content-Type=application/json; charset=utf-8   Authorization=${token_val}

    ${json}  Get Binary File   ${JSON_PATH}Souscription.json
    ${response}=   GET ON Session  alias  ${TCM_API_estimation}  data=${json}   headers=${HEADERS}
    log  data
    Should Be Equal As Numbers    ${response.status_code}    200
    #Should Contain    ${response.text}    "success"


#
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

#












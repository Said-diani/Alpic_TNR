*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library    JSONLibrary
Library  Collections



*** Variables ***
${TCM_API_soucription}          https://particuliers-alpiq.oc-i.eu/souscription/1   #https://particuliers-alpiq.oc-i.eu/api/ext/souscription    #https://particuliers-alpiq.oc-i.eu/souscription/1   #https://particuliers-alpiq.oc-i.eu/conseiller #https://alpiq.oc-i.eu/ext/souscription    #
#${JSON FILE}    C:/Users/ITNV/PycharmProjects/PythonProject/.venv/JsonFiles/Souscription.json
${token_val}    Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ0ZXN0QHRlc3QuY29tIiwic2VjcmV0IjoidGVzdCJ9.XHO_6pHJsswmCqeDJw8-Vjc8a_GB2COG22RR8gHbG-o
${JSON_PATH}    C:/Users/ITNV/PycharmProjects/PythonProject/Poc_API/JsonFiles/
${Yopmail_USER}    paulette.raynaud@yopmail.com
${Yopmail_URL}     https://yopmail.com/

*** Test Cases ***

Test API SOUSCRIPTION
    [Documentation]  Cette route permet de créer un démarrage de souscription et d’envoyer au prospect un email
    ...   lui permettant de la valider.

    [Tags]  POST

    Create Session  alias  ${TCM_API_soucription}
    &{HEADERS}   Create Dictionary    Content-Type=application/json; charset=utf-8   Authorization=${token_val}

    ${json}  Get Binary File   ${JSON_PATH}Souscription.json
    ${response}=   POST ON Session  alias  ${TCM_API_soucription}  data=${json}   headers=${HEADERS}
    log  data
    Should Be Equal As Numbers    ${response.status_code}    200

Verification Mail Boite Yopmail
     Open Browser  ${Yopmail_URL}  chrome
     Set Selenium Implicit Wait  5
     Input Text    //input[@name='login']   ${Yopmail_USER}
     Click Element  //div[@id="refreshbut"]/button
     Select Frame  ifinbox
     Click Element  //div[text()='Veuillez confirmer votre souscription chez Alpiq']

     Unselect Frame
     Select Frame  ifmail
     ${mailbody}  Get Text   //div[@id='mail']

     should contain  ${mailbody}  Vous venez de démarrer une souscription par téléphone et nous vous en remercions.




#
#  [Documentation]   Test pour valider le GET request API Souscription
#  [Tags]  GET
#  Create Session  jsonplaceholder    ${TCM_API_soucription}
#  ${response}=  GET   ${TCM_API_soucription}
#
#  Should be Equal As Numbers  ${response.status_code}  200
#  Log   ${response}

#Lire un Fichier JSON
#   Log  ${JSON FILE}
#   ${data}=    Load JSON From File    ${JSON FILE}
#   Log    ${data}

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














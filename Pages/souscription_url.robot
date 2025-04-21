*** Settings ***
Library    OperatingSystem
Library  RequestsLibrary
Library    JSONLibrary
Library  Collections


*** Variables ***
${TCM_API_soucription_url}        https://particuliers-alpiq.oc-i.eu/souscription/1   #https://particuliers-alpiq.oc-i.eu/conseiller #https://alpiq.oc-i.eu/ext/souscription    #
#${HEADERS}     Content-Type=application/json
${JSON FILE}    C:/Users/ITNV/PycharmProjects/PythonProject/.venv/JsonFiles/SouscriptionUrl.json




*** Test Cases ***
Test API SOUSCRIPTION URL
  [Documentation]   Test pour valider le POST request API Souscription URL
  [Tags]  GET
  Create Session  jsonplaceholder    ${TCM_API_soucription_url}
  ${response}=  GET   ${TCM_API_soucription_url}

  Should be Equal As Numbers  ${response.status_code}  200
  Log   ${response}

Lire un Fichier JSON
    Log  ${JSON FILE}
    ${data}=    Load JSON From File    ${JSON FILE}
    Log    ${data}

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
#Send POST Request
    &{HEADERS}   Create Dictionary    Content-Type=application/json; charset=utf-8
    ${response}=    POST    ${TCM_API_soucription_url}     data=${data}   headers=${HEADERS}
    log  data
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.content}
    #Should Contain    ${response.text}    "success"













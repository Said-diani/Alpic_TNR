*** Settings ***

Resource    eligibilite_prm.robot
Resource    estimation.robot
Resource    GlobalALPIQ.robot
Resource    grille_tarifaire.robot
Resource    souscription.robot
Resource    souscription_renvoi.robot
Resource    souscription_statut.robot
Resource    souscription_statut-liste.robot
Resource    souscription_url.robot


*** Variables ***
${token_val}    Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ0ZXN0QHRlc3QuY29tIiwic2VjcmV0IjoidGVzdCJ9.XHO_6pHJsswmCqeDJw8-Vjc8a_GB2COG22RR8gHbG-o
${JSON_PATH}    C:/Users/ITNV/PycharmProjects/PythonProject/.venv/JsonFiles/

*** Keywords ***
Fichier Global
 log   fichier Global for Test API


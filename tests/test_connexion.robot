*** Settings ***     
Resource    ../variables/variables.robot
Resource    ../resources/resources.robot
Resource    ../pages/login_page.robot

# Suite Setup    Open Application
# Suite Teardown    Close Application
Test Setup    Open Application
Test Teardown    Close Application
    

*** Test Cases ***
Test Connexion valide
    Login avec identifiants    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Location Is    ${URL}inventory.html

Test Connexion invalide
    Login avec identifiants    ${VALID_USERNAME}    ${WRONG_PASSWORD}
    Page Should Contain Element    //div[@class='error-message-container error']
    

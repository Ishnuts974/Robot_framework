*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USERNAME_INPUT}    id:user-name
${PASSWORD_INPUT}    id:password
${LOGIN_BUTTON}    id:login-button

*** Keywords ***
Login avec identifiants
    [Arguments]    ${username}    ${password}
    Input Text     ${USERNAME_INPUT}    ${username}
    Input Text     ${PASSWORD_INPUT}    ${password}
    Click Button   ${LOGIN_BUTTON}
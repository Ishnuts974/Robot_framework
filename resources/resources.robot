*** Settings ***
Library    SeleniumLibrary    run_on_failure=No
Resource  ../variables/variables.robot

*** Keywords ***
Open Application
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--incognito")

Close Application
    Close Browser
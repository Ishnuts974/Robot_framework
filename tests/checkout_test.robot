*** Settings ***
Resource    ../resources/resources.robot
Resource    ../pages/product_page.robot
Resource    ../pages/panier_page.robot
Resource    ../pages/login_page.robot
Resource    ../pages/checkout_page.robot


Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Finalisation de commande avec succès
     [Tags]    POEI2-1051    
    Login avec identifiants   ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart
    Go To Cart
    Page Should Contain    Sauce Labs Backpack
    Go To Checkout
    #Page Should Contain    Checkout: Your Information
    Fill Checkout Form    ${FIRST_NAME_FILL}    ${LAST_NAME_FILL}    ${ZIP_CODE_FILL}
    #Log    ${CHECKOUT_FIRSTNAME_INPUT}
    #Log    ${FIRST_NAME_FILL}
    #Page Should Contain   Checkout: Overview
    Finish Checkout
    Page Should Contain    Products
    

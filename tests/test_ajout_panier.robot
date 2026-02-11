*** Settings ***
Resource    ../resources/resources.robot
Resource    ../pages/login_page.robot
Resource    ../pages/product_page.robot
Resource    ../pages/panier_page.robot
Resource    ../variables/variables.robot

Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
Ajouter un produit au panier
    Login avec identifiants   ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart
    Go To Cart
    Page Should Contain    Sauce Labs Backpack
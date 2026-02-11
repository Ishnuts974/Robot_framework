*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/variables.robot

*** Variables ***
${CHECKOUT_BTN}    id:checkout
${CHECKOUT_FIRSTNAME_INPUT}    id:first-name
${CHECKOUT_LAST_NAME_INPUT}    id:last-name
${CHECKOUT_ZIP_CODE_INPUT}    id:postal-code
${CONTINUE}    id:continue
${FINISH}    id:finish
${BACK_TO_PRODUCTS}      id:back-to-products
${CONFIRM_MSG}    class:complete-header

*** Keywords ***

Fill Checkout Form
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    Input Text    ${CHECKOUT_FIRSTNAME_INPUT}    ${firstname}
    Input Text    ${CHECKOUT_LAST_NAME_INPUT}     ${lastname}
    Input Text    ${CHECKOUT_ZIP_CODE_INPUT}      ${zipcode}
    Click Button    ${CONTINUE}

Finish Checkout
    Click Button    ${FINISH}
    Page Should Contain Element    ${CONFIRM_MSG}
    Click Button    ${BACK_TO_PRODUCTS}
    Wait Until Page Contains    Products

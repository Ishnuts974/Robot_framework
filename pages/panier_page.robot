*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${REMOVE_BTN}    id:remove-sauce-labs-backpack
${CHECKOUT_BTN}    id:checkout
${cONTINUE_SHOPPING}    id:continue-shopping

*** Keywords ***
Remove Product From Cart
    Click Button    ${REMOVE_BTN}  

Go To Checkout
        Page Should Contain Button    ${CHECKOUT_BTN}
        Click Button    ${CHECKOUT_BTN}
        
Go To Continue Shopping  
    Click Button    ${CONTINUE_SHOPPING}




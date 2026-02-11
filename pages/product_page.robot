*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BTN}    id:add-to-cart-sauce-labs-backpack
${CART_ICON}    class:shopping_cart_link


*** Keywords ***
Add Product To Cart
    Click Button   ${ADD_TO_CART_BTN}

Go To Cart
    Click Element   ${CART_ICON}
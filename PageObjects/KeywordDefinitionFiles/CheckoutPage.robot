*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Delivery Address
    [Arguments]    ${Expected_value}
    Element Should Be Visible   xpath://h3[text()='Your delivery address']/parent::li/parent::ul/li[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Expected_value}']

Verify Billing Address
    [Arguments]    ${Expected_value}
    Element Should Be Visible   xpath://h3[text()='Your billing address']/parent::li/parent::ul/li[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Expected_value}']
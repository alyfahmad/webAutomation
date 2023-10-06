*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Item in Cart by Item Name
    [Arguments]    ${Item_Name}
    Wait Until Page Contains Element    xpath://h4/a[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']   timeout=10
    Element Should Be Visible   xpath://h4/a[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']
*** Settings ***
Library    SeleniumLibrary
Variables    ../StaticLocators/HomePageLocators.py

*** Keywords ***
Add Item to Cart Based on Item Name
    [Arguments]    ${Item_Name}
    Scroll Element Into View    xpath:(//p[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']/following-sibling::a)[1]
    Wait Until Element Is Visible   xpath:(//p[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']/following-sibling::a)[1]      timeout=10
    Mouse Over      xpath:(//p[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']/following-sibling::a)[1]
    Click Element    xpath://div[@class='product-overlay']//p[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Item_Name}']/following-sibling::a
    Wait Until Element Is Visible    xpath://h4[text()='Added!']    timeout=10

Verify Logged in Username
    [Arguments]    ${Expected_Username}
    Wait Until Element Is Visible   ${UsernameLocator}    timeout=10
    ${Actual_Username}=     Get Text    ${UsernameLocator}
    Should Be Equal As Strings      ${Actual_Username}      ${Expected_Username}

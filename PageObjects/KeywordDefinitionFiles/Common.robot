*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables    ../StaticLocators/CommonLocators.py

*** Keywords ***
Open Browser, Navigate to Specified Url and Maximize Window
    [Arguments]     ${Browser}      ${Url}
    Open Browser    url=${Url}      browser=${Browser}      executable_path=../Resources/Webdriver/chromedriver.exe     options=
    Maximize Browser Window

Verify Page Title
    [Arguments]    ${Page_Title}
    Wait Until Page Contains Element    xpath://title[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Page_Title}')]        timeout=10
    Page Should Contain Element   xpath://title[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Page_Title}')]

Click Button Based On Button Text
    [Arguments]     ${Button_Text}      ${Is_Anchor}=${False}
    IF    ${Is_Anchor}==${False}
        Scroll Element Into View    xpath://button[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Button_Text}')]
        Click Element    xpath://button[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Button_Text}')]
    ELSE
        Scroll Element Into View    xpath://a[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Button_Text}')]
        Click Element    xpath://a[contains(normalize-space(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')), '${Button_Text}')]
    END

Click on Link Based on Text
    [Arguments]    ${Link_Text}
    Wait Until Element Is Visible    xpath://u[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Link_Text}']/parent::a  timeout=10
    Click Element    xpath://u[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Link_Text}']/parent::a

Input Text into Form Based on Label
    [Arguments]     ${Label}      ${Input_Text}
    Scroll Element Into View    xpath://label[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Label}']/following-sibling::input
    Wait Until Element Is Visible   xpath://label[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Label}']/following-sibling::input     timeout=10
    Input Text      xpath://label[normalize-space(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))='${Label}']/following-sibling::input     ${Input_Text}

Scroll Subscription Into View
    Scroll Element Into View    ${SubscriptionSectionLocator}
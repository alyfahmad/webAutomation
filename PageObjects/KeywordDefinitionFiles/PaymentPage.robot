*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables    ../StaticLocators/PaymentPageLocators.py

*** Keywords ***
Input Current Year into Year Field
    ${Current_Year}=     Get Current Date    result_format=%Y
    Input Text      ${ExpiryYearLocator}    ${Current_Year}

Verify Successful Payment
    Element Should Be Visible       ${SuceessfulPaymentToaster}
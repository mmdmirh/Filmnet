*** Settings ***
Documentation     A test suite for www.filmnet.ir
Library           SeleniumLibrary
Test Setup      Open filmnet

*** Variables ***
${BROWSER}      Chrome
${URL}          https://www.filmnet.ir
${Submit_XPATH}     //button[@type='submit']
${Login_item_XPATH}  //a[contains(text(),'ورود')]
${Error_XPATH}     //div[@type='error']
${alert_XPATH}  //div[@id='alerts']
${MSISDN}       09361224439
${password}     12345678
${OTP}  1234
${wrong_otp}  4321
${wrong_password}  65432345
${OTP_Button_XPATH}     (//button[@type='button'])[3]

*** Keywords ***
Open filmnet
    [Documentation]    Open the browser and navigate to filmnet.ir
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    فیلم نت | تماشای آنلاین فیلم و سریال

Login page submit MSISDN
    [Documentation]    Open the login page and enter the MSISDN
    ${MSISDN_XPATH}  Locator XPATH  id=msisdn
    Wait Until Element Is Visible    ${Login_item_XPATH}  30s
    Click Element    ${Login_item_XPATH}
    Wait Until Element Is Visible   ${MSISDN_XPATH}  5m
    Input Text      ${MSISDN_XPATH}  ${MSISDN}
    Click Element  ${Submit_XPATH}

Locator XPATH
    [Arguments]     ${id}
    RETURN      //input\[@id='${id}']

*** Test Cases ***
Correct Password Login
   [Documentation]    use msisdn+static password to login
   ${Password_XPATH}  Locator XPATH  id=password
   Login page submit MSISDN
   Wait Until Element Is Visible  ${Password_XPATH}
   Input Text  ${Password_XPATH}    ${password}
   Click Element  ${Submit_XPATH}
Wrong Password Login
   [Documentation]    The UI should return a wrong password error
   ${Password_XPATH}  Locator XPATH  id=password
   Login page submit MSISDN
   Wait Until Element Is Visible  ${Password_XPATH}
   Input Text  ${Password_XPATH}    ${wrong_password}
   Click Element  ${Submit_XPATH}
   Wait Until Element Is Visible    ${Error_XPATH}
   Element Should Contain    ${Error_XPATH}    رمز عبور شما نادرست است

Correct OTP Login
    [Documentation]  use msisd+OTP  to login
    ${OTP_XPATH}  Locator XPATH  id=otp
    Login page submit MSISDN
    Wait Until Element Is Visible    ${OTP_Button_XPATH}
    Click Button    ${OTP_Button_XPATH}
    Wait Until Element Is Visible    ${OTP_XPATH}
    Input Text    ${OTP_XPATH}    ${OTP}
    Click Element  ${Submit_XPATH}

Wrong OTP Login
    [Documentation]  use msisd+OTP  to login
    ${OTP_XPATH}  Locator XPATH  id=otp
    Login page submit MSISDN
    Wait Until Element Is Visible    ${OTP_Button_XPATH}
    Click Button    ${OTP_Button_XPATH}
    Wait Until Element Is Visible    ${OTP_XPATH}
    Input Text    ${OTP_XPATH}    ${Wrong_OTP}
    Click Element  ${Submit_XPATH}
    Element Should Contain    ${Error_XPATH}    رمز عبور شما نادرست است

More than 3 times attempt OTP Login
    [Documentation]  Get too many requests error
    ${OTP_XPATH}  Locator XPATH  id=otp
    Login page submit MSISDN
    Wait Until Element Is Visible    ${OTP_Button_XPATH}
    Click Button    ${OTP_Button_XPATH}
    Sleep    1s
    ${text}  Get Text    ${Error_XPATH}
    Log To Console    ${text}
    Element Should Contain    ${alert_XPATH}  تعداد درخواست بیش از حد مجاز است




#    [Teardown]    Close Browser
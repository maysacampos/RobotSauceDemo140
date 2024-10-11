# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Variables ***
${SAUCE_USERNAME}    oauth-maysacampos06-e170f    
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub

*** Test Cases ***
Calculadora
    Open Application    ${REMOTE_URL}     
    ...    platformName=Android    
    ...    appium:platformVersion=9.0    
    ...    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator   
    ...    appium:deviceOrientation=portrait    
    ...    appium:app=storage:filename=Calculator_8.4 (503542421)_APKPure.apk    
    ...    appium:appPackage=com.google.android.calculator     
    ...    appium:appActivity=com.android.calculator2.Calculator    
    ...    appium:automationName=uiautomator2
    ...    browserName=
    ...    appium:ensureWebviewsHavePages=${True}

#Somar
    ${el1} =    Set Variable     accessibility_id=4
    Click Element    ${el1}
    ${el2} =    Set Variable     accessibility_id=plus
    Click Element    ${el2}
    ${el3} =    Set Variable     accessibility_id=3
    Click Element    ${el3}
    ${el4} =    Set Variable     accessibility_id=equals
    Click Element    ${el4}
    ${el5} =    Set Variable     accessibility_id=clear

#Subtrair
    Click Element    ${el5}
    ${el6} =    Set Variable     accessibility_id=8
    Click Element    ${el6}
    ${el7} =    Set Variable     accessibility_id=minus
    Click Element    ${el7}
    ${el8} =    Set Variable     accessibility_id=2
    Click Element    ${el8}
    ${el9} =    Set Variable     accessibility_id=equals
    Click Element    ${el9}
    ${el10} =    Set Variable     accessibility_id=clear

#Multiplicar
    Click Element    ${el10}
    ${el11} =    Set Variable     accessibility_id=3
    Click Element    ${el11}
    ${el12} =    Set Variable     accessibility_id=multiply
    Click Element    ${el12}
    ${el13} =    Set Variable     accessibility_id=4
    Click Element    ${el13}
    ${el14} =    Set Variable     accessibility_id=equals
    Click Element    ${el14}
    ${el15} =    Set Variable     accessibility_id=clear

#Dividir
    Click Element    ${el15}
    ${el16} =    Set Variable     accessibility_id=9
    Click Element    ${el16}
    ${el17} =    Set Variable     accessibility_id=divide
    Click Element    ${el17}
    ${el18} =    Set Variable     accessibility_id=3
    Click Element    ${el18}
    ${el19} =    Set Variable     accessibility_id=equals
    Click Element    ${el19}
    ${el20} =    Set Variable     accessibility_id=clear
    Click Element    ${el20}

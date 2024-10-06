*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    5000ms
${url}        https://www.saucedemo.com
${browser}    Chrome
${date}    

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot    # se caso acontecer falha ao abrir o navegador
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Fechar navegador
    Sleep    500ms    # pode ser necessário para dar tempo
                      # de realizar a última ação/validação
    Close Browser

Clicar no Carrinho
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Realizar Logout                        # 1:00h apenas 1 (fazer o mapeamento total)
    Click Button    id=react-burger-menu-btn        # click element
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_logo    ${timeout}



Obter Data e Hora
 # Ler a data e hora do Sistema Operacional | Y ANO INTEIRO, m NUMERO DO MES,d DIA, 24 HORAS, M MINUTOS, S SEGUNDOS
    ${date} =    Get Current Date
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}
Tirar Screenshot    
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    screenshots/saucedemo/${date}/${TEST_NAME}/${screenshot_name}.jpg

    #1 - screenshots/<system_name>/<test_name>/<date>.jpg
    #2 - screenshots/<system_name>/<date>/<test_name>.jpg

    #1 - selecionar_produto_po/2024.05.15_20.11.jpg
    #2 - 2024.05.15_20.11/selecionar_produto_po.jpg

    #3 - screenshots/<system_name>/<ano>/<mes>/<dia>/<hora>/<test_name>

# suite setup = antes de todos os testes
# before / setup = executa antes de cada script
# script
# after / teardown = executa depois de cada script
# suite teardown = depois de tudo


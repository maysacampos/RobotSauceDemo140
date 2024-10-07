*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser      #para finalizar o teste, fecha o navegador

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome
${timeout}    10000ms

*** Test Cases ***
# frases --> Keywords
Selecionar Sauce Labs Backpack
    Dado que acesso o site SauceDemo
    Quando preencho o campo usuario    standard_user
    E preencho o campo senha    secret_sauce
    E clico no botao Login
    Entao sou direcionado para a pagina de produtos
    Quando clico no produto    Sauce Labs Backpack    $29.99
    Entao sou direcionado para a pagina do produto
    Quando clico em adicionar no carrinho
    Entao visualizo o numero de items no carrinho    1
    Quando clico no icone do carrinho
    Entao sou direcionado para a pagina do carrinho
    Quando clico no menu burguer
    E clico em Logout
    Entao sou direcionado para a pagina de login
    # Wait Until Keyword Succeeds    
    # ...    Entao sou direcionado para a pagina do produto    
    # ...    15x    3s    Outra Keyword


*** Keywords ***
Dado que acesso o site SauceDemo
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window    
    Set Browser Implicit Wait    5000ms    #tempo
    Wait Until Element Is Visible    css=.login_logo    ${timeout}    # espera ate o elemento X estar visivel

Quando preencho o campo usuario
    [Arguments]    ${username}
    Input Text     css=[data-test="username"]    ${username}
    
E preencho o campo senha
    [Arguments]    ${password}
    Input Password     css=[data-test="password"]    ${password}   
    
E clico no botao Login
    Click Button    id=login-button

Entao sou direcionado para a pagina de produtos
    Wait Until Element Is Visible    css=.title    ${timeout}
 #   Element Text Should Be    css=.title    css=.title                        ERRO
 #   Wait Until Element Contains    css=.title    css=.title    ${timeout}     ERRO    59min

Quando clico no produto
    [Arguments]    ${product_name}    ${product_price}
    Set Test Variable    ${test_product_name}    ${product_name}         # para lembrar o nome do produto para todos
    Set Test Variable    ${test_product_price}    ${product_price}       # para lembrar o preço do produto para todos
    Click Element    css=img[alt="${test_product_name}"]                 # clicar na imagem ou no titulo, trocar          

Entao sou direcionado para a pagina do produto
    Wait Until Element Is Visible    name=back-to-products    ${timeout}   # ver 2:13h
    Element Text Should Be    name=back-to-products    Back to products
    Element Text Should Be    css=div.inventory_details_name.large_size    ${test_product_name}
    Element Text Should Be    css=div.inventory_details_price    ${test_product_price}

Quando clico em adicionar no carrinho
    Click Element    css=button.btn.btn_primary.btn_small.btn_inventory

Entao visualizo o numero de items no carrinho
    [Arguments]    ${cart_items}
    Set Test Variable    ${test_cart_items}    ${cart_items}        # salvar para usar nos outros
    Element Text Should Be    css=span.shopping_cart_badge    ${test_cart_items}

Quando clico no icone do carrinho
    Click Link    ${test_cart_items}

Entao sou direcionado para a pagina do carrinho
    Wait Until Element Contains    css=.title    Your Cart            # ver se carregou a página (texto fixo que aparece so nessa tela)
    Element Text Should Be    css=div.inventory_item_name    ${test_product_name}      #2h44min
    Element Text Should Be    css=div.inventory_item_price   ${test_product_price}
    Element Text Should Be    css=div.cart_quantity          ${test_cart_items}

Quando clico no menu burguer
    Click Element    id=react-burger-menu-btn

E clico em Logout
    Click Element    link=Logout                    # 23min
Entao sou direcionado para a pagina de login
    Wait Until Element Is Visible    css=input.submit-button.btn_action    5000ms


   
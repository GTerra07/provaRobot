*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teste de Abertura da Loja
    [Documentation]    Testa a abertura da loja online
    Open Browser    https://www.saucedemo.com/v1/    Firefox    executable_path=C:\\Users\\Gabriel Terra\\AppData\\Local\\Programs\\Python\\Python312\\Scripts\\geckodriver.exe
    [Teardown]    Close Browser

Teste de Login
    [Documentation]    Testa o processo de login no site
    Open Browser    https://www.saucedemo.com/v1/    Firefox    executable_path=C:\\Users\\Gabriel Terra\\AppData\\Local\\Programs\\Python\\Python312\\Scripts\\geckodriver.exe
    [Tags]    Login
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    css=.btn_action
    Wait Until Page Contains Element    css=.inventory_list
    [Teardown]    Close Browser

Teste de Seleção e Adição de Produto ao Carrinho
    [Documentation]    Testa a seleção de um produto e a adição ao carrinho
    Open Browser    https://www.saucedemo.com/v1/    Firefox    executable_path=C:\\Users\\Gabriel Terra\\AppData\\Local\\Programs\\Python\\Python312\\Scripts\\geckodriver.exe
    [Tags]    AdicionarAoCarrinho
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    css=.btn_action
    Wait Until Page Contains Element    css=.inventory_list
    Click Button    css=.btn_primary.btn_inventory
    Wait Until Page Contains Element    css=.shopping_cart_badge
    [Teardown]    Close Browser

Teste de Finalização de Compra
    [Documentation]    Testa o processo de finalização de compra
    [Tags]    FinalizarCompra
    Open Browser    https://www.saucedemo.com/v1/checkout-step-two.html    Firefox    executable_path=C:\\Users\\Gabriel Terra\\AppData\\Local\\Programs\\Python\\Python312\\Scripts\\geckodriver.exe
    Fill Checkout Information
    Click Finish Button
    [Teardown]    Close Browser

*** Keywords ***
Fill Checkout Information
    Wait Until Page Contains Element    css=.checkout_info
    Input Text    id=first-name    Gabriel
    Input Text    id=last-name    Terra
    Input Text    id=postal-code    12345

Click Finish Button
    Click Link    css=.cart_button[href*="checkout-complete.html"]

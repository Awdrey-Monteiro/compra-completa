*** Settings ***
Library  SeleniumLibrary
Library  Screenshot
Library    OperatingSystem
Test Teardown  Close All Browsers

*** Variables ***
${URL}            http://automationpractice.com/
${BROWSER}        chrome
${ITEM_COMPRA}    Blouse
*** Keywords ***
Abrir Navegador e maximizar
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

*** Test Cases ***
Cenário: Compra completa no site automationpractice.com
    #PRIMEIRA FORMA
    #Open Browser    browser=chrome
    #Go to           http://automationpractice.com/

    #SEGUNDA FORMA
    #Open Browser    ${URL}  ${BROWSER}
    #Maximize Browser Window

    #TERCEIRA FORMA
    Abrir Navegador e maximizar

    #RESTANTE
    #Press Keys      name=search_query    shirt   ENTER

    Click Element                    link=${ITEM_COMPRA}
    Click Button                     name=Submit
    Wait Until Element Is Visible    id=layer_cart  timeout=10s
    Click Element                    xpath=//a[@title="Proceed to checkout"]
    # Tela de compra
    Wait Until Page Contains         ${ITEM_COMPRA}
    Click Element                    xpath=//a[@href="http://automationpractice.com/index.php?controller=order&step=1"] 
    # Tela Login
    Input Text          id=email    pakace4726@ilusale.com
    Input Password      id=passwd    robotframework
    Click Button        id=SubmitLogin
    # Tela de confirmação de endereço de entrega
    Sleep   10s
    Click Button    name=processAddress
    # Tela de Entrega
    Select Checkbox    id=cgv
    Click Button   name=processCarrier
    # Tela de Pagamento
    Click Element   xpath=//a[@href="http://automationpractice.com/index.php?fc=module&module=bankwire&controller=payment"] 
    Click Button    xpath=//button[@type="submit"] 
    


    
    
    

    
    




                      
    
    

   
  


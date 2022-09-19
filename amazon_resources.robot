*** Settings ***
Library        SeleniumLibrary
Library    XML


*** Variables *** 
${URL}                 http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[text()='Eletrônicos e Tecnologia']
${HEADER_MENSAGEM_INVALIDA}  //div[@class='a-alert-content'][contains(.,'Não encontramos uma conta associada a este endereço de e-mail')]
${INPUT_EMAIL_INVALIDO}      //input[contains(@name,'email')]




*** Keywords ***
Abrir o navegador
  Open Browser  browser=chrome
  Maximize Browser Window

Fechar o navegador
  Capture Page Screenshot
  Close Browser  

Acessar a home page do site Amazon.com.br
  Go To    url=${URL} 
  Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
  Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
  Wait Until Page Contains    text=${FRASE}
#   Wait Until Element Is Visible    Locator=${HEADER_ELETRONICOS}  timeout=0:00:30
  Wait Until Element Is Not Visible    Locator=${HEADER_ELETRONICOS} 

Verificar se o título da página fica "${TITULO}"
  Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
  Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
  Input Text    locator=twotabsearchtextbox   text=${NOME_PRODUTO}

Clicar no botão de pesquisa
  Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa, se esta listando o produto "${NOME_PRODUTO}"
  Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[2]

Acessar a tela para efetuar o login
  Click Element    locator=nav-link-accountList-nav-line-1

Digitar um e-mail inválido "${EMAIL_INVALIDO}"
  Wait Until Element Is Visible    locator=${INPUT_EMAIL_INVALIDO} 
  Input Text    locator=${INPUT_EMAIL_INVALIDO}   text=${EMAIL_INVALIDO}

Clicar no botão Continuar
  Click Button    locator=continue


O acesso não deverá ser permitido
  Wait Until Element Is Visible    locator=${HEADER_MENSAGEM_INVALIDA} 
  

# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
  Acessar a home page do site Amazon.com.br
  Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
  Entrar no menu "Eletrônicos"
  
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
  Verificar se aparece a frase "Eletrônicos e Tecnologia"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
  Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
  
E a categoria "Computadores e Informática" deve ser exibida na página
  Verificar se aparece a categoria "Computadores e Informática"

E a categoria "Tablets" deve ser exibida na página
  Verificar se aparece a categoria "Tablets"

 Quando pesquisar pelo produto "Xbox Series S"
   Digitar o nome de produto "Xbox Series S" no campo de pesquisa
   Clicar no botão de pesquisa

Então um produto da linha "Xbox Series S" deve ser mostrado na página
  Verificar o resultado da pesquisa, se esta listando o produto "Console Xbox Series S"
E o título da página deve ficar "Amazon.com.br : Xbox Series S"
  Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E acesso a tela de login
  Acessar a tela para efetuar o login
Quando digito um email invalido
  Digitar um e-mail inválido "keke@kenia.com"
  Clicar no botão Continuar
Então o cacesso não deverá ser permitido
  O acesso não deverá ser permitido











Before do
  @login_page = LoginPage.new
  @navbar = Navbar.new
  @tarefas_page = TarefasPage.new
end

Before('@autenticado') do 
  visit '/login'
  @login_page.logar('ilton.io@ninja.com.br', '123456')
  sleep 5
  #@tarefas_page.wait_for_painel
end

After('@logout') do
  @navbar.logout
end

After do |scenario|
  nome_cenario = scenario.name
  nome_cenario = nome_cenario
  screenshot = "log/screenshots/#{nome_cenario}.png"

  if scenario.failed?
     screenshot = "log/screenshots/failed/#{nome_cenario}.png"
  else
     screenshot = "log/screenshots/passed/#{nome_cenario}.png"
  end

  page.save_screenshot(screenshot) # => capybara tira o screenshot
  embed(screenshot, 'image/png', 'Evidência') # => cucumber atacha a evidencia no relatório
end

Dado('que eu tenho uma tarefa com os seguintes atributos:') do |table|
  @nova_tarefa = table.rows_hash
  DAO.new.remover_tarefas(@nova_tarefa[:nome])
end

Dado('eu quero taguear esta tarefa com:') do |tags|
  @tags = tags.hashes
end

Dado('eu já cadastrei esta tarefa e não tinha percebido') do
  steps %(
    Quando faço o cadastro dessa tarefa
  )
end

Quando('faço o cadastro dessa tarefa') do
  visit '/tasks'
  sleep 5
  @tarefas_page.botao_novo.click
  @tarefas_page.adicionar.cadastrar(@nova_tarefa, @tags)
end

Então('devo ver está tarefa com o status {string}') do |status_tarefa|
  tarefa = @tarefas_page.item(@nova_tarefa[:nome])
  expect(tarefa).to have_content status_tarefa
end

Então('devo ver somente {int} tarefa com o nome cadastrado') do |quantidade|
  visit '/tasks'
  @tarefas_page.busca(@nova_tarefa[:nome])
  expect(@tarefas_page.itens.size).to eql quantidade
end

Então('devo ver a mensagem {string} ao tentar cadastrar') do |mensagem|
  expect(@tarefas_page.adicionar.alerta.text).to eql mensagem
end

## remover

Dado('que tenho uma tarefa indesejada') do
  @nova_tarefa = { nome: 'Tarefa muito boa para ser removida', data: '26/06/2018' }
  @tags = [{ tag: 'remover' }]
  DAO.new.remover_tarefas(@nova_tarefa[:nome])

  steps %(
    Quando faço o cadastro dessa tarefa
  )
end

Quando('eu solicito a exclusão desta tarefa') do
  tarefa_para_remover = @tarefas_page.item(@nova_tarefa[:nome])
  tarefa_para_remover.find('#delete-button').click
  sleep 5
end

Quando('confirmo a ação de exclusão') do
  @tarefas_page.botao_confirmar.click
end

Então('esta tarefa não deve ser exibida na lista') do
    @tarefas_page.busca(@nova_tarefa[:nome])
    expect(@tarefas_page.tarefa_nao_cadastrada).to have_content "nenhuma tarefa cadastrada :|"
end

Quando('eu cancelo esta ação') do
  @tarefas_page.botao_deixa_queto.click
end

Então('esta tarefa permanece na lista') do
  @tarefas_page.busca(@nova_tarefa[:nome])
  tarefa = @tarefas_page.item(@nova_tarefa[:nome])
  expect(tarefa).to have_content @nova_tarefa[:nome]
end

## Manter tarefas (Editar / Finalizar)

Dado("que tenho uma tarefa cadastrada") do
  @nova_tarefa = { nome: 'Terfa para atualização', data: '28/06/2018' }
  @tags = [{ tag: 'Automação Ruby' }]
  steps %(
    Quando faço o cadastro dessa tarefa
  )
end

Quando("eu edito a tarefa e confirmo") do
  @nova_tarefa = { nome: 'Terfa para atualizada', data: '29/07/2018' }
  @tags = [{ tag: 'Automação Ruby - v2' }]
end

Então("os dados da tarefa devem atualizados") do
  @tarefas_page.busca(@nova_tarefa[:nome])
  expect(@tarefas_page.tarefa_nao_cadastrada).to have_content "nenhuma tarefa cadastrada :|"
end

Quando("eu edito a tarefa e seleciono a opção Finalizado e confirmo") do
  @tarefas_page.finalizar_tarefa_edicao.click
  @nova_tarefa = { nome: 'Terfa para atualização - Fanalizada', data: '28/06/2018' }
  @tags = [{ tag: 'Automação Ruby' }]
end

Então("os dados da tarefa devem atualizados e o status deve ser {string}") do |status_tarefa|
  tarefa = @tarefas_page.item(@nova_tarefa[:nome])
  expect(tarefa).to have_content status_tarefa
  expect(tarefa).to have_content @nova_tarefa[:nome]
end

Dado("que tenho uma tarefa com status {string}") do |status_tarefa|
  tarefa = @tarefas_page.item(@nova_tarefa[:nome])
  expect(tarefa).to have_content status_tarefa
end

Quando("eu edito a tarefa e removo a seleção finalizado e confirmo") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("eu finalizo a tarefa") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("o status da tarefa deve ser {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
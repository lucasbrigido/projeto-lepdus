<?php return array (
  'plugins.importexport.crossref.displayName' => 'Exportação CrossRef em XML',
  'plugins.importexport.crossref.description' => 'Exporta metadados dos artigos no formato CrossRef XML.',
  'plugins.importexport.crossref.requirements' => 'Requisitos',
  'plugins.importexport.crossref.requirements.satisfied' => 'Todos os requisitos do plugin estão atendidos.',
  'plugins.importexport.crossref.error.publisherNotConfigured' => 'A instituição editora da revista não foi configurado! Você deve adicionar uma instituição editora na <a href="{$journalSettingsUrl}" target="_blank"> Página de Configurações da Revista</a>.',
  'plugins.importexport.crossref.error.issnNotConfigured' => 'O ISSN da revista não foi configurado! Você deve adicionar um ISSN na <a href="{$journalSettingsUrl}" target="_blank"> Página de Configurações do Revista</a>.',
  'plugins.importexport.crossref.error.noDOIContentObjects' => 'Os artigos não foram selecionados para a atribuição de DOI no plugin de identificador público do DOI, portanto não há possibilidade de depósito ou exportação neste plugin.',
  'plugins.importexport.crossref.settings.depositorIntro' => 'Os seguintes items são exigidos para um depósito bem sucedido na Crossref.',
  'plugins.importexport.crossref.settings.form.depositorName' => 'Nome do depositante',
  'plugins.importexport.crossref.settings.form.depositorEmail' => 'Email do depositante',
  'plugins.importexport.crossref.settings.form.depositorNameRequired' => 'Por favor digite o nome do depositante.',
  'plugins.importexport.crossref.settings.form.depositorEmailRequired' => 'Por favor digite o email do depositante.',
  'plugins.importexport.crossref.registrationIntro' => 'Se você quiser usar este plugin para registrar Digital Object Identifiers (DOIs) diretamente com o CrossRef, você precisará de um nome de usuário e senha (disponível em <a href="http://www.crossref.org" target="_blank"> CrossRef </a>). Se você não tiver seu próprio nome de usuário e senha, ainda poderá exportar para o formato CrossRef XML, mas não poderá registrar os nomes DOI com a CrossRef a partir do OJS.',
  'plugins.importexport.crossref.settings.form.username' => 'Nome de usuário',
  'plugins.importexport.crossref.settings.form.usernameRequired' => 'Por favor, informe o nome de usuário que você revcebeu da CrossRef.',
  'plugins.importexport.crossref.settings.form.automaticRegistration.description' => 'O OJS depositará automaticamente os metadados dos DOIs atribuídos na CrossRef. Observe que isso pode levar um curto período de tempo após a publicação do processo. Você pode verificar todas os DOIs não registrados.',
  'plugins.importexport.crossref.settings.form.testMode.description' => 'Use a API de teste CrossRef (ambiente de teste) para o depósito DOI. Não se esqueça de remover esta opção para a produção.',
  'plugins.importexport.crossref.issues.description' => 'Nota: Somente as edições (e não seus artigos) serão considerados para exportação/registro aqui.',
  'plugins.importexport.crossref.status.submitted' => 'Enviado',
  'plugins.importexport.crossref.status.completed' => 'Depositado',
  'plugins.importexport.crossref.status.failed' => 'Falhou',
  'plugins.importexport.crossref.status.registered' => 'Ativo',
  'plugins.importexport.crossref.status.markedRegistered' => 'Marcar como Ativo',
  'plugins.importexport.crossref.statusLegend' => '<p> Estado do depósito: </p>
		<p>
		- Não depositado: nenhuma tentativa de depósito foi feita para este DOI. <br/>
		- Enviado: este DOI foi enviado para o depósito. <br />
		- Depositado: o DOI foi depositado em Crossref, mas pode não estar ativo ainda. <br />
		- Ativo: o DOI foi depositado e está resolvendo corretamente. <br />
		- Falha: o depósito DOI falhou. <br />
		- Marcado ativo: o DOI foi marcado manualmente como ativo.
		</p>
		<p> Apenas o status da última tentativa de depósito é exibido.</p>
		<p> Se um depósito falhou, resolva o problema e tente registrar novamente o DOI.</p>',
  'plugins.importexport.crossref.action.export' => 'Download XML',
  'plugins.importexport.crossref.action.markRegistered' => 'Marcar como Ativo',
  'plugins.importexport.crossref.action.register' => 'Enviar',
  'plugins.importexport.crossref.action.checkStatus' => 'Verificar Status',
  'plugins.importexport.crossref.senderTask.name' => 'Dados CrossRef do remetente',
  'plugins.importexport.crossref.notification.failed' => 'Um DOI não conseguiu ser registrado. Por favor, vá para Ferramentas> Importar / Exportar> CrossRef XML Export Plugin para ver os depósitos com falha.',
  'plugins.importexport.crossref.cliUsage' => 'Uso:
{$scriptName} {$pluginName} export [xmlFileName] [journal_path] articles objectId1 [objectId2] ...
{$scriptName} {$pluginName} register [journal_path] articles objectId1 [objectId2] ...',
  'plugins.importexport.crossref.register.error.mdsError' => 'O envio não foi bem sucedido! O servidor de registro DOI retornou um erro: \'{$param}\'.',
  'plugins.importexport.crossref.register.success' => 'Enviado com sucesso!',
  'plugins.importexport.crossref.export.error.issueNotFound' => 'Nenhuma edição correspondeu ao ID de edição especificado "{$issueId}".',
  'plugins.importexport.crossref.export.error.articleNotFound' => 'Nenhum artigo correspondeu ao ID do artigo especificado "{$articleId}".',
); ?>
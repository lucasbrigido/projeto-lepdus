<?php return array (
  'plugins.importexport.medra.displayName' => 'Plugin de Exportação/Registro mEDRA',
  'plugins.importexport.medra.description' => 'Exporta metadados de edições, artigos e composições finais no formato Onix para DOI (O4DOI) e registra DOIs na agência de registro mEDRA.',
  'plugins.importexport.medra.intro' => 'Caso deseje registrar DOIs no mEDRA, siga as instruções na <a href="http://www.medra.org/en/guide.htm" target="_blank">página do mEDRA</a> para receber seu login e senha. Mesmo que não possua dados próprios de login e senha, ainda assim será possível exportar os dados para o formato mEDRA XML (Onix para DOI), porém não poderá registrar seus DOIs no mEDRA por meio do OJS. Note que a senha será salva como texto puro, isto é, não encriptada, devido aos requisitos do serviço de registro mEDRA.',
  'plugins.importexport.medra.settings.form.description' => 'Configure o plugin de exportação mEDRA:',
  'plugins.importexport.medra.settings.form.username' => 'Login',
  'plugins.importexport.medra.settings.form.usernameRequired' => 'Informe seu login mEDRA. O login não pode conter dois pontos (:)',
  'plugins.importexport.medra.settings.form.registrantName' => 'Instituição registerada no mEDRA',
  'plugins.importexport.medra.settings.form.registrantNameRequired' => 'Informe o nome da instituição registrada no mEDRA.',
  'plugins.importexport.medra.settings.form.fromFields' => 'Quem o mEDRA contactará em caso de dúvidas técnicas:',
  'plugins.importexport.medra.settings.form.fromCompany' => 'Instituição',
  'plugins.importexport.medra.settings.form.fromCompanyRequired' => 'Informe o nome do técnico responsável pela exportação DOI (instituição de hospedagem, por exemplo).',
  'plugins.importexport.medra.settings.form.fromName' => 'Contato técnico',
  'plugins.importexport.medra.settings.form.fromNameRequired' => 'Informe o nome do técnico responsável.',
  'plugins.importexport.medra.settings.form.fromEmail' => 'E-mail',
  'plugins.importexport.medra.settings.form.fromEmailRequired' => 'Informe um endereço de e-mail válido.',
  'plugins.importexport.medra.settings.form.publicationCountry' => 'Escolha o país a ser informado como \'país de publicação\' para o mEDRA.',
  'plugins.importexport.medra.settings.form.exportIssuesAs' => 'Escolha se deseja exportar edições como <a href="http://www.medra.org/en/metadata_td.htm" target="_blank">\'trabalhos\' ou \'manifestações\'</a>.',
  'plugins.importexport.medra.settings.form.work' => 'trabalho',
  'plugins.importexport.medra.settings.form.manifestation' => 'manifestação',
  'plugins.importexport.medra.workOrProduct' => 'NB: DOIs designados a artigos serão exportados para o mEDRA como <a href="http://www.medra.org/en/metadata_td.htm" target="_blank">\'trabalhos\'</a>. DOIs designados a composições publicadas serão exportadas como <a href="http://www.medra.org/en/metadata_td.htm" target="_blank">\'manifestações\'</a>.',
  'plugins.importexport.medra.cliUsage' => 'Uso:
{$scriptName} {$pluginName} export [xmlFileName] [journal_path] {issues|articles|galleys} objectId1 [objectId2] ...
{$scriptName} {$pluginName} register [journal_path] {issues|articles|galleys} objectId1 [objectId2] ...',
  'plugins.importexport.medra.settings.form.exportIssuesAs.label' => 'Exportar edições como',
  'plugins.importexport.medra.settings.form.automaticRegistration.description' => 'OJS depositará DOIs automaticamente no mEDRA. Por favor note que isso pode levar um tempo depois da publicação. Você pode verificar os DOIs não registrados.',
); ?>
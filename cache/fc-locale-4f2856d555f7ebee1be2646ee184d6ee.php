<?php return array (
  'plugins.importexport.users.displayName' => 'Plugin Usuários em XML',
  'plugins.importexport.users.description' => 'Importar e exportar usuários no formato XML',
  'plugins.importexport.users.cliUsage' => 'Uso: {$scriptName} {$pluginName} [comando] ...
Comandos:
	import [xmlFileName] [journal_path]
	export [xmlFileName] [journal_path]
	export [xmlFileName] [journal_path] [userId1] [userId2] ...',
  'plugins.importexport.users.import.importUsers' => 'Importar Cadastros',
  'plugins.importexport.users.import.instructions' => 'Escolha um documento XML contendo as informações de cadastro para importação nesta revista. Veja a ajuda do sistema para detalhes sobre o formato do documento.<br /><br />Caso o documento possua logins ou e-mails já cadastrados no sistema, os dados cadastrais não serão importados e quaisquer funções adicionais serão designadas aos cadastros existentes.',
  'plugins.importexport.users.import.failedToImportUser' => 'Falha na importação de cadastro',
  'plugins.importexport.users.import.failedToImportRole' => 'Falha ao designar função ao cadastro',
  'plugins.importexport.users.import.dataFile' => 'Arquivo de dados do Usuário',
  'plugins.importexport.users.import.sendNotify' => 'Enviar notificação via e-mail para cada cadastro importado, com login e senha do usuário.',
  'plugins.importexport.users.import.continueOnError' => 'Continuar a importação de outros cadastros caso ocorra uma falha.',
  'plugins.importexport.users.import.noFileError' => 'Nenhum arquivo enviado!',
  'plugins.importexport.users.import.usersWereImported' => 'Os seguintes cadastros foram importados com sucesso para o sistema',
  'plugins.importexport.users.import.errorsOccurred' => 'Erros ocorridos durante a importação',
  'plugins.importexport.users.import.confirmUsers' => 'Deseja importar os usuários listados para o sistema',
  'plugins.importexport.users.unknownPress' => 'Caminho de revista inválido: "{$pressPath}"',
  'plugins.importexport.users.export.exportUsers' => 'Exportar Cadastros',
  'plugins.importexport.users.export.exportByRole' => 'Exportar Por Função',
  'plugins.importexport.users.export.exportAllUsers' => 'Exportar Todos',
  'plugins.importexport.users.export.errorsOccurred' => 'Error ocorridos durante a exportação',
  'plugins.importexport.users.export.couldNotWriteFile' => 'Não foi possível escrever para o arquivo  "{$fileName}".',
  'plugins.importexport.users.import.warning' => 'Aviso',
  'plugins.importexport.users.import.encryptionMismatch' => 'Não é possível criptografados com {$importHash}; o sisema está configurado para utilizar {$ompHash}. Caso continue, será necessário recriar todas as senhas de usuários importados.',
  'plugins.importexport.users.results' => 'Resultados',
  'plugins.importexport.users.importComplete' => 'A importação foi concluída com êxito. Usuários com nomes de usuários e endereços de e-mail que ainda não estão em uso foram importados, juntamente com os grupos de usuários que os acompanham.',
  'plugins.importexport.users.cliUsage.examples' => 'Importar Cadastros',
); ?>
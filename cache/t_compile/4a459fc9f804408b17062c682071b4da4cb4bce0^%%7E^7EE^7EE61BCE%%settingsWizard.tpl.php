<?php /* Smarty version 2.6.25-dev, created on 2018-10-24 06:13:24
         compiled from controllers/wizard/settings/settingsWizard.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'controllers/wizard/settings/settingsWizard.tpl', 18, false),array('function', 'url', 'controllers/wizard/settings/settingsWizard.tpl', 27, false),array('modifier', 'json_encode', 'controllers/wizard/settings/settingsWizard.tpl', 18, false),)), $this); ?>
<?php $this->assign('pageTitle', "manager.settings.wizard"); ?>

<script type="text/javascript">
	// Attach the JS file tab handler.
	$(function() {
		$('#settingsWizard').pkpHandler(
				'$.pkp.controllers.wizard.WizardHandler',
			{
				cancelButtonText: <?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this))) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp));?>
,
				continueButtonText: <?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.continue"), $this))) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp));?>
,
				finishButtonText: <?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.finish"), $this))) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp));?>
,
				enforceLinear: false
			});
	});
</script>
<div id="settingsWizard">
	<ul>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.JournalSettingsTabHandler",'op' => 'showTab','tab' => 'masthead','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.masthead"), $this);?>
</a></li>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.JournalSettingsTabHandler",'op' => 'showTab','tab' => 'contact','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.contact"), $this);?>
</a></li>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.WebsiteSettingsTabHandler",'op' => 'showTab','tab' => 'appearance','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.website.appearance"), $this);?>
</a></li>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.PublicationSettingsTabHandler",'op' => 'showTab','tab' => 'submissionStage','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.publication.submissionStage"), $this);?>
</a></li>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.DistributionSettingsTabHandler",'op' => 'showTab','tab' => 'indexing','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.distribution.indexing"), $this);?>
</a></li>
		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.AccessSettingsTabHandler",'op' => 'showTab','tab' => 'users','wizardMode' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.users"), $this);?>
</a></li>
	</ul>
</div>
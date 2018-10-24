<?php /* Smarty version 2.6.25-dev, created on 2018-10-22 08:30:22
         compiled from controllers/tab/settings/archiving/form/archivingForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'help', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 13, false),array('function', 'url', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 26, false),array('function', 'csrf', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 27, false),array('function', 'translate', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 36, false),array('function', 'fbvElement', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 40, false),array('function', 'load_url_in_div', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 54, false),array('function', 'fbvFormButtons', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 100, false),array('modifier', 'json_encode', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 20, false),array('modifier', 'escape', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 30, false),array('modifier', 'assign', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 39, false),array('block', 'fbvFormArea', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 34, false),array('block', 'fbvFormSection', 'controllers/tab/settings/archiving/form/archivingForm.tpl', 38, false),)), $this); ?>

<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "settings.md",'section' => 'website','class' => 'pkp_help_tab'), $this);?>


<script type="text/javascript">
	$(function() {
		// Attach the form handler.
		$('#archivingForm').pkpHandler('$.pkp.controllers.tab.settings.archiving.form.ArchivingSettingsFormHandler',
			{
				baseUrl: <?php echo ((is_array($_tmp=$this->_tpl_vars['baseUrl'])) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp)); ?>

			}
		);
	});
</script>

<form id="archivingForm" class="pkp_form" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.settings.WebsiteSettingsTabHandler",'op' => 'saveFormData','tab' => 'archiving'), $this);?>
">
	<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>

	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/notification/inPlaceNotification.tpl", 'smarty_include_vars' => array('notificationId' => 'archivingFormNotification')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

	<input type="hidden" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['isPLNPluginInstalled'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" id="isPLNPluginInstalled" name="isPLNPluginInstalled" />
	<input type="hidden" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['isPLNPluginEnabled'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" id="isPLNPluginEnabled" name="isPLNPluginEnabled" />

	<?php if ($this->_tpl_vars['isPLNPluginInstalled']): ?>
		<?php $this->_tag_stack[] = array('fbvFormArea', array('id' => 'mainLockss')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php $this->_tag_stack[] = array('fbvFormArea', array('title' => "manager.setup.plnPluginArchiving",'id' => 'plnArea')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.plnDescription"), $this);?>
             

				<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => 'true','translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.plnPluginEnable"), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'enablePLNArchivingLabel') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'enablePLNArchivingLabel'));?>

					<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => 'enablePln','value' => '1','checked' => $this->_tpl_vars['isPLNPluginEnabled'],'label' => $this->_tpl_vars['enablePLNArchivingLabel'],'translate' => false), $this);?>

				<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php if ($this->_tpl_vars['isPLNPluginEnabled']): ?>
				<?php $this->_tag_stack[] = array('fbvFormSection', array('translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.plnSettingsDescription"), $this);?>


					<div id="pln-settings-action" class="pkp_linkActions">
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "linkAction/linkAction.tpl", 'smarty_include_vars' => array('action' => $this->_tpl_vars['plnSettingsShowAction'],'contextId' => 'archivingForm')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
					</div>
				<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

				<?php $this->_tag_stack[] = array('fbvFormSection', array('translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('component' => "plugins.generic.pln.controllers.grid.PLNStatusGridHandler",'op' => 'fetchGrid','escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'depositsGridUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'depositsGridUrl'));?>

					<?php echo $this->_plugins['function']['load_url_in_div'][0][0]->smartyLoadUrlInDiv(array('id' => 'depositsGridContainer','url' => $this->_tpl_vars['depositsGridUrl']), $this);?>

				<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php endif; ?>
		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
		<p class="expand-others">
			<a id="toggleOthers" href="#"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.otherLockss"), $this);?>
</a>
		</p>
	<?php else: ?>
		<?php $this->_tag_stack[] = array('fbvFormArea', array('title' => "manager.setup.plnPluginArchiving",'id' => 'plnPluginArchivingArea')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.plnPluginNotInstalled"), $this);?>

		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
	<?php endif; ?>
	
	<?php $this->_tag_stack[] = array('fbvFormArea', array('id' => 'otherLockss')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php $this->_tag_stack[] = array('fbvFormArea', array('title' => "manager.setup.lockssTitle",'id' => 'lockss_description')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.lockssDescription"), $this);?>

			
			<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => 'true','translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
				<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'gateway','op' => 'lockss'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'lockssUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'lockssUrl'));?>

				<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.lockssEnable",'lockssUrl' => $this->_tpl_vars['lockssUrl']), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'enableLockssLabel') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'enableLockssLabel'));?>

				<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => 'enableLockss','value' => '1','checked' => $this->_tpl_vars['enableLockss'],'label' => $this->_tpl_vars['enableLockssLabel'],'translate' => false), $this);?>

			<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

		<?php $this->_tag_stack[] = array('fbvFormArea', array('title' => "manager.setup.clockssTitle",'id' => 'clockss_description')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.clockssDescription"), $this);?>

			
			<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => 'true','translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
				<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'gateway','op' => 'clockss'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'clockssUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'clockssUrl'));?>

				<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.clockssEnable",'clockssUrl' => $this->_tpl_vars['clockssUrl']), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'enableClockssLabel') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'enableClockssLabel'));?>

				<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => 'enableClockss','value' => '1','checked' => $this->_tpl_vars['enableClockss'],'label' => $this->_tpl_vars['enableClockssLabel'],'translate' => false), $this);?>

			<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

		<?php if ($this->_tpl_vars['isPorticoPluginInstalled']): ?>
			<?php $this->_tag_stack[] = array('fbvFormArea', array('title' => "manager.setup.porticoTitle",'id' => 'portico_description')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.porticoDescription"), $this);?>


				<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => 'true','translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.setup.porticoEnable"), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'enablePorticoLabel') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'enablePorticoLabel'));?>

					<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => 'enablePortico','value' => '1','checked' => $this->_tpl_vars['enablePortico'],'label' => $this->_tpl_vars['enablePorticoLabel'],'translate' => false), $this);?>

				<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
		<?php endif; ?>
	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

	<?php echo $this->_plugins['function']['fbvFormButtons'][0][0]->smartyFBVFormButtons(array('id' => 'archivingFormSubmit','submitText' => "common.save",'hideCancel' => true), $this);?>

</form>
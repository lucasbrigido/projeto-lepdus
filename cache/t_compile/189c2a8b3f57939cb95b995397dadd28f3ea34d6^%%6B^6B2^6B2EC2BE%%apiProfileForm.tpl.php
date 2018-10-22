<?php /* Smarty version 2.6.25-dev, created on 2018-10-20 06:37:45
         compiled from user/apiProfileForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'help', 'user/apiProfileForm.tpl', 12, false),array('function', 'url', 'user/apiProfileForm.tpl', 21, false),array('function', 'csrf', 'user/apiProfileForm.tpl', 22, false),array('function', 'fbvElement', 'user/apiProfileForm.tpl', 27, false),array('function', 'translate', 'user/apiProfileForm.tpl', 30, false),array('function', 'fbvFormButtons', 'user/apiProfileForm.tpl', 37, false),array('block', 'fbvFormSection', 'user/apiProfileForm.tpl', 26, false),array('modifier', 'compare', 'user/apiProfileForm.tpl', 27, false),array('modifier', 'translate', 'user/apiProfileForm.tpl', 33, false),)), $this); ?>

<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "user-profile.md",'class' => 'pkp_help_tab'), $this);?>


<script type="text/javascript">
	$(function() {
		// Attach the form handler.
		$('#apiProfileForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	});
</script>

<form class="pkp_form" id="apiProfileForm" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveAPIProfile'), $this);?>
" enctype="multipart/form-data">
	<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>


	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/notification/inPlaceNotification.tpl", 'smarty_include_vars' => array('notificationId' => 'apiProfileNotification')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

	<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => true)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('id' => 'apiKeyEnabled','type' => 'checkbox','label' => "user.apiKeyEnabled",'checked' => ((is_array($_tmp=$this->_tpl_vars['apiKeyEnabled'])) ? $this->_run_mod_handler('compare', true, $_tmp, true, true, false) : $this->_plugins['modifier']['compare'][0][0]->smartyCompare($_tmp, true, true, false)),'value' => 1), $this);?>

		<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('id' => 'generateApiKey','type' => 'checkbox','label' => "user.apiKey.generate",'value' => 1), $this);?>

	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.apiKey.generateWarning"), $this);?>
</p>

	<?php $this->_tag_stack[] = array('fbvFormSection', array()); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php if (! $this->_tpl_vars['apiKey']): ?><?php $this->assign('apiKey', ((is_array($_tmp="common.none")) ? $this->_run_mod_handler('translate', true, $_tmp) : AppLocale::translate($_tmp))); ?><?php endif; ?>
		<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('id' => 'apiKey','type' => 'text','label' => "user.apiKey",'readonly' => 'true','value' => $this->_tpl_vars['apiKey'],'size' => $this->_tpl_vars['fbvStyles']['size']['MEDIUM']), $this);?>

	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

	<?php echo $this->_plugins['function']['fbvFormButtons'][0][0]->smartyFBVFormButtons(array('hideCancel' => true,'submitText' => "common.save"), $this);?>


	<p>
		<?php ob_start(); ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'about','op' => 'privacy'), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('privacyUrl', ob_get_contents());ob_end_clean(); ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.privacyLink",'privacyUrl' => $this->_tpl_vars['privacyUrl']), $this);?>

	</p>
</form>
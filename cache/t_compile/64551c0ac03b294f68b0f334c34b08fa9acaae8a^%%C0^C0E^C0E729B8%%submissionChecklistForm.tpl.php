<?php /* Smarty version 2.6.25-dev, created on 2018-10-22 08:21:35
         compiled from controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 18, false),array('function', 'csrf', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 19, false),array('function', 'fbvElement', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 26, false),array('function', 'fbvFormButtons', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 38, false),array('block', 'fbvFormArea', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 24, false),array('block', 'fbvFormSection', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 25, false),array('modifier', 'escape', 'controllers/grid/settings/submissionChecklist/form/submissionChecklistForm.tpl', 30, false),)), $this); ?>

<script type="text/javascript">
	$(function() {
		// Attach the form handler.
		$('#editSubmissionChecklistForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	});
</script>

<form class="pkp_form" id="editSubmissionChecklistForm" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "grid.settings.submissionChecklist.SubmissionChecklistGridHandler",'op' => 'updateItem'), $this);?>
">
<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>


<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/notification/inPlaceNotification.tpl", 'smarty_include_vars' => array('notificationId' => 'submissionChecklistFormNotification')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>


<?php $this->_tag_stack[] = array('fbvFormArea', array('id' => 'checklist')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
	<?php $this->_tag_stack[] = array('fbvFormSection', array('title' => "grid.submissionChecklist.column.checklistItem",'required' => 'true','for' => 'checklistItem')); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'textarea','multilingual' => 'true','name' => 'checklistItem','id' => 'checklistItem','value' => $this->_tpl_vars['checklistItem'],'required' => 'true'), $this);?>

	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
<?php if ($this->_tpl_vars['gridId'] != null): ?>
	<input type="hidden" name="gridId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['gridId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
<?php endif; ?>
<?php if ($this->_tpl_vars['rowId'] != null): ?>
	<input type="hidden" name="rowId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['rowId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
<?php endif; ?>
<?php if ($this->_tpl_vars['submissionChecklistId'] != null): ?>
	<input type="hidden" name="submissionChecklistId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['submissionChecklistId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
<?php endif; ?>
<?php echo $this->_plugins['function']['fbvFormButtons'][0][0]->smartyFBVFormButtons(array('submitText' => "common.save"), $this);?>

</form>
<?php /* Smarty version 2.6.25-dev, created on 2018-10-22 08:27:14
         compiled from controllers/grid/settings/user/userGridFilter.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'concat', 'controllers/grid/settings/user/userGridFilter.tpl', 19, false),array('modifier', 'escape', 'controllers/grid/settings/user/userGridFilter.tpl', 32, false),array('function', 'url', 'controllers/grid/settings/user/userGridFilter.tpl', 29, false),array('function', 'csrf', 'controllers/grid/settings/user/userGridFilter.tpl', 30, false),array('function', 'fbvElement', 'controllers/grid/settings/user/userGridFilter.tpl', 36, false),array('function', 'fbvFormButtons', 'controllers/grid/settings/user/userGridFilter.tpl', 44, false),array('block', 'fbvFormArea', 'controllers/grid/settings/user/userGridFilter.tpl', 34, false),array('block', 'fbvFormSection', 'controllers/grid/settings/user/userGridFilter.tpl', 35, false),)), $this); ?>
<?php $this->assign('filterId', 'userSearchForm'); ?>
<?php if ($this->_tpl_vars['filterData']['oldUserId']): ?>
	<?php $this->assign('filterId', ((is_array($_tmp=$this->_tpl_vars['filterId'])) ? $this->_run_mod_handler('concat', true, $_tmp, "-userMerge") : $this->_plugins['modifier']['concat'][0][0]->smartyConcat($_tmp, "-userMerge"))); ?>
<?php endif; ?>
<script type="text/javascript">
	// Attach the form handler to the form.
	$('#<?php echo $this->_tpl_vars['filterId']; ?>
').pkpHandler('$.pkp.controllers.form.ClientFormHandler',
		{
			trackFormChanges: false
		}
	);
</script>
<form class="pkp_form filter" id="<?php echo $this->_tpl_vars['filterId']; ?>
" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "grid.settings.user.UserGridHandler",'op' => 'fetchGrid'), $this);?>
" method="post">
	<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>

	<?php if ($this->_tpl_vars['filterData']['oldUserId']): ?>
		<input type="hidden" name="oldUserId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['filterData']['oldUserId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
	<?php endif; ?>
	<?php $this->_tag_stack[] = array('fbvFormArea', array('id' => 'userSearchFormArea')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php $this->_tag_stack[] = array('fbvFormSection', array('title' => "common.search",'for' => 'search')); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'text','name' => 'search','id' => 'search','value' => $this->_tpl_vars['filterSelectionData']['search'],'size' => $this->_tpl_vars['fbvStyles']['size']['LARGE'],'inline' => 'true'), $this);?>

			<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'select','name' => 'userGroup','id' => 'userGroup','from' => $this->_tpl_vars['filterData']['userGroupOptions'],'selected' => $this->_tpl_vars['filterSelectionData']['userGroup'],'size' => $this->_tpl_vars['fbvStyles']['size']['SMALL'],'translate' => false,'inline' => 'true'), $this);?>

		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

		<?php $this->_tag_stack[] = array('fbvFormSection', array('list' => true)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
			<?php if ($this->_tpl_vars['filterSelectionData']['includeNoRole']): ?><?php $this->assign('checked', 'checked'); ?><?php endif; ?>
			<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','name' => 'includeNoRole','id' => 'includeNoRole','value' => '1','checked' => $this->_tpl_vars['checked'],'label' => "user.noRoles.selectUsersWithoutRoles",'translate' => 'true'), $this);?>

		<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
		<?php echo $this->_plugins['function']['fbvFormButtons'][0][0]->smartyFBVFormButtons(array('hideCancel' => true,'submitText' => "common.search"), $this);?>

	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</form>
<?php /* Smarty version 2.6.25-dev, created on 2018-10-20 06:37:38
         compiled from common/helpLink.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'common/helpLink.tpl', 17, false),array('function', 'translate', 'common/helpLink.tpl', 22, false),)), $this); ?>
<a href="#" class="requestHelpPanel pkp_help_link <?php echo ((is_array($_tmp=$this->_tpl_vars['helpClass'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" data-topic="<?php echo ((is_array($_tmp=$this->_tpl_vars['helpFile'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php if ($this->_tpl_vars['helpSection']): ?>#<?php echo ((is_array($_tmp=$this->_tpl_vars['helpSection'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php endif; ?>">
	<span class="fa fa-info-circle pkpIcon--inline" aria-hidden="true"></span>
	<?php if ($this->_tpl_vars['helpText']): ?>
		<?php echo ((is_array($_tmp=$this->_tpl_vars['text'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

	<?php else: ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['helpTextKey']), $this);?>

	<?php endif; ?>
</a>
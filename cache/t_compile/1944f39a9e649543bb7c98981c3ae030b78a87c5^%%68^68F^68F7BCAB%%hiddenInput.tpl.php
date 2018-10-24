<?php /* Smarty version 2.6.25-dev, created on 2018-10-24 06:12:49
         compiled from form/hiddenInput.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'form/hiddenInput.tpl', 11, false),)), $this); ?>
<input type="hidden"
	  id="<?php echo ((is_array($_tmp=$this->_tpl_vars['FBV_id'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"
	  name="<?php echo ((is_array($_tmp=$this->_tpl_vars['FBV_name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"
	  class="<?php echo $this->_tpl_vars['FBV_class']; ?>
<?php if ($this->_tpl_vars['FBV_validation']): ?> <?php echo ((is_array($_tmp=$this->_tpl_vars['FBV_validation'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php endif; ?>"
	  value="<?php echo ((is_array($_tmp=$this->_tpl_vars['FBV_value'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"
	  <?php echo $this->_tpl_vars['FBV_hiddenInputParams']; ?>
 />
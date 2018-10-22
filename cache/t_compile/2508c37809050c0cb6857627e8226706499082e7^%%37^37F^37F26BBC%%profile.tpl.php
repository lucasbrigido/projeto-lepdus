<?php /* Smarty version 2.6.25-dev, created on 2018-10-20 06:36:47
         compiled from user/profile.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'user/profile.tpl', 11, false),array('function', 'translate', 'user/profile.tpl', 11, false),)), $this); ?>
<?php ob_start(); ?>
	<li><a name="notifications" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_COMPONENT,'component' => "tab.user.OJSProfileTabHandler",'op' => 'notifications'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.notifications"), $this);?>
</a></li>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('additionalProfileTabs', ob_get_contents());ob_end_clean(); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "core:user/profile.tpl", 'smarty_include_vars' => array('additionalProfileTabs' => $this->_tpl_vars['additionalProfileTabs'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
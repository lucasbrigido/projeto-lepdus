<?php /* Smarty version 2.6.25-dev, created on 2018-10-24 06:10:50
         compiled from common/header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'common/header.tpl', 13, false),array('function', 'url', 'common/header.tpl', 15, false),)), $this); ?>
<?php ob_start(); ?>
	<?php if (array_intersect ( array ( ROLE_ID_MANAGER ) , ( array ) $this->_tpl_vars['userRoles'] )): ?>
		<li aria-haspopup="true" aria-expanded="false">
			<a name="issues" href="#"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.navigation.issues"), $this);?>
</a>
			<ul>
				<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'manageIssues','anchor' => 'futureIssues'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.issues.futureIssues"), $this);?>
</a></li>
				<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'manageIssues','anchor' => 'backIssues'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.issues.backIssues"), $this);?>
</a></li>
			</ul>
		</li>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['currentJournal'] && $this->_tpl_vars['currentJournal']->getSetting('paymentsEnabled') && array_intersect ( array ( ROLE_ID_SITE_ADMIN , ROLE_ID_MANAGER , ROLE_ID_SUBSCRIPTION_MANAGER ) , ( array ) $this->_tpl_vars['userRoles'] )): ?>
		<li aria-haspopup="true" aria-expanded="false">
			<a name="payments" href="#"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.payments"), $this);?>
</a>
			<ul>
				<li><a name="individualSubscription" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'individualSubscription'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "subscriptionManager.individualSubscriptions"), $this);?>
</a></li>
				<li><a name="institutionalSubscriptions" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'institutionalSubscriptions'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "subscriptionManager.institutionalSubscriptions"), $this);?>
</a></li>
				<li><a name="subscriptionTypes" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'subscriptionTypes'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "subscriptionManager.subscriptionTypes"), $this);?>
</a></li>
				<li><a name="subscriptionPolicies" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'subscriptionPolicies'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.subscriptionPolicies"), $this);?>
</a></li>
				<li><a name="paymentTypes" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'paymentTypes'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.paymentTypes"), $this);?>
</a></li>
				<li><a name="payments" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'payments','anchor' => 'payments'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.payments"), $this);?>
</a></li>
			</ul>
		</li>
	<?php endif; ?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('appSpecificMenuItems', ob_get_contents());ob_end_clean(); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "core:common/header.tpl", 'smarty_include_vars' => array('appSpecificMenuItems' => $this->_tpl_vars['appSpecificMenuItems'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
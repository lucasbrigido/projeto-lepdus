<?php /* Smarty version 2.6.25-dev, created on 2018-10-22 08:29:03
         compiled from dashboard/index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'dashboard/index.tpl', 20, false),array('function', 'help', 'dashboard/index.tpl', 28, false),array('modifier', 'uniqid', 'dashboard/index.tpl', 30, false),array('modifier', 'escape', 'dashboard/index.tpl', 30, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array('pageTitle' => "navigation.submissions")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<script type="text/javascript">
	// Attach the JS file tab handler.
	$(function() {
		$('#dashboardTabs').pkpHandler('$.pkp.controllers.TabHandler');
	});
</script>
<div id="dashboardTabs" class="pkp_controllers_tab">
	<ul>
		<li><a name="myQueue" href="#myQueue"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "dashboard.myQueue"), $this);?>
</a></li>
		<?php if (array_intersect ( array ( ROLE_ID_SITE_ADMIN , ROLE_ID_MANAGER ) , ( array ) $this->_tpl_vars['userRoles'] )): ?>
			<li><a name="unassigned" href="#unassigned"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.queue.long.submissionsUnassigned"), $this);?>
</a></li>
			<li><a name="active" href="#active"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.queue.long.active"), $this);?>
</a></li>
		<?php endif; ?>
		<li><a name="archives" href="#archived"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.archives"), $this);?>
</a></li>
	</ul>
	<div id="myQueue">
		<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "submissions.md",'class' => 'pkp_help_tab'), $this);?>

		<div class="pkp_content_panel">
			<?php $this->assign('uuid', ((is_array($_tmp=((is_array($_tmp="")) ? $this->_run_mod_handler('uniqid', true, $_tmp) : uniqid($_tmp)))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))); ?>
			<div id="my-submission-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
">
				<script type="text/javascript">
					pkp.registry.init('my-submission-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
', 'SubmissionsListPanel', <?php echo $this->_tpl_vars['myQueueListData']; ?>
);
				</script>
			</div>
		</div>
	</div>
	<?php if (array_intersect ( array ( ROLE_ID_SITE_ADMIN , ROLE_ID_MANAGER ) , ( array ) $this->_tpl_vars['userRoles'] )): ?>
		<div id="unassigned">
			<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "submissions.md",'section' => 'unassigned','class' => 'pkp_help_tab'), $this);?>

			<div class="pkp_content_panel">
				<?php $this->assign('uuid', ((is_array($_tmp=((is_array($_tmp="")) ? $this->_run_mod_handler('uniqid', true, $_tmp) : uniqid($_tmp)))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))); ?>
				<div id="unassigned-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
">
					<script type="text/javascript">
						pkp.registry.init('unassigned-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
', 'SubmissionsListPanel', <?php echo $this->_tpl_vars['unassignedListData']; ?>
);
					</script>
				</div>
			</div>
		</div>
		<div id="active">
			<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "submissions.md",'section' => 'active','class' => 'pkp_help_tab'), $this);?>

			<div class="pkp_content_panel">
				<?php $this->assign('uuid', ((is_array($_tmp=((is_array($_tmp="")) ? $this->_run_mod_handler('uniqid', true, $_tmp) : uniqid($_tmp)))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))); ?>
				<div id="active-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
">
					<script type="text/javascript">
						pkp.registry.init('active-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
', 'SubmissionsListPanel', <?php echo $this->_tpl_vars['activeListData']; ?>
);
					</script>
				</div>
			</div>
		</div>
	<?php endif; ?>
	<div id="archived">
		<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "submissions.md",'section' => 'archives','class' => 'pkp_help_tab'), $this);?>

		<div class="pkp_content_panel">
			<?php $this->assign('uuid', ((is_array($_tmp=((is_array($_tmp="")) ? $this->_run_mod_handler('uniqid', true, $_tmp) : uniqid($_tmp)))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))); ?>
			<div id="archived-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
">
				<script type="text/javascript">
					pkp.registry.init('archived-list-handler-<?php echo $this->_tpl_vars['uuid']; ?>
', 'SubmissionsListPanel', <?php echo $this->_tpl_vars['archivedListData']; ?>
);
				</script>
			</div>
		</div>
	</div>
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
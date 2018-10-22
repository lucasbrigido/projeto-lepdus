<?php /* Smarty version 2.6.25-dev, created on 2018-10-20 06:37:40
         compiled from core:user/notificationSettingsForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'help', 'core:user/notificationSettingsForm.tpl', 12, false),array('function', 'translate', 'core:user/notificationSettingsForm.tpl', 29, false),array('function', 'url', 'core:user/notificationSettingsForm.tpl', 31, false),array('function', 'csrf', 'core:user/notificationSettingsForm.tpl', 32, false),array('function', 'fbvElement', 'core:user/notificationSettingsForm.tpl', 55, false),array('function', 'fbvFormButtons', 'core:user/notificationSettingsForm.tpl', 61, false),array('modifier', 'json_encode', 'core:user/notificationSettingsForm.tpl', 21, false),array('modifier', 'translate', 'core:user/notificationSettingsForm.tpl', 42, false),array('modifier', 'assign', 'core:user/notificationSettingsForm.tpl', 42, false),array('modifier', 'in_array', 'core:user/notificationSettingsForm.tpl', 45, false),array('block', 'fbvFormArea', 'core:user/notificationSettingsForm.tpl', 36, false),array('block', 'fbvFormSection', 'core:user/notificationSettingsForm.tpl', 44, false),)), $this); ?>

<?php echo $this->_plugins['function']['help'][0][0]->smartyHelp(array('file' => "user-profile.md",'class' => 'pkp_help_tab'), $this);?>


<script type="text/javascript">
	$(function() {
		// Attach the form handler.
		$('#notificationSettingsForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler', {
			'enableDisablePairs': {
					<?php $_from = $this->_tpl_vars['notificationSettingCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['notificationSettingCategory']):
?>
						<?php $_from = $this->_tpl_vars['notificationSettingCategory']['settings']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['notifications'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['notifications']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['settingId']):
        $this->_foreach['notifications']['iteration']++;
?>
						<?php echo ((is_array($_tmp=$this->_tpl_vars['notificationSettings'][$this->_tpl_vars['settingId']]['settingName'])) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp)); ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['notificationSettings'][$this->_tpl_vars['settingId']]['emailSettingName'])) ? $this->_run_mod_handler('json_encode', true, $_tmp) : json_encode($_tmp)); ?>
,
						<?php endforeach; endif; unset($_from); ?>
					<?php endforeach; endif; unset($_from); ?>
				}
		});
	});
</script>

<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.settingsDescription"), $this);?>
</p>

<form class="pkp_form" id="notificationSettingsForm" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveNotificationSettings'), $this);?>
" enctype="multipart/form-data">
	<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>


	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/notification/inPlaceNotification.tpl", 'smarty_include_vars' => array('notificationId' => 'notificationSettingsFormNotification')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

	<?php $this->_tag_stack[] = array('fbvFormArea', array('id' => 'notificationSettings')); $_block_repeat=true;$this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
		<?php $_from = $this->_tpl_vars['notificationSettingCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['notificationSettingCategory']):
?>
			<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['notificationSettingCategory']['categoryKey']), $this);?>
</h4>
			<?php $_from = $this->_tpl_vars['notificationSettingCategory']['settings']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['settingId']):
?>
				<?php $this->assign('settingName', $this->_tpl_vars['notificationSettings'][$this->_tpl_vars['settingId']]['settingName']); ?>
				<?php $this->assign('emailSettingName', $this->_tpl_vars['notificationSettings'][$this->_tpl_vars['settingId']]['emailSettingName']); ?>
				<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['notificationSettings'][$this->_tpl_vars['settingId']]['settingKey'],'title' => ((is_array($_tmp="common.title")) ? $this->_run_mod_handler('translate', true, $_tmp) : AppLocale::translate($_tmp))), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'settingKey') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'settingKey'));?>


				<?php $this->_tag_stack[] = array('fbvFormSection', array('title' => $this->_tpl_vars['settingKey'],'list' => true,'translate' => false)); $_block_repeat=true;$this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<?php if (((is_array($_tmp=$this->_tpl_vars['settingId'])) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['blockedNotifications']) : in_array($_tmp, $this->_tpl_vars['blockedNotifications']))): ?>
						<?php $this->assign('checked', '0'); ?>
					<?php else: ?>
						<?php $this->assign('checked', '1'); ?>
					<?php endif; ?>
					<?php if (((is_array($_tmp=$this->_tpl_vars['settingId'])) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?>
						<?php $this->assign('emailChecked', '1'); ?>
					<?php else: ?>
						<?php $this->assign('emailChecked', '0'); ?>
					<?php endif; ?>
					<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => $this->_tpl_vars['settingName'],'checked' => $this->_tpl_vars['checked'],'label' => "notification.allow"), $this);?>

					<?php echo $this->_plugins['function']['fbvElement'][0][0]->smartyFBVElement(array('type' => 'checkbox','id' => $this->_tpl_vars['emailSettingName'],'checked' => $this->_tpl_vars['emailChecked'],'label' => "notification.email"), $this);?>

				<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormSection'][0][0]->smartyFBVFormSection($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php endforeach; endif; unset($_from); ?>
		<?php endforeach; endif; unset($_from); ?>
		<br />
		<?php echo $this->_plugins['function']['fbvFormButtons'][0][0]->smartyFBVFormButtons(array('hideCancel' => true,'submitText' => "common.save"), $this);?>

	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['fbvFormArea'][0][0]->smartyFBVFormArea($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

	<p>
		<?php ob_start(); ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'about','op' => 'privacy'), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('privacyUrl', ob_get_contents());ob_end_clean(); ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.privacyLink",'privacyUrl' => $this->_tpl_vars['privacyUrl']), $this);?>

	</p>

	<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>
</form>
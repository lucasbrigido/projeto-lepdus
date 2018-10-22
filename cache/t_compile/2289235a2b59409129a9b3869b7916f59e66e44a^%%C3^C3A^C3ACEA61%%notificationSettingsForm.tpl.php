<?php /* Smarty version 2.6.25-dev, created on 2018-10-20 06:37:40
         compiled from user/notificationSettingsForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'user/notificationSettingsForm.tpl', 22, false),array('modifier', 'escape', 'user/notificationSettingsForm.tpl', 27, false),)), $this); ?>
<?php ob_start(); ?>
		<?php if ($this->_tpl_vars['displayOpenAccessNotification']): ?>
		<?php $this->assign('notFirstJournal', 0); ?>
		<?php $_from = $this->_tpl_vars['journals']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['journalOpenAccessNotifications'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['journalOpenAccessNotifications']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['thisJournalId'] => $this->_tpl_vars['thisJournal']):
        $this->_foreach['journalOpenAccessNotifications']['iteration']++;
?>
			<?php $this->assign('thisJournalId', $this->_tpl_vars['thisJournal']->getId()); ?>
			<?php $this->assign('publishingMode', $this->_tpl_vars['thisJournal']->getSetting('publishingMode')); ?>
			<?php $this->assign('enableOpenAccessNotification', $this->_tpl_vars['thisJournal']->getSetting('enableOpenAccessNotification')); ?>
			<?php $this->assign('notificationEnabled', $this->_tpl_vars['user']->getSetting('openAccessNotification',$this->_tpl_vars['thisJournalId'])); ?>
			<?php if (! $this->_tpl_vars['notFirstJournal']): ?>
				<?php $this->assign('notFirstJournal', 1); ?>
				<tr>
					<td class="label"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.profile.form.openAccessNotifications"), $this);?>
</td>
					<td class="value">
			<?php endif; ?>

			<?php if ($this->_tpl_vars['publishingMode'] == @PUBLISHING_MODE_SUBSCRIPTION && $this->_tpl_vars['enableOpenAccessNotification']): ?>
				<input type="checkbox" name="openAccessNotify[]" <?php if ($this->_tpl_vars['notificationEnabled']): ?>checked="checked" <?php endif; ?>id="openAccessNotify-<?php echo ((is_array($_tmp=$this->_tpl_vars['thisJournalId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisJournalId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /> <label for="openAccessNotify-<?php echo ((is_array($_tmp=$this->_tpl_vars['thisJournalId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['thisJournal']->getLocalizedName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</label><br/>
			<?php endif; ?>

			<?php if (($this->_foreach['journalOpenAccessNotifications']['iteration'] == $this->_foreach['journalOpenAccessNotifications']['total'])): ?>
					</td>
				</tr>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
	<?php endif; ?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('additionalNotificationSettingsContent', ob_get_contents());ob_end_clean(); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "core:user/notificationSettingsForm.tpl", 'smarty_include_vars' => array('additionalNotificationSettingsContent' => $this->_tpl_vars['additionalNotificationSettingsContent'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
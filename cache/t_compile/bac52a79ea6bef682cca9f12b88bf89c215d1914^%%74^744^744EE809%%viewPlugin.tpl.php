<?php /* Smarty version 2.6.25-dev, created on 2018-10-24 06:27:04
         compiled from controllers/grid/plugins/viewPlugin.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'controllers/grid/plugins/viewPlugin.tpl', 17, false),array('modifier', 'date_format', 'controllers/grid/plugins/viewPlugin.tpl', 48, false),array('modifier', 'strip_unsafe_html', 'controllers/grid/plugins/viewPlugin.tpl', 51, false),array('function', 'translate', 'controllers/grid/plugins/viewPlugin.tpl', 19, false),)), $this); ?>
<div class="pkp_plugin_details">

	<div class="status <?php echo ((is_array($_tmp=$this->_tpl_vars['statusClass'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
		<div class="pkp_screen_reader">
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins.pluginGallery.latestCompatible"), $this);?>

		</div>

		<?php if ($this->_tpl_vars['installAction'] && ( $this->_tpl_vars['statusClass'] == 'older' || $this->_tpl_vars['statusClass'] == 'notinstalled' )): ?>
			<div class="action_button">
				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "linkAction/linkAction.tpl", 'smarty_include_vars' => array('action' => $this->_tpl_vars['installAction'],'contextId' => 'pluginGallery')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
			</div>
		<?php else: ?>
			<div class="status_notice">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['statusKey']), $this);?>

			</div>
		<?php endif; ?>

		<?php if ($this->_tpl_vars['statusClass'] != 'incompatible'): ?>

			<ul class="certifications">
				<?php $_from = $this->_tpl_vars['plugin']->getReleaseCertifications(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['certification']):
?>
					<li class="certification_<?php echo ((is_array($_tmp=$this->_tpl_vars['certification'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
						<span class="label">
							<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins.pluginGallery.certifications.".($this->_tpl_vars['certification'])), $this);?>

						</span>
						<span class="description">
							<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins.pluginGallery.certifications.".($this->_tpl_vars['certification']).".description"), $this);?>

						</span>
					</li>
				<?php endforeach; endif; unset($_from); ?>
			</ul>

			<div class="release">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins.pluginGallery.version",'version' => ((is_array($_tmp=$this->_tpl_vars['plugin']->getVersion())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)),'date' => ((is_array($_tmp=$this->_tpl_vars['plugin']->getDate())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort']))), $this);?>

			</div>
			<div class="release_description">
				<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getLocalizedReleaseDescription())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : PKPString::stripUnsafeHtml($_tmp)); ?>

			</div>
		<?php endif; ?>
	</div>

	<h4 class="pkp_screen_reader">
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins.pluginGallery.summary"), $this);?>

	</h4>

	<div class="maintainer">
		<div class="author">
			<?php if ($this->_tpl_vars['plugin']->getContactEmail()): ?>
				<a href="mailto:<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getContactEmail())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
					<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getContactName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</a>
			<?php else: ?>
				<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getContactName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

			<?php endif; ?>
		</div>
		<div class="institution">
			<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getContactInstitutionName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

		</div>
	</div>

	<div class="url">
		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getHomepage())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" target="_blank"><?php echo ((is_array($_tmp=$this->_tpl_vars['plugin']->getHomepage())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
	</div>

	<div class="description">
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/revealMore.tpl", 'smarty_include_vars' => array('content' => ((is_array($_tmp=$this->_tpl_vars['plugin']->getLocalizedDescription())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : PKPString::stripUnsafeHtml($_tmp)))));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	</div>

	<?php if ($this->_tpl_vars['plugin']->getLocalizedInstallationInstructions()): ?>
		<div class="installation">
			<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/revealMore.tpl", 'smarty_include_vars' => array('content' => ((is_array($_tmp=$this->_tpl_vars['plugin']->getLocalizedInstallationInstructions())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : PKPString::stripUnsafeHtml($_tmp)))));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		</div>
	<?php endif; ?>
</div>
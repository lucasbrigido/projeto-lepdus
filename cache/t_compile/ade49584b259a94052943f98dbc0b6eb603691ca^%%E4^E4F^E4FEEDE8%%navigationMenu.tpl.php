<?php /* Smarty version 2.6.25-dev, created on 2018-10-18 06:05:48
         compiled from frontend/components/navigationMenu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'frontend/components/navigationMenu.tpl', 17, false),)), $this); ?>

<?php if ($this->_tpl_vars['navigationMenu']): ?>
	<ul id="<?php echo ((is_array($_tmp=$this->_tpl_vars['id'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" class="<?php echo ((is_array($_tmp=$this->_tpl_vars['ulClass'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
 pkp_nav_list">
		<?php $_from = $this->_tpl_vars['navigationMenu']->menuTree; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field'] => $this->_tpl_vars['navigationMenuItemAssignment']):
?>
			<?php if (! $this->_tpl_vars['navigationMenuItemAssignment']->navigationMenuItem->getIsDisplayed()): ?>
				<?php continue; ?>
			<?php endif; ?>
			<li class="<?php echo ((is_array($_tmp=$this->_tpl_vars['liClass'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
				<a href="<?php echo $this->_tpl_vars['navigationMenuItemAssignment']->navigationMenuItem->getUrl(); ?>
">
					<?php echo $this->_tpl_vars['navigationMenuItemAssignment']->navigationMenuItem->getLocalizedTitle(); ?>

				</a>
				<?php if ($this->_tpl_vars['navigationMenuItemAssignment']->navigationMenuItem->getIsChildVisible()): ?>
					<ul>
						<?php $_from = $this->_tpl_vars['navigationMenuItemAssignment']->children; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['childField'] => $this->_tpl_vars['childNavigationMenuItemAssignment']):
?>
							<?php if ($this->_tpl_vars['childNavigationMenuItemAssignment']->navigationMenuItem->getIsDisplayed()): ?>
								<li class="<?php echo ((is_array($_tmp=$this->_tpl_vars['liClass'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
									<a href="<?php echo $this->_tpl_vars['childNavigationMenuItemAssignment']->navigationMenuItem->getUrl(); ?>
">
										<?php echo $this->_tpl_vars['childNavigationMenuItemAssignment']->navigationMenuItem->getLocalizedTitle(); ?>

									</a>
								</li>
							<?php endif; ?>
						<?php endforeach; endif; unset($_from); ?>
					</ul>
				<?php endif; ?>
			</li>
		<?php endforeach; endif; unset($_from); ?>
	</ul>
<?php endif; ?>
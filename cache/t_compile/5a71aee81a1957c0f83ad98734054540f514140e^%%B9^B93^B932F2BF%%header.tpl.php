<?php /* Smarty version 2.6.25-dev, created on 2018-10-18 06:05:47
         compiled from frontend/components/header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'frontend/components/header.tpl', 22, false),array('modifier', 'assign', 'frontend/components/header.tpl', 23, false),array('modifier', 'escape', 'frontend/components/header.tpl', 25, false),array('modifier', 'default', 'frontend/components/header.tpl', 25, false),array('function', 'translate', 'frontend/components/header.tpl', 23, false),array('function', 'url', 'frontend/components/header.tpl', 47, false),array('function', 'load_menu', 'frontend/components/header.tpl', 78, false),)), $this); ?>
<?php echo ''; ?><?php echo ''; ?><?php $this->assign('showingLogo', true); ?><?php echo ''; ?><?php if ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_string ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?><?php echo ''; ?><?php $this->assign('showingLogo', false); ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?>

<!DOCTYPE html>
<html lang="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentLocale'])) ? $this->_run_mod_handler('replace', true, $_tmp, '_', "-") : smarty_modifier_replace($_tmp, '_', "-")); ?>
" xml:lang="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentLocale'])) ? $this->_run_mod_handler('replace', true, $_tmp, '_', "-") : smarty_modifier_replace($_tmp, '_', "-")); ?>
">
<?php if (! $this->_tpl_vars['pageTitleTranslated']): ?><?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['pageTitle']), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'pageTitleTranslated') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'pageTitleTranslated'));?>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/headerHead.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<body class="pkp_page_<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['requestedPage'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, 'index') : smarty_modifier_default($_tmp, 'index')); ?>
 pkp_op_<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['requestedOp'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, 'index') : smarty_modifier_default($_tmp, 'index')); ?>
<?php if ($this->_tpl_vars['showingLogo']): ?> has_site_logo<?php endif; ?>" dir="<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['currentLocaleLangDir'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, 'ltr') : smarty_modifier_default($_tmp, 'ltr')); ?>
">

	<div class="cmp_skip_to_content">
		<a href="#pkp_content_main"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.skip.main"), $this);?>
</a>
		<a href="#pkp_content_nav"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.skip.nav"), $this);?>
</a>
		<a href="#pkp_content_footer"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.skip.footer"), $this);?>
</a>
	</div>
	<div class="pkp_structure_page">

				<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			<div class="pkp_head_wrapper">

				<div class="pkp_site_name_wrapper">
										<?php if ($this->_tpl_vars['requestedOp'] == 'index'): ?>
						<h1 class="pkp_site_name">
					<?php else: ?>
						<div class="pkp_site_name">
					<?php endif; ?>
						<?php if ($this->_tpl_vars['currentContext'] && $this->_tpl_vars['multipleContexts']): ?>
							<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index','router' => @ROUTE_PAGE), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'homeUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'homeUrl'));?>

						<?php else: ?>
							<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('context' => 'index','router' => @ROUTE_PAGE), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'homeUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'homeUrl'));?>

						<?php endif; ?>
						<?php if ($this->_tpl_vars['displayPageHeaderLogo'] && is_array ( $this->_tpl_vars['displayPageHeaderLogo'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="is_img">
								<img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" width="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['width'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" height="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['height'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" <?php if ($this->_tpl_vars['displayPageHeaderLogo']['altText'] != ''): ?>alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['altText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php else: ?>alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.pageHeaderLogo.altText"), $this);?>
"<?php endif; ?> />
							</a>
						<?php elseif ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_string ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="is_text"><?php echo $this->_tpl_vars['displayPageHeaderTitle']; ?>
</a>
						<?php elseif ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_array ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="is_img">
								<img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['altText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" width="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['width'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" height="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['height'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
							</a>
						<?php else: ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="is_img">
								<img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/templates/images/structure/logo.png" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['applicationName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" title="<?php echo ((is_array($_tmp=$this->_tpl_vars['applicationName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" width="180" height="90" />
							</a>
						<?php endif; ?>
					<?php if ($this->_tpl_vars['requestedOp'] == 'index'): ?>
						</h1>
					<?php else: ?>
						</div>
					<?php endif; ?>
				</div>

								<?php if ($this->_tpl_vars['currentContext']): ?>
					<nav class="pkp_navigation_primary_row" aria-label="<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.navigation.site"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
">
						<div class="pkp_navigation_primary_wrapper">
														<?php echo $this->_plugins['function']['load_menu'][0][0]->smartyLoadNavigationMenuArea(array('name' => 'primary','id' => 'navigationPrimary','ulClass' => 'pkp_navigation_primary'), $this);?>


														<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/searchForm_simple.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						</div>
					</nav>
				<?php endif; ?>
				<nav class="pkp_navigation_user_wrapper" id="navigationUserWrapper" aria-label="<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.navigation.user"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
">
					<?php echo $this->_plugins['function']['load_menu'][0][0]->smartyLoadNavigationMenuArea(array('name' => 'user','id' => 'navigationUser','ulClass' => 'pkp_navigation_user','liClass' => 'profile'), $this);?>

				</nav>
			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

				<?php if ($this->_tpl_vars['isFullWidth']): ?>
			<?php $this->assign('hasSidebar', 0); ?>
		<?php endif; ?>
		<div class="pkp_structure_content<?php if ($this->_tpl_vars['hasSidebar']): ?> has_sidebar<?php endif; ?>">
			<div id="pkp_content_main" class="pkp_structure_main" role="main">
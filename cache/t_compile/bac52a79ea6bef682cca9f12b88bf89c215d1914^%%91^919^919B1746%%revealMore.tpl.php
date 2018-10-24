<?php /* Smarty version 2.6.25-dev, created on 2018-10-24 06:27:04
         compiled from controllers/revealMore.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'uniqid', 'controllers/revealMore.tpl', 13, false),array('function', 'translate', 'controllers/revealMore.tpl', 32, false),)), $this); ?>
<?php $this->assign('id', ((is_array($_tmp=10)) ? $this->_run_mod_handler('uniqid', true, $_tmp) : uniqid($_tmp))); ?>
<?php if (! $this->_tpl_vars['height']): ?>
	<?php $this->assign('height', 192); ?>
<?php endif; ?>
<script>
	// Initialise JS handler.
	$(function() {
		$('#revealMore-<?php echo $this->_tpl_vars['id']; ?>
').pkpHandler(
			'$.pkp.controllers.RevealMoreHandler',
			{
				height: <?php echo $this->_tpl_vars['height']; ?>

			}
		);
	});
</script>
<div id="revealMore-<?php echo $this->_tpl_vars['id']; ?>
" class="pkp_controllers_revealMore">
	<?php echo $this->_tpl_vars['content']; ?>

	<div class="reveal_more_wrapper">
		<button href="#" class="revealMoreButton">
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.readMore"), $this);?>

		</button>
	</div>
</div>
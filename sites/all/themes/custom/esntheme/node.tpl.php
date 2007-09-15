<div id="node-<?php print $node->nid; ?>" class="node<?php if ($sticky) { print " sticky"; } ?><?php if (!$status) { print " node-unpublished"; } ?>">
	
<?php print $picture ?>

<?php if ($page == 0): ?>
  <h2 class="title"><a href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print $title ?></a></h2>
<?php endif; ?>

<?php if ($submitted): ?>
  <span class="submitted"><?php print t('!date — !username', array('!username' => theme('username', $node), '!date' => format_date($node->created))); ?></span>
<?php endif; ?>

<?php if (strip_tags($terms)) echo '<span class="taxonomy">'.$terms.'</span>'; ?>

<div class="content"><?php print $content?></div>

<?php if ($links): ?>
  <div class="links"><?php print $links; ?></div>
<?php endif; ?>

</div>

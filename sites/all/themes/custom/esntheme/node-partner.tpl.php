<div id="node-<?php print $node->nid; ?>" class="node<?php if ($sticky) { print ' sticky'; } ?><?php if (!$status) { print ' node-unpublished'; } ?> clear-block">

<?php print $picture ?>

<?php if ($page == 0): ?>
  <h2><a href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print $title ?></a></h2>
<?php endif; ?>

  <div class="meta">
  <?php if ($submitted): ?>
    <span class="submitted"><?php print $submitted ?></span>
  <?php endif; ?>

  <?php if ($terms): ?>
    <span class="terms"><?php print $terms ?></span>
  <?php endif;?>
  </div>

  <div class="content">

	<?php
		$file = ($node->field_logo[0]); 
		if(!empty($file['filepath'])) {
			$img_alt = $file['alt'];
			$img_title = $file['title'];
			$img_attributes = array('class' => 'left');
			$img = theme('imagecache', 'mainimage', $file['filepath'], $img_alt, $img_title, $img_attributes);
			
			if(!empty($node->field_logolink[0]['url'])) {
				print l($img, $node->field_logolink[0]['url'], null, null, null, false, true);
			} else {
				print $img;
			}
		}
	?>
	<?php
	$link = ($node->field_logolink[0]); 
	if(!empty($link['url'])) {
		print "<b>Partner website</b>: ".l($link['title'], $link['url']);
	}
	?>
	
	<p><?php print html_entity_decode($node->content['field_shortdescription']['#value']); ?></p>
	<?php print html_entity_decode($node->content['body']['#value']); ?>
		
  </div>

<?php
  if ($links) {
    print $links;
  }
?>

</div>
<?php if ($reviews) { ?>
<div class="list-group">
  <?php foreach ($reviews as $review) { ?>
  <div class="review-list list-group-item">
    <div class="list-group-item-heading clearfix"><b><?php echo $review['author']; ?></b> <small><?php echo $text_on; ?> <?php echo $review['date_added']; ?></small>
      <img class="pull-right" src="catalog/view/theme/default/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['rating']; ?>" title="<?php echo $review['rating']; ?>" />
    </div>
    <p class="list-group-item-text"><?php echo $review['text']; ?></p>
  </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
</div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>

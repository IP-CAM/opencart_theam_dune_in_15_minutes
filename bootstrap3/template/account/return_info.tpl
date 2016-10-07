<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <script type="text/javascript" src="catalog/view/theme/bootstrap/js/printthis.js"></script>
    <div class="hidden-print hidden-xs hidden-sm clearfix">
      <a onclick="$('#return-info').printThis();" class="button btn btn-default pull-right"><span class="glyphicon glyphicon-print"></span></a>
    </div>
    <div id="return-info">
    <h1><?php echo $text_return_id; ?> #<?php echo $return_id; ?> <small>(<?php echo $date_added; ?>)</small></h1>
    <div class="row">
      <div class="col-md-4">
        <div class="well">
          <h4><?php echo $product; ?></h4>
          <?php echo $column_model; ?> <?php echo $model; ?><br>
          <?php echo $column_quantity; ?> <?php echo $quantity; ?>
        </div> 
        <?php if ($comment) { ?>
        <?php echo $text_comment; ?><br>
        <small><?php echo $comment; ?></small>
        <?php } ?> 
      </div>
      <div class="col-md-8">
        <ul class="list-unstyled">
          <li><?php echo $text_order_id; ?> #<?php echo $order_id; ?></li>
          <li><?php echo $text_date_ordered; ?> <?php echo $date_ordered; ?></li>
          <li><?php echo $column_reason; ?>: <?php echo $reason; ?></li>
          <li><?php echo $column_opened; ?>: <?php echo $opened; ?></li>
          <?php if ($action) { ?>
          <li><?php echo $column_action; ?>: <?php echo $action; ?></li>
          <?php } ?>
          </ul>
        </div>
      </div>
    </div>
    <?php if ($histories) { ?>
    <a data-toggle="collapse" href="#return-history" aria-expanded="false" aria-controls="return-history"><?php echo $text_history; ?> <span class="caret"></span></a>
    <div id="return-history" class="tbl-responsive collapse">
      <table class="list table table-striped table-condensed">
        <thead>
          <tr>
            <td class="left"><?php echo $column_date_added; ?></td>
            <td class="left"><?php echo $column_status; ?></td>
            <td class="left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td data-title="<?php echo $column_date_added; ?>" class="left"><?php echo $history['date_added']; ?></td>
            <td data-title="<?php echo $column_status; ?>" class="left"><?php echo $history['status']; ?></td>
            <td data-title="<?php echo $column_comment; ?>" class="left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  <?php } ?>
  <hr>
  <div class="buttons navbar clearfix">
    <div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <?php if ($orders) { ?>
    <div class="row">
    <?php foreach ($orders as $order) { ?>
    <div class="col-md-4">
    <div class="order-list panel panel-default">
      <div class="panel-heading clearfix">
        <div class="pull-left">#<?php echo $order['order_id']; ?> - <?php echo $order['date_added']; ?></div>
        <div class="buttons btn-group btn-group-sm pull-right">
          <a class="btn btn-default btn-sm" title="<?php echo $button_view; ?>" href="<?php echo $order['href']; ?>"><span class="glyphicon glyphicon-search"></span></a>
          <a class="btn btn-default btn-sm" title="<?php echo $button_reorder; ?>" href="<?php echo $order['reorder']; ?>"><span class="glyphicon glyphicon-refresh"></span></a>
        </div>
      </div>
      <div class="content panel-body">
        <ul class="list-unstyled">
          <li><?php echo $text_status; ?>: <?php echo $order['status']; ?></li>
          <li><?php echo $text_products; ?>: <?php echo $order['products']; ?></li>
          <li><?php echo $text_customer; ?>: <?php echo $order['name']; ?></li>
          <li><?php echo $order['total']; ?></li>
        </ul>
      </div>
    </div>
    </div>

    <?php } ?>
    </div>
    <?php if ($pagination) { ?>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } ?>
    <?php } else { ?>
    <div class="content"><p><?php echo $text_empty; ?></p></div>
    <?php } ?>
    
    <div class="buttons form-inline navbar">
      <a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
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
    <?php if ($returns) { ?>
    <div class="content row return-list">
    <?php foreach ($returns as $return) { ?>
    <div class="col-md-4">
    <div class="panel panel-default">
      <div class="content panel-heading clearfix">
        <h5 class="return-id pull-left">#<?php echo $return['return_id']; ?> - <?php echo $return['date_added']; ?></h5>
        <div class="return-info pull-right"><a class="btn btn-default btn-sm" title="<?php echo $button_view; ?>" href="<?php echo $return['href']; ?>"><span class="glyphicon glyphicon-search"></span></a></div>
      </div>
      <div class="content panel-body">
        <ul class="list-unstyled">
          <li><?php echo $text_status; ?>: <?php echo $return['status']; ?></li>
          <li><?php echo $text_customer; ?>: <?php echo $return['name']; ?></li>
        </ul>
      </div>
    </div>
    </div>
    <?php } ?>
    </div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } else { ?>
    <div class="content"><p><?php echo $text_empty; ?></p></div>
    <?php } ?>
    <div class="buttons nav navbar">
      <a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
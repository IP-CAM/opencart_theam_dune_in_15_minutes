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
    <?php if ($rewards) { ?>
    <p><?php echo $text_total; ?><b> <?php echo $total; ?></b></p>
    <div class="tbl-responsive">
      <table class="list table table-striped table-condensed">
        <thead>
          <tr>
            <td class="left"><?php echo $column_date_added; ?></td>
            <td class="left"><?php echo $column_description; ?></td>
            <td class="right"><?php echo $column_points; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($rewards  as $reward) { ?>
          <tr>
            <td data-title="<?php echo $column_date_added; ?>" class="left"><?php echo $reward['date_added']; ?></td>
            <td data-title="<?php echo $column_description; ?>" class="left"><?php if ($reward['order_id']) { ?>
            <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
            <?php } else { ?>
            <?php echo $reward['description']; ?>
            <?php } ?>
            </td>
            <td data-title="<?php echo $column_points; ?>" class="right"><?php echo $reward['points']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } else { ?>
    <div class="content"><p><?php echo $text_empty; ?></p></div>
    <?php } ?>
    <div class="buttons navbar clearfix">
      <div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
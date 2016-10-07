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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="content clearfix">
        <div class="checkbox">
          <label>
            <input type="checkbox" name="newsletter"<?php echo $newsletter ? ' checked' : '';?>>
            <?php echo $entry_newsletter; ?>
          </label>
        </div>
      </div>
      <div class="buttons navbar form-inline clearfix">
        <a class="pull-left hidden-xs" href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button form-control btn btn-primary pull-right">
      </div>
    </form>
  <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
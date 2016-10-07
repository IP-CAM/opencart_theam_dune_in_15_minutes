<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-warning alert-dismissible" role="alert"><?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <p><?php echo $text_email; ?></p>
      <div class="content row">
        <div class="form-group">
          <label class="col-sm-1 control-label"><span class="required">*</span> <?php echo $entry_email; ?></label>
          <div class="col-sm-4"><input class="form-control" type="text" name="email" value="" /></div>
        </div>
      </div>
      <div class="buttons buttons form-inline nav navbar">
        <div class="right clearfix">
          <a href="<?php echo $back; ?>" class="button pull-left hidden-xs"><?php echo $button_back; ?></a>
          <input type="submit" value="<?php echo $button_continue; ?>" class="button form-control btn btn-primary pull-right" />
        </div>
      </div>
    </form>
  <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
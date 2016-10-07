<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content">
    <?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="content form">
        <div class="form-group<?php echo $error_password ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="password" name="password" value="<?php echo $password; ?>" placeholder="* <?php echo $entry_password; ?>">
            <?php if($error_password) { ?>
              <div class="help-block"><?php echo $error_password ; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_confirm ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="* <?php echo $entry_confirm; ?>">
            <?php if($error_confirm) { ?>
              <div class="help-block"><?php echo $error_confirm ; ?></div>
            <?php } ?>
          </div>
        </div>
      </div>
      <div class="buttons form-inline nav navbar">
        <div class="right clearix">
        <a class="pull-left hidden-xs" href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button form-control btn btn-primary pull-right">
        </div>
      </div>
    </form>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
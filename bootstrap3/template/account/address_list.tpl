<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-warning alert-dismissible" role="alert"><?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success alert alert-success alert-dismissible" role="alert"><?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content">
    <?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <div class="add-address h4">
      <a title="<?php echo $button_new_address; ?>" href="<?php echo $insert; ?>" class="button btn btn-success"><span class="glyphicon glyphicon-plus"> <?php echo $button_new_address; ?></span></a>
    </div>
    <div class="row">
      <?php foreach ($addresses as $result) { ?>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading clearfix">
          <div class="buttons btn-group btn-group-sm pull-right">
            <a title="<?php echo $button_edit; ?>" href="<?php echo $result['update']; ?>" class="button btn btn-default"><span class="glyphicon glyphicon-edit"></span></a>
            <a title="<?php echo $button_delete; ?>" href="<?php echo $result['delete']; ?>" class="button btn btn-default"><span class="glyphicon glyphicon-remove"></span></a>
          </div>
        </div>
        <div class="content panel-body">
        <?php echo $result['address']; ?>
        </div>
      </div>
    </div>
    <?php } ?>
    </div>
    <div class="buttons form-inline nav navbar">
      <a href="<?php echo $back; ?>" class="button btn btn-primary"><?php echo $button_back; ?></a>
    </div>
    <?php echo $content_bottom; ?>
    </div>
  </div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
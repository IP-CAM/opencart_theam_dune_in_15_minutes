<?php echo $header; ?>
<?php echo $column_left; ?>  
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-warning alert-dismissible" role="alert"><?php echo $error_warning; ?>
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
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="content form">
        <div class="form-group<?php echo $error_firstname ? ' has-error' : '' ?>">
          <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
          <div class="col-md-4">
            <input class="form-control" type="text" name="firstname" value="<?php echo $firstname; ?>">
            <?php if($error_firstname) { ?>
              <div class="help-block"><?php echo $error_firstname; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_lastname ? ' has-error' : '' ?>">
          <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
          <div class="col-sm-4">
            <input class="form-control" type="text" name="lastname" value="<?php echo $lastname; ?>">
            <?php if($error_lastname) { ?>
              <div class="help-block"><?php echo $error_lastname; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_email ? ' has-error' : '' ?>">
          <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_email; ?></label>
          <div class="col-md-4">
            <input class="form-control" type="text" name="email" value="<?php echo $email; ?>">
            <?php if($error_email) { ?>
              <div class="help-block"><?php echo $error_email; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_telephone ? ' has-error' : '' ?>">
          <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
          <div class="col-md-4">
            <input class="form-control" type="text" name="telephone" value="<?php echo $telephone; ?>">
            <?php if($error_telephone) { ?>
              <div class="help-block"><?php echo $error_telephone; ?></div>
            <?php } ?>
          </div>
        </div>
      </div>
      <div class="buttons form-inline nav navbar">
        <div class="right clearix">
        <a class="pull-left hidden-xs" href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button form-control btn btn-primary pull-right" />
        </div>
      </div>
    </form>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($success) { ?>
  <div class="success alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <?php echo $success; ?>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-danger alert-dismissible" role="alert"><?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content"><?php echo $content_top; ?>
    <div class="login-content row">
      <div class="left col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading"><?php echo $text_new_customer; ?></div>
          <div class="content panel-body">
            <p><?php echo $text_register_account; ?></p>
            <a href="<?php echo $register; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
          </div>
        </div>
      </div>
      <div class="right col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading"><?php echo $text_returning_customer; ?></div>
          <div class="content panel-body">
            <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <div class="col-sm-10"><input class="form-control" type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>"/></div>
              </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <input class="form-control" type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>"/>
                  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10">
                  <input type="submit" value="<?php echo $button_login; ?>" class="button btn btn-primary" />
                </div>
              </div>
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_left; ?>
<?php echo $footer; ?>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script>
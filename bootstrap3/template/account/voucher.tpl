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
    <p><?php echo $text_description; ?></p>
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="amount form-group<?php echo $error_amount ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_amount; ?></label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="amount" value="<?php echo $amount; ?>" />
          <?php if($error_amount) { ?>
          <div class="help-block"><?php echo $error_amount; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="to-name form-group<?php echo $error_to_name ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_to_name; ?></label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="to_name" value="<?php echo $to_name; ?>" />
          <?php if($error_to_name) { ?>
          <div class="help-block"><?php echo $error_to_name; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="to-email form-group<?php echo $error_to_email ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_to_email; ?></label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="to_email" value="<?php echo $to_email; ?>" />
          <?php if($error_to_email) { ?>
          <div class="help-block"><?php echo $error_to_email; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="from-name form-group<?php echo $error_from_name ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_from_name; ?></label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="from_name" value="<?php echo $from_name; ?>" />
          <?php if($error_from_name) { ?>
          <div class="help-block"><?php echo $error_from_name; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="from-email form-group<?php echo $error_from_email ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_from_email; ?></label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="from_email" value="<?php echo $from_email; ?>" />
          <?php if($error_from_email) { ?>
          <div class="help-block"><?php echo $error_from_email; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="theme form-group<?php echo $error_theme ? ' has-error' : '';?>">
        <label class="col-sm-2 control-label"><span class="required">*</span> <?php echo $entry_theme; ?></label>
        <div class="col-sm-10">
          <div class="btn-group" data-toggle="buttons">
            <?php foreach ($voucher_themes as $voucher_theme) { ?>
            <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="btn btn-default<?php echo ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) ? ' active' : '';?>">
              <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"<?php echo($voucher_theme['voucher_theme_id'] == $voucher_theme_id) ? ' checked"' : '';?>/>
              <?php echo $voucher_theme['name']; ?>
            </label>
            <?php } ?> 
          </div>
          <?php if($error_theme) { ?>
          <div class="help-block"><?php echo $error_theme; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <a data-toggle="collapse" href="#collapse-message" aria-expanded="false" aria-controls="collapse-message">
            <?php echo $entry_message; ?> <span class="caret"></span>
          </a>
          <div class="collapse" id="collapse-message">
            <textarea class="form-control" name="message" cols="40" rows="3"><?php echo $message; ?></textarea>
          </div>
        </div>
      </div>
      <div class="hide">
        <label for="homepage">Homepage, Site URL</label>
        <input type="text" id="homepage" name="homepage" value="" />
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <label for="agree">
            <input id="agree" type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked="checked"' : '';?>/>
            <?php echo $text_agree; ?>
          </label>
        </div>
      </div>
      <div class="buttons form-group navbar">
        <div class="col-sm-offset-2 col-sm-10">
          <input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-primary" />
        </div>
      </div>
    </form>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
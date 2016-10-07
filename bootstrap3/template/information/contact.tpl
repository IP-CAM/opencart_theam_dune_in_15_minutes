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
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="contact-info col-sm-3">
          <address>
            <strong><?php echo $store; ?></strong><br/>
            <?php echo $address; ?><br/>
            <?php if ($telephone) { ?>
            <?php echo $telephone; ?><br/>
            <?php } ?>
            <?php if ($fax) { ?>
            <?php echo $fax; ?><br/>
            <?php } ?>
          </address>
        </div>
        <div class="content col-sm-9">
          <div class="panel panel-default">
            <div class="panel-heading"><?php echo $text_contact; ?></div>
            <div class="panel-body">
              <div class="name form-group<?php echo $error_name ? ' has-error' : '';?>">
                <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input class="form-control" type="text" name="name" value="<?php echo $name; ?>" />
                  <?php if($error_name) { ?>
                  <div class="help-block"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="email form-group<?php echo $error_email ? ' has-error' : '';?>">
                <label class="col-sm-2 control-label"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input class="form-control" type="text" name="email" value="<?php echo $email; ?>" />
                  <?php if($error_email) { ?>
                  <div class="help-block"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="enquiry form-group<?php echo $error_enquiry ? ' has-error' : '';?>">
                <label class="col-sm-2 control-label"><?php echo $entry_enquiry; ?></label>
                <div class="col-sm-10">
                  <textarea class="form-control" name="enquiry" cols="40" rows="3"></textarea>
                  <?php if($error_enquiry) { ?>
                  <div class="help-block"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="hide">
                <label for="homepage">Homepage, Site URL</label>
                <input type="text" id="homepage" name="homepage" value="" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="buttons nav navbar clearfix">
        <div class="right pull-right"><input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-primary"></div>
      </div>
    </form>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
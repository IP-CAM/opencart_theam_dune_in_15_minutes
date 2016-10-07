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
        <div class="col-md-4">
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
      <div class="form-group<?php echo $error_order_id ? ' has-error' : '' ?>">
        <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_order_id; ?></label>
        <div class="col-md-4">
          <input class="form-control" type="text" name="order_id" value="<?php echo $order_id; ?>">
          <?php if($error_order_id) { ?>
          <div class="help-block"><?php echo $error_order_id; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-2 control-label"><?php echo $entry_date_ordered; ?></label>
        <div class="col-md-4">
          <input class="form-control" type="text" name="date_ordered" value="<?php echo $date_ordered; ?>">
        </div>
      </div>
      <hr />
      <div class="return-name form-group<?php echo $error_product ? ' has-error' : '' ?>">
        <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_product; ?></label>
        <div class="col-md-4">
          <input class="form-control" type="text" name="product" value="<?php echo $product; ?>">
          <?php if($error_product) { ?>
          <div class="help-block"><?php echo $error_product; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="return-model form-group<?php echo $error_model ? ' has-error' : '' ?>">
        <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_model; ?></label>
        <div class="col-md-4">
          <input class="form-control" type="text" name="model" value="<?php echo $model; ?>">
          <?php if($error_model) { ?>
          <div class="help-block"><?php echo $error_model;?></div>
          <?php } ?>
        </div>
      </div>
      <div class="return-quantity form-group">
        <label class="col-md-2 control-label"><?php echo $entry_quantity; ?></label>
        <div class="col-md-4">
          <input class="form-control" type="text" name="quantity" value="<?php echo $quantity; ?>">
        </div>
      </div>
      <div class="return-reason form-group<?php echo $error_reason ? ' has-error' : '' ?>">
        <label class="col-md-2 control-label"><span class="required">*</span> <?php echo $entry_reason; ?></label>
        <div class="col-md-4">
          <select name="return_reason_id" class="form-control">
            <?php foreach ($return_reasons as $return_reason) { ?>
            <option value="<?php echo $return_reason['return_reason_id']; ?>"<?php echo ($return_reason['return_reason_id'] == $return_reason_id) ? ' selected="selected"' : ''; ?>><?php echo $return_reason['name']; ?></option>
            <?php  } ?>   
          </select>
          <?php if($error_reason) { ?>
          <div class="help-block"><?php echo $error_reason;?></div>
          <?php } ?>
        </div>
      </div>
      <div class="return-opened form-group">
        <label class="col-md-2 control-label"><?php echo $entry_opened; ?></label>
        <div class="col-md-4">
          <select name="opened" class="form-control">
            <option value="1"<?php echo $opened ? ' selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
            <option value="0"<?php echo !$opened ? ' selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
          </select>
        </div>
      </div>
      <div class="fault-detail form-group">
        <label class="col-md-2 control-label"><?php echo $entry_fault_detail; ?></label>
        <div class="col-md-4"><textarea class="form-control" name="comment" rows="3"><?php echo $comment; ?></textarea></div>
      </div>
      <div class="hide">
        <label for="homepage">Homepage, Site URL</label>
        <input type="text" id="homepage" name="homepage" value="" />
      </div>
      <?php if ($text_agree) { ?>
      <div class="agree form-group">
        <label class="col-md-2 control-label"><?php echo $text_agree; ?></label>
        <div class="col-md-4"><input type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked="checked"' : ''; ?> /></div>
      </div>
      <?php } ?>
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
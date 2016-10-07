<?php if ($error_warning) { ?>
<div class="warning alert alert-warning alert-dismissible" role="alert">
  <?php echo $error_warning; ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<?php } ?>
<?php if ($payment_methods) { ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label for="<?php echo $payment_method['code']; ?>">
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked>
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<div class="row">
  <div class="comment-wrapper col-md-6">
    <a data-toggle="collapse" href="#payment-comments" aria-expanded="false" aria-controls="collapse-comments">
      <?php echo $text_comments; ?><span class="caret"></span>
    </a>
    <div id="payment-comments" class="collapse">
      <textarea name="comment" class="form-control" rows="3"><?php echo $comment; ?></textarea>
    </div>
  </div>
</div>
<?php if ($text_agree) { ?>
  <div class="form-group">
  <label>
    <input type="checkbox" name="agree" value="1"<?php echo($agree ? ' checked' : ''); ?>>
    <?php echo $text_agree; ?>
  </label>
  </div>
<?php } ?>
<div class="buttons nav navbar clearfix">
  <div class="right pull-right">
    <button id="button-payment-method" class="button btn btn-success"><?php echo $button_continue; ?> <span class="glyphicon glyphicon-chevron-down"></span></button>
  </div>
</div>
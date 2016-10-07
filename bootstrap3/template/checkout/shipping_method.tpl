<?php if ($error_warning) { ?>
<div class="warning alert alert-warning alert-dismissible" role="alert">
<?php echo $error_warning; ?>
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<div class="radio panel">
  <?php foreach ($shipping_methods as $shipping_method) { ?>
  <div>
    <?php echo $shipping_method['title']; ?><br />
    <?php if (!$shipping_method['error']) { ?>
    <?php foreach ($shipping_method['quote'] as $quote) { ?>
    <label for="<?php echo $quote['code']; ?>">
      <?php if ($quote['code'] == $code || !$code) { ?>
      <?php $code = $quote['code']; ?>
      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked>
      <?php } else { ?>
      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>">
      <?php } ?>
      <?php echo $quote['title']; ?>
    </label>
    <?php } ?>
    <?php } else { ?>
    <div class="error text-danger"><?php echo $shipping_method['error']; ?></div>
    <?php } ?>
  </div>
  <?php } ?>
</div>
<?php } ?>
<input type="hidden" name="comment" value="" />
<div class="buttons nav navbar clearfix">
  <div class="right pull-right">
    <button id="button-shipping-method" class="button btn btn-success"><?php echo $button_continue; ?> <span class="glyphicon glyphicon-chevron-down"></span></button>
  </div>
</div>
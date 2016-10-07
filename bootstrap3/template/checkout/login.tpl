<div class="panel-group" id="auth-accordion" role="tablist" aria-multiselectable="true">
  <div class="new-customer panel panel-default">
    <div class="panel-heading" role="tab" id="heading-new-customer">
      <a data-toggle="collapse" data-parent="#auth-accordion" href="#collapse-new-customer" aria-expanded="true" aria-controls="collapse-new-customer">
        <?php echo $text_new_customer; ?>
      </a>
    </div>
    <div id="collapse-new-customer" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-new-customer">
      <div class="panel-body">
        <p><?php echo $text_register_account; ?></p>
        <input type="button" value="<?php echo $text_register; ?>" id="button-account-register" rel="register" class="button auth btn btn-success"/>
        <?php if ($guest_checkout) { ?>
        <input type="button" value="<?php echo $text_guest; ?>" id="button-account-guest" rel="guest" class="button auth btn btn-default"/>
        <?php } ?>
      </div>
    </div>
  </div>
  <div id="login" class="returning-customer panel panel-default">
    <div class="panel-heading" role="tab" id="heading-returning-customer">
      <a data-toggle="collapse" data-parent="#auth-accordion" href="#collapse-returning-customer" aria-expanded="true" aria-controls="collapse-returning-customer">
        <?php echo $text_returning_customer; ?>
      </a>
    </div>
    <div id="collapse-returning-customer" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-returning-customer">
      <div class="panel-body form-horizontal">
        <div class="form-group">
          <div class="col-sm-10"><input class="form-control" type="text" name="email" value="" placeholder="* <?php echo $entry_email; ?>"/></div>
        </div>
        <div class="form-group">
          <div class="col-sm-10">
            <input class="form-control" type="password" name="password" value="" placeholder="* <?php echo $entry_password; ?>"/>
            <div class="help-block"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <input type="button" data-loading-text="Loading..." value="<?php echo $button_login; ?>" id="button-login" class="button btn btn-primary" />
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
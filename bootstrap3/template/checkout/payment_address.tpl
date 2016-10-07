<?php
    foreach ($countries as $country) {
        if($country['country_id'] == $country_id) {
            $default_country_name = $country['name'];
            break;
        }
    }
?>
<?php if ($addresses) { ?>
<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-default active">
    <input type="radio" name="payment_address" value="existing" id="payment-address-existing" autocomplete="off"  checked><?php echo $text_address_existing; ?>
  </label>
  <label class="btn btn-default">
    <input type="radio" name="payment_address" value="new" id="payment-address-new" autocomplete="off"><?php echo $text_address_new; ?>
  </label>
</div>
<hr/>
<div id="payment-existing" class="clearfix" data-toggle="buttons">
  <?php foreach ($addresses as $address) { ?>
  <label id="payment-address-id<?php echo $address['address_id']; ?>" for="payment-address-id<?php echo $address['address_id']; ?>" class="btn btn-default<?php echo ($address['address_id'] == $address_id) ? ' active' : '';?>">
    <input type="radio" name="address_id" value="<?php echo $address['address_id']; ?>" id="payment-address-id<?php echo $address['address_id']; ?>" autocomplete="off"<?php echo ($address['address_id'] == $address_id ? ' checked' : ''); ?>>
      <span class="lastname"><?php echo $address['lastname']; ?></span> <span class="firstname"><?php echo $address['firstname']; ?></span><br/>
    <small>
      <span class="address-1"><?php echo $address['address_1']; ?></span><br/>
      <span class="city"><?php echo $address['city']; ?></span> <span class="zone"><?php echo $address['zone']; ?></span><br/>
      <span class="country text-uppercase"><?php echo $address['country']; ?></span>
    </small>
  </label>
  <?php } ?>
</div>
<?php } ?>
<div id="payment-new" class="form-horizontal clearfix" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
  <div class="form-group">
    <div class="col-md-4"><input class="form-control" type="text" name="firstname" value="" placeholder="* <?php echo $entry_firstname; ?>"/></div>
  </div>
  <div class="form-group">
    <div class="col-md-4"><input class="form-control" type="text" name="lastname" value="" placeholder="* <?php echo $entry_lastname; ?>"/></div>
  </div>
  <div class="form-group">
    <div class="col-md-4"><input class="form-control" type="text" name="city" value="" placeholder="* <?php echo $entry_city; ?>"/></div>
  </div>
  <div class="form-group">
    <div class="col-md-4"><input class="form-control" type="text" name="address_1" value="" placeholder="* <?php echo $entry_address_1; ?>"/></div>
  </div>
  <div class="form-group">
    <div class="col-md-4"><input class="form-control" type="text" name="postcode" value="" placeholder="* <?php echo $entry_postcode; ?>"/></div>
  </div>
  <div class="form-group<?php echo (isset($default_country_name)) ? ' hide' : '';?>">
    <div class="col-md-4">
      <select class="form-control" name="country_id">
        <option value="" disabled>* <?php echo $entry_country; ?></option>
        <?php foreach ($countries as $country) { ?>
        <?php if ($country['country_id'] == $country_id) { ?>
        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="form-group">
    <?php if(isset($default_country_name)) { ?>
    <div class="col-md-1">
      <p class="form-control-static">
        <a class="country-select-switcher" href="#" style="border-bottom:1px dashed;text-decoration:none;"><?php echo $default_country_name; ?></a>
      </p>
    </div>
    <?php } ?>
    <div class="col-md-3">
      <select class="form-control" name="zone_id">
        <option value="" disabled>* <?php echo $entry_zone; ?></option>
      </select>
    </div>
  </div>
  <input type="hidden" name="company" value="" />
  <input type="hidden" name="address_2" value="" />
</div>
<hr/>
<div class="buttons nav navbar clearfix">
  <div class="right pull-right">
    <button id="button-payment-address" class="button btn btn-success"><?php echo $button_continue; ?> <span class="glyphicon glyphicon-chevron-down"></span></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#payment-address input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
			}
			
			html = '<option value="" selected disabled><?php echo $entry_zone; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html = '<option value="0" selected disabled"><?php echo $text_none; ?></option>';
			}
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script>
<?php
    foreach ($countries as $country) {
        if($country['country_id'] == $country_id) {
            $default_country_name = $country['name'];
            break;
        }
    }
?>
<div class="form-horizontal clearfix">
  <div class="row">
    <div class="personal col-md-4">
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="firstname" value="" placeholder="* <?php echo $entry_firstname; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="lastname" value="" placeholder="* <?php echo $entry_lastname; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="email" value="" placeholder="* <?php echo $entry_email; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="telephone" value="" placeholder="* <?php echo $entry_telephone; ?>"/></div>
      </div>
    </div>
    <div class="address col-md-4">
      <?php if ($customer_groups) { ?>
      <div class="form-group">
        <select class="form-control" name="customer_group_id">
        <?php foreach ($customer_groups as $customer_group) { ?>
        <option value="" disabled><?php echo $entry_customer_group; ?></option>
        <option value="<?php echo $customer_group['customer_group_id']; ?>"<?php echo ($customer_group['customer_group_id'] == $customer_group_id) ? ' selected' : '';?>><?php echo $customer_group['name']; ?></option>
        <?php } ?>
        </select>
      </div>
      <?php } ?>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="city" value="" placeholder="* <?php echo $entry_city; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="address_1" value="" placeholder="* <?php echo $entry_address_1; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="text" name="postcode" value="" placeholder="* <?php echo $entry_postcode; ?>"/></div>
      </div>
      <div class="form-group<?php echo (isset($default_country_name)) ? ' hide' : '';?>">
        <div class="col-md-10">
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
        <div class="col-md-2">
          <p class="form-control-static">
            <a class="country-select-switcher" href="#" style="border-bottom:1px dashed;text-decoration:none;"><?php echo $default_country_name; ?></a>
          </p>
        </div>
        <?php } ?>
        <div class="col-md-8">
          <select class="form-control" name="zone_id">
            <option value="" disabled>* <?php echo $entry_zone; ?></option>
          </select>
        </div>
      </div>
    </div>
    <div class="password col-md-4">
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="password" name="password" value="" placeholder="* <?php echo $entry_password; ?>"/></div>
      </div>
      <div class="form-group">
        <div class="col-md-10"><input class="form-control" type="password" name="confirm" value="" placeholder="* <?php echo $entry_confirm; ?>"/></div>
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox" name="newsletter" value="1" id="newsletter"/><?php echo $entry_newsletter; ?>
        </label>
      </div>
      <?php if ($shipping_required) { ?>
      <div class="checkbox">
        <label for="shipping">
          <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" />
          <?php echo $entry_shipping; ?>
        </label>
      </div>
      <?php } ?>
      <?php if ($text_agree) { ?>
      <div class="checkbox">
        <label><input type="checkbox" name="agree" value="1" /><?php echo $text_agree; ?></label>
      </div>
      <?php } ?>
    </div>
  </div>
</div>

<input type="hidden" name="fax" value="" />
<input type="hidden" name="company_id" value="" />
<input type="hidden" name="company" value="" />
<input type="hidden" name="fax" value="" />
<input type="hidden" name="tax_id" value="" />
<input type="hidden" name="address_2" value="" />

<div class="buttons nav navbar clearfix">
  <div class="right pull-right"><?php echo $text_agree; ?>
    <button id="button-register" class="button btn btn-success"><?php echo $button_continue; ?> <span class="glyphicon glyphicon-chevron-down"></span></button>
  </div>
</div>

<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').on('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
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
			
			html = '<option value="" disabled selected>* <?php echo $entry_zone; ?></option>';
			
			if (json['zone'] != '') {

				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html = '<option value="0" selected><?php echo $text_none; ?></option>';
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
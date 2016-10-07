<?php
    foreach ($countries as $country) {
        if($country['country_id'] == $country_id) {
            $default_country_name = $country['name'];
            break;
        }
    }
?>
<div class="form-horizontal form clearfix">
  <div class="personal col-md-6">
    <div class="form-group">
      <div class="col-sm-9"><input class="form-control" type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="* <?php echo $entry_firstname; ?>"/></div>
    </div>
    <div class="form-group">
      <div class="col-sm-9"><input class="form-control" type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="* <?php echo $entry_lastname; ?>"/></div>
    </div>
  </div>
  <div class="address col-md-6">
    <input type="hidden" name="company" value="" />
    <input type="hidden" name="address_2" value="" />
    <div class="form-group">
      <div class="col-sm-9"><input class="form-control" type="text" name="city" value="<?php echo $city; ?>" placeholder="* <?php echo $entry_city; ?>"/></div>
    </div>
    <div class="form-group">
      <div class="col-sm-9"><input class="form-control" type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="* <?php echo $entry_address_1; ?>"/></div>
    </div>
    <div class="form-group">
      <div class="col-sm-9"><input class="form-control" type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="* <?php echo $entry_postcode; ?>"/></div>
    </div>
    <div class="form-group<?php echo (isset($default_country_name)) ? ' hide' : '';?>">
      <div class="col-sm-9">
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
      <div class="col-sm-2">
        <p class="form-control-static">
          <a class="country-select-switcher" href="#" style="border-bottom:1px dashed;text-decoration:none;"><?php echo $default_country_name; ?></a>
        </p>
      </div>
      <?php } ?>
      <div class="col-sm-7">
        <select class="form-control" name="zone_id">
          <option value="" disabled>* <?php echo $entry_zone; ?></option>
        </select>
      </div>
    </div>
  </div>
</div>
<div class="buttons nav navbar clearfix">
  <div class="right pull-right">
    <button id="button-guest-shipping" class="button btn btn-success"><?php echo $button_continue; ?> <span class="glyphicon glyphicon-chevron-down"></span></button>
    </div>
</div>
<script type="text/javascript"><!--
$('#shipping-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
			}
			
			html = '<option value="" selected disabled>* <?php echo $entry_zone; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html = '<option value="0" selected disabled><?php echo $text_none; ?></option>';
			}
			
			$('#shipping-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#shipping-address select[name=\'country_id\']').trigger('change');
//--></script>
<?php
    foreach ($countries as $country) {
        if($country['country_id'] == $country_id) {
            $default_country_name = $country['name'];
            break;
        }
    }
?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-warning alert-dismissible" role="alert">
    <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content">
    <?php echo $content_top; ?>
    <h1><?php echo $heading_title; ?></h1>
    <p><?php echo $text_account_already; ?></p>
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="form-group<?php echo $error_firstname ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="* <?php echo $entry_firstname; ?>">
          <?php if ($error_firstname) { ?>
          <div class="help-block"><?php echo $error_firstname; ?></div>
          <?php } ?>        
        </div>
      </div>
      <div class="form-group<?php echo $error_lastname ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="* <?php echo $entry_lastname; ?>">
          <?php if ($error_lastname) { ?>
          <div class="help-block"><?php echo $error_lastname; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_email ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="email" value="<?php echo $email; ?>" placeholder="* <?php echo $entry_email; ?>">
          <?php if ($error_email) { ?>
          <div class="help-block"><?php echo $error_email; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_telephone ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="* <?php echo $entry_telephone; ?>">
          <?php if ($error_telephone) { ?>
          <div class="help-block"><?php echo $error_telephone; ?></div>
          <?php } ?>
        </div>
      </div>
      <hr/>
      <div class="form-group">
        <div class="col-md-4"><input class="form-control" type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>"></div>
      </div>
      <?php if ($customer_groups) { ?>
      <div class="btn-group" data-toggle="buttons">
        <?php echo $entry_customer_group; ?>
        <?php foreach ($customer_groups as $customer_group) { ?>
        <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" class="btn btn-primary<?php echo ($customer_group['customer_group_id'] == $customer_group_id) ? ' active' : '';?>"><?php echo $customer_group['name']; ?>
          <input type="radio" autocomplete="off" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"<?php echo ($customer_group['customer_group_id'] == $customer_group_id) ? ' checked' : '';?>>
        </label>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="form-group<?php echo $error_address_1 ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="* <?php echo $entry_address_1; ?>">
          <?php if ($error_address_1) { ?>
          <div class="help-block"><?php echo $error_address_1; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_city ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="city" value="<?php echo $city; ?>" placeholder="* <?php echo $entry_city; ?>">
          <?php if ($error_city) { ?>
          <div class="help-block"><?php echo $error_city; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_postcode ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="* <?php echo $entry_postcode; ?>">
          <?php if ($error_postcode) { ?>
          <div class="help-block"><?php echo $error_postcode; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_country ? ' has-error' : '' ?><?php echo (isset($default_country_name)) ? ' hide' : '';?>">
        <div class="col-md-4">
          <select class="form-control" name="country_id">
            <option value="" disabled><?php echo $entry_country; ?></option>
            <?php foreach ($countries as $country) { ?>
            <?php if ($country['country_id'] == $country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
          <?php if ($error_country) { ?>
          <div class="help-block"><?php echo $error_country; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_zone ? ' has-error' : '' ?>">
        <?php if(isset($default_country_name)) { ?>
        <div class="col-md-1">
          <p class="form-control-static">
            <a class="country-select-switcher" href="#" style="border-bottom:1px dashed;text-decoration:none;"><?php echo $default_country_name; ?></a>
          </p>
        </div>
        <?php } ?>
        <div class="col-md-3">
          <select class="form-control" name="zone_id">
            <option value="" disabled><?php echo $entry_zone; ?></option>
          </select>
          <?php if ($error_zone) { ?>
          <div class="help-block"><?php echo $error_zone; ?></div>
          <?php } ?>
        </div>
      </div>
      <hr/>
      <div class="form-group<?php echo $error_password ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="password" name="password" value="<?php echo $password; ?>" placeholder="* <?php echo $entry_password; ?>">
          <?php if ($error_password) { ?>
          <div class="help-block"><?php echo $error_password; ?></div>
          <?php } ?>
        </div>
      </div>
      <div class="form-group<?php echo $error_confirm ? ' has-error' : '' ?>">
        <div class="col-md-4">
          <input class="form-control" type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="* <?php echo $entry_confirm; ?>">
          <?php if ($error_confirm) { ?>
          <div class="help-block"><?php echo $error_confirm; ?></div>
          <?php } ?>
        </div>
      </div>
      <hr/>
      <div class="checkbox">
        <label>
          <input type="checkbox" name="newsletter" autocomplete="off"<?php echo $newsletter ? ' checked' : ''; ?>>
          <?php echo $text_newsletter; ?>
        </label>
       </div>
        <?php if ($text_agree) { ?>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="agree" value="1" autocomplete="off"<?php echo $agree ? ' checked' : '';?>>
            <?php echo $text_agree; ?>
          </label>
        </div>
        <?php } ?>
        <hr/>
        <div class="continue nav navbar">
            <input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-primary">
        </div>
    </form>
  <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--

$(document).on('click', '.country-select-switcher', function(){
   $(this).closest('.form-group').prev().removeClass('hide');
   $(this).closest('div').remove();
   return false;
});

$('input[name=\'customer_group_id\']:checked').on('change', function() {
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

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value="" disabled selected>* <?php echo $entry_zone; ?></option>';
			
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
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
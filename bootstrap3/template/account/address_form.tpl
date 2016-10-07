<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $text_edit_address; ?></h1></div>
    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="content">
        <div class="form-group<?php echo $error_firstname ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="* <?php echo $entry_firstname; ?>">
            <?php if($error_firstname) { ?>
            <div class="help-block"><?php echo $error_firstname; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_lastname ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="* <?php echo $entry_lastname; ?>">
            <?php if($error_lastname) { ?>
            <div class="help-block"><?php echo $error_lastname; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_address_1 ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="* <?php echo $entry_address_1; ?>">
            <?php if($error_address_1) { ?>
            <div class="help-block"><?php echo $error_address_1; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_city ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="text" name="city" value="<?php echo $city; ?>" placeholder="* <?php echo $entry_city; ?>">
            <?php if($error_city) { ?>
            <div class="help-block"><?php echo $error_city; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_postcode ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <input class="form-control" type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="* <?php echo $entry_postcode; ?>">
            <?php if($error_postcode) { ?>
            <div class="help-block"><?php echo $error_postcode; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_country ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <select class="form-control" name="country_id">
              <option value="" selected disabled>* <?php echo $entry_country; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php if($error_country) { ?>
            <div class="help-block"><?php echo $error_country; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group<?php echo $error_zone ? ' has-error' : '' ?>">
          <div class="col-md-4">
            <select class="form-control" name="zone_id"><option value="" selected disabled>* <?php echo $entry_zone; ?></option></select>
            <?php if($error_zone) { ?>
            <div class="help-block"><?php echo $error_zone; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="default" autocomplete="off"<?php echo $default ? ' checked' : ''; ?>>
            <?php echo $entry_default; ?>
          </label>
        </div>
      </div>
      <hr/>
      <div class="buttons form-inline nav navbar">
        <div class="right clearix">
        <a class="pull-left hidden-xs" href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button form-control btn btn-primary pull-right">
        </div>
      </div>
    </form>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
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
			
			html = '<option value="" selected disabled>* <?php echo $entry_zone; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
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
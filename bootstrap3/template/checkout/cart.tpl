<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">  
  <?php if ($attention) { ?>
  <div class="attention alert alert-info alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  <?php echo $attention; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    <?php echo $success; ?>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning alert alert-warning alert-dismissible" role="alert"><?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <?php } ?>
  <div id="content">
    <?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1>
      <?php if ($weight) { ?>
      &nbsp;<small>(<?php echo $weight; ?>)</small>
      <?php } ?>
    </div>
    <div class="buttons nav navbar clearfix">
      <div class="pull-right">
        <a href="<?php echo $checkout; ?>" class="btn btn-success"><?php echo $button_checkout; ?></a>
      </div>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="cart-info tbl-responsive">
        <table class="table table-hover table-condensed">
          <thead>
            <tr>
              <th class="name"><?php echo $column_name; ?></th>
              <th class="remove"></th>
              <th class="price"><?php echo $column_price; ?></th>
              <th class="quantity"><?php echo $column_quantity; ?></th>
              <th class="total"><?php echo $column_total; ?></th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="name">
                <div class="media">
                  <?php if ($product['thumb']) { ?>
                  <a class="media-left" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                  <?php } ?>
                  <div class="media-body">
                    <a class="media-heading" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if (!$product['stock']) { ?>
                    <span class="label label-warning">!</span>
                    <?php } ?>
                    <div>
                      <?php foreach ($product['option'] as $option) { ?>
                      - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                      <?php } ?>
                      <?php if($product['recurring']): ?>
                      - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
                      <?php endif; ?>
                    </div>
                    <?php if ($product['reward']) { ?>
                    - <small><?php echo $product['reward']; ?></small>
                    <?php } ?>
                    <small><?php echo $column_model; ?>: <span><?php echo $product['model']; ?></span></small>
                  </div>
                </div>
              </td>
              <td class="remove">
                <a href="<?php echo $product['remove']; ?>" class="btn btn-default" title="<?php echo $button_remove; ?>">
                  <span class="glyphicon glyphicon-trash"></span>
                </a>
              </td>
              <td data-title="<?php echo $column_price; ?>" class="price">
                <?php echo $product['price']; ?>
              </td>
              <td data-title="<?php echo $column_quantity; ?>" class="quantity">
                <div class="input-group">
                  <input type="text" class="form-control" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1">
                  <span class="input-group-btn">
                    <button class="btn btn-default" title="<?php echo $button_update; ?>" onclick="$(this).closest('form').submit();"><span class="glyphicon glyphicon-refresh"></span></button>
                  </span>
                </div>
              </td>
              <td data-title="<?php echo $column_total; ?>" class="total">
                <?php echo $product['total']; ?>
              </td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $vouchers) { ?>
            <tr>
              <td class="image"></td>
              <td class="name"><?php echo $vouchers['description']; ?></td>
              <td class="model"></td>
              <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
              &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
              <td class="price"><?php echo $vouchers['amount']; ?></td>
              <td class="total"><?php echo $vouchers['amount']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="4" class="left text-right"><?php echo $total['title']; ?></td>
              <td class="right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
    </form>
    <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
    <div class="content"><p><?php echo $text_next_choice; ?></p>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
      <?php if ($coupon_status) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading_coupon_status">
           <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse_coupon_status" aria-expanded="true" aria-controls="collapse_coupon_status">
            <?php echo $entry_coupon; ?>
            </a>
          </h4>
        </div>
        <div id="collapse_coupon_status" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_coupon_status">
          <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="input-group col-md-6">
                <input class="form-control" type="text" name="coupon" value="<?php echo $coupon; ?>">
                <input type="hidden" name="next" value="coupon">
                <span class="input-group-btn">
                  <input type="submit" value="<?php echo $button_coupon; ?>" class="button btn btn-primary">
                </span>
              </div>
            </form>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($voucher_status) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading_voucher_status">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse_voucher_status" aria-expanded="false" aria-controls="collapse_voucher_status">
              <?php echo $entry_voucher; ?>
            </a>
          </h4>
        </div>
        <div id="collapse_voucher_status" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_voucher_status">
          <div class="panel-body">
            <form  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="input-group col-md-6">
                <input class="form-control" type="text" name="voucher" value="<?php echo $voucher; ?>">
                <input type="hidden" name="next" value="voucher">
                <span class="input-group-btn">
                  <input type="submit" value="<?php echo $button_voucher; ?>" class="button btn btn-primary">
                </span>
              </div>
            </form>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($reward_status) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading_reward_status">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse_reward_status" aria-expanded="false" aria-controls="collapse_reward_status">
            <?php echo $entry_reward; ?>
            </a>
          </h4>
        </div>
        <div id="collapse_reward_status" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_reward_status">
          <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="input-group col-md-6">
                <input class="form-control" type="text" name="reward" value="<?php echo $reward; ?>">
                <input type="hidden" name="next" value="reward">
                <span class="input-group-btn">
                  <input type="submit" value="<?php echo $button_reward; ?>" class="button btn btn-primary">
                </span>
              </div>
            </form>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($shipping_status) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading_shipping_status">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse_shipping_status" aria-expanded="false" aria-controls="collapse_shipping_status">
            <?php echo $text_shipping_detail; ?>
            </a>
          </h4>
        </div>
        <div id="collapse_shipping_status" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_shipping_status">
          <div class="panel-body">
            <table>
              <tr>
                <td><span class="required">*</span> <?php echo $entry_country; ?></td>
                <td>
                  <select name="country_id">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </td>
              </tr>
              <tr>
                <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
                <td><select name="zone_id"></select></td>
              </tr>
              <tr>
                <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
                <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>
              </tr>
            </table>
            <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button">
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
  <div class="buttons nav navbar">
    <div class="row">
      <div class="col-md-6"><a class="btn btn-primary" href="<?php echo $continue; ?>"><?php echo $button_shopping; ?></a></div>
      <div class="col-md-6 text-right"><a class="btn btn-success" href="<?php echo $checkout; ?>"><?php echo $button_checkout;?></a></div>
    </div>
  </div>
  <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

				}	

				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
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
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
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
<?php } ?>
<?php echo $footer; ?>
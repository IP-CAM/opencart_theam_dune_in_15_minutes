<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <div class="checkout">
      <div id="checkout">
        <div class="checkout-content"></div>
      </div>
      <?php if (!$logged) { ?>
      <div id="payment-address" style="display:none;">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_account; ?></span></div>
        <div class="checkout-content"></div>
      </div>
      <?php } else { ?>
      <div id="payment-address">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_payment_address; ?></span></div>
        <div class="checkout-content"></div>
      </div>
      <?php } ?>
      <?php if ($shipping_required) { ?>
      <div id="shipping-address" style="display:<?php echo ($logged) ? 'block;' : 'none;';?>">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_shipping_address; ?></span></div>
        <div class="checkout-content"></div>
      </div>
      <div id="shipping-method" style="display:<?php echo ($logged) ? 'block;' : 'none;';?>">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_shipping_method; ?></span></div>
        <div class="checkout-content"></div>
      </div>
      <?php } ?>
      <div id="payment-method" style="display:<?php echo ($logged) ? 'block;' : 'none;';?>">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_payment_method; ?></span></div>
        <div class="checkout-content"></div>
      </div>
      <div id="confirm" style="display:<?php echo ($logged) ? 'block;' : 'none;';?>">
        <div class="checkout-heading navbar navbar-default container-fluid"><span class="navbar-brand" style="padding-left:0;"><?php echo $text_checkout_confirm; ?></span></div>
        <div class="checkout-content"></div>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript">
    $(document).on('click', '.checkout-heading a', function() {
        $('.checkout-content').slideUp('fast');
        $(this).parent().parent().find('.checkout-content').slideDown('fast');
    });
    <?php if (!$logged) { ?>
    $(document).ready(function() {
        <?php if(isset($quickconfirm)) { ?>
        quickConfirm();
        <?php }else{ ?>
		$.ajax({
			url: 'index.php?route=checkout/login',
			dataType: 'html',
			success: function(html) {
				$('#checkout .checkout-content').html(html);
				$('#checkout .checkout-content').slideDown('fast');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
        <?php } ?>
    });		
<?php } else { ?>
$(document).ready(function() {
    <?php if(isset($quickconfirm)) { ?>
    quickConfirm();
    <?php }else{ ?>
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        success: function(html) {
            $('#payment-address .checkout-content').html(html);
            $('#payment-address .checkout-content').slideDown('fast');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });	
	<?php } ?>
});
<?php } ?>

$(document).on('click', '.country-select-switcher', function(){
   $(this).closest('.form-group').prev().removeClass('hide');
   $(this).closest('div').remove();
   return false;
});

// Checkout
$(document).on('click', '.button.auth', function() {

    var button = $(this);
    
    $.ajax({
		url: 'index.php?route=checkout/' + $(this).attr('rel'),
		dataType: 'html',
		beforeSend: function() {
			button.attr('disabled', true);
		},		
		complete: function() {
			button.attr('disabled', false);
		},			
		success: function(html) {
            $('.warning, .error').remove();
            $('.has-error').removeClass('has-error');
            $('#payment-address, #shipping-address, #shipping-method, #payment-method, #confirm').show();
			$('#payment-address .checkout-content').html(html);
			$('#checkout .checkout-content').slideUp('fast');
			$('#payment-address .checkout-content').slideDown('fast');
			$('.checkout-heading a').remove();
			$('#checkout .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
        },
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Login
$(document).on('click', '#button-login', function() {
    
    var button = $(this);
    
    $.ajax({
		url: 'index.php?route=checkout/login/validate',
		type: 'post',
		data: $('#checkout #login :input'),
		dataType: 'json',
		beforeSend: function() {
            button.addClass('disabled');
		},	
		complete: function() {
            button.removeClass('disabled');
		},				
		success: function(json) {
			$('.warning, .error, .alert').remove();
            $('.has-error').removeClass('has-error');
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				$('#checkout .checkout-content').prepend(alertBuild(json['error']['warning'], 'danger', 'warning'));
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Register
$(document).on('click', '#button-register', function() {
	$.ajax({
		url: 'index.php?route=checkout/register/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-register').attr('disabled', true);
            $('#button-register span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-register').attr('disabled', false); 
			$('#button-register span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
            $('.has-error').removeClass('has-error');
            if (json['redirect']) {
                location = json['redirect'];
            }
            else if (json['error']) {

                var error_messages = '<div class="text-danger"><ul class="list-unstyled">';

                if (json['error']['warning']) {
                    error_messages += '<li>' + json['error']['warning'] + '</li>';
				}
				
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['firstname'] + '</li>';
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['lastname'] + '</li>';
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['email'] + '</li>';
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['telephone'] + '</li>';
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['company_id'] + '</li>';
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['tax_id'] + '</li>';
				}	
																		
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['address_1'] + '</li>';
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['city'] + '</li>';
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['postcode'] + '</li>';
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['country'] + '</li>';
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['zone'] + '</li>';
				}
				
				if (json['error']['password']) {
					$('#payment-address input[name=\'password\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['password'] + '</li>';
				}	
				
				if (json['error']['confirm']) {
					$('#payment-address input[name=\'confirm\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['confirm'] + '</li>';
				}

                error_messages += '</ul></div>';
                modalBuild(error_messages, 'checkout-register-error');   
			}
            else {
				<?php if ($shipping_required) { ?>
				if ($('#payment-address input[name=\'shipping_address\']').is(':checked')) {
					$.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
							$('#shipping-method .checkout-content').html(html);
							$('#payment-address .checkout-content').slideUp('fast');
                            $('.checkout-content').slideUp('fast');
                            $('#shipping-method .checkout-content').slideDown('fast');
                            $('#checkout .checkout-heading a').remove();
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();
                            $('#shipping-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');									
                            $('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	

							$.ajax({
								url: 'index.php?route=checkout/shipping_address',
								dataType: 'html',
								success: function(html) {
									$('#shipping-address .checkout-content').html(html);
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});	
				} else {
					$.ajax({
						url: 'index.php?route=checkout/shipping_address',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							$('#payment-address .checkout-content').slideUp('fast');
							$('#shipping-address .checkout-content').slideDown('fast');
							$('#checkout .checkout-heading a').remove();
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();
							$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});		
				}
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						$('#payment-address .checkout-content').slideUp('fast');
						$('#payment-method .checkout-content').slideDown('fast');
						$('#checkout .checkout-heading a').remove();
						$('#payment-address .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn"><span class="glyphicon glyphicon-edit"></span></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
				<?php } ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Payment Address	
$(document).on('click', '#button-payment-address', function() {
    
    // Ensure that radio is really checked. Weird bug! Fix this code.
    $('#payment-existing label').each(function(){
        if($(this).hasClass('active')) {
            $(this).find('input').prop('checked', true);
            return false;
        }
    });
    
    $.ajax({
		url: 'index.php?route=checkout/payment_address/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-address').attr('disabled', true);
            $('#button-payment-address span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-payment-address').attr('disabled', false);
			$('#button-payment-address span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
			$('.has-error').removeClass('has-error');

			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {
				
                var error_messages = '<div class="text-danger"><ul class="list-unstyled">';
                
                if (json['error']['warning']) {
                    error_messages += '<li>' + json['error']['warning'] + '</li>';
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['firstname'] + '</li>';
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['lastname'] + '</li>';
				}	
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['telephone'] + '</li>';
				}		
				
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['company_id'] + '</li>';
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['tax_id'] + '</li>';
				}	
														
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['address_1'] + '</li>';
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['city'] + '</li>';
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['postcode'] + '</li>';
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['country'] + '</li>';
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['zone'] + '</li>';
				}
                
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'checkout-payment-address-error');
                
			} else {
				<?php if ($shipping_required) { ?>
				$.ajax({
					url: 'index.php?route=checkout/shipping_address',
					dataType: 'html',
					success: function(html) {
						$('#shipping-address .checkout-content').html(html);
						$('#payment-address .checkout-content').slideUp('fast');
						$('#shipping-address .checkout-content').slideDown('fast');
						$('#payment-address .checkout-heading a').remove();
						$('#shipping-address .checkout-heading a').remove();
						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
                    },
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						$('#payment-address .checkout-content').slideUp('fast');
						$('#payment-method .checkout-content').slideDown('fast');
						$('#payment-address .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();						
						$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary navbar-btn pull-right btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				<?php } ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	  
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Shipping Address			
$(document).on('click', '#button-shipping-address', function() {

    // Ensure that radio is really checked. Weird bug! Fix this code.
    $('#shipping-existing label').each(function(){
        if($(this).hasClass('active')) {
            $(this).find('input').prop('checked', true);
            return false;
        }
    });
    
    $.ajax({
		url: 'index.php?route=checkout/shipping_address/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address input[type=\'hidden\'], #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-address').attr('disabled', true);
            $('#button-shipping-address span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-shipping-address').attr('disabled', false);
			$('#button-shipping-address span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
			$('.has-error').removeClass('has-error');
			
			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {
				
                var error_messages = '<div class="text-danger"><ul class="list-unstyled">';
                
                if (json['error']['warning']) {
					error_messages += '<li>' + json['error']['warning'] + '</li>';
				}
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['firstname'] + '</li>';
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['lastname'] + '</li>';
				}	
				
				if (json['error']['email']) {
					$('#shipping-address input[name=\'email\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['email'] + '</li>';
				}
				
				if (json['error']['telephone']) {
					$('#shipping-address input[name=\'telephone\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['telephone'] + '</li>';
				}		
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['address_1'] + '</li>';
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['city'] + '</li>';
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['postcode'] + '</li>';
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['country'] + '</li>';
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['zone'] + '</li>';
				}
                
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'checkout-shipping-address-error');
                
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						$('#shipping-address .checkout-content').slideUp('fast');
						$('#shipping-method .checkout-content').slideDown('fast');
						$('#shipping-address .checkout-heading a').remove();
						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#shipping-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary navbar-btn pull-right btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');							
						
						$.ajax({
							url: 'index.php?route=checkout/shipping_address',
							dataType: 'html',
							success: function(html) {
								$('#shipping-address .checkout-content').html(html);
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest
$(document).on('click', '#button-guest', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest').attr('disabled', true);
            $('#button-guest span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-guest').attr('disabled', false); 
			$('#button-guest span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {

            $('.has-error').removeClass('has-error');
			
			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {
				
                var error_messages = '<div class="text-danger"><ul class="list-unstyled">';
                if (json['error']['warning']) {
                   error_messages += '<li>' + json['error']['warning'] + '</li>';
				}

				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').closest('.form-group').addClass('has-error'); 
                   error_messages += '<li>' + json['error']['firstname'] + '</li>';
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['lastname'] + '</li>';
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['email'] + '</li>';
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['telephone'] + '</li>';
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['company_id'] + '</li>';
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['tax_id'] + '</li>';
				}

				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['address_1'] + '</li>';
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['city'] + '</li>';
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['postcode'] + '</li>';
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['country'] + '</li>';
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['zone'] + '</li>';
				}
                
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'guest-checkout-error'); 
			}
            else {
				<?php if ($shipping_required) { ?>
				if ($('#payment-address input[name=\'shipping_address\']').is(':checked')) {
                    $.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
							$('#shipping-method .checkout-content').html(html);
                            $('.checkout-content').slideUp('fast');
							$('#shipping-method .checkout-content').slideDown('fast');
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();
							$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
							$('#shipping-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');									

							$.ajax({
								url: 'index.php?route=checkout/guest_shipping',
								dataType: 'html',
								success: function(html) {
									$('#shipping-address .checkout-content').html(html);
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});					
				}
                else {
                    $.ajax({
						url: 'index.php?route=checkout/guest_shipping',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							$('#payment-address .checkout-content').slideUp('fast');
							$('#shipping-address .checkout-content').slideDown('fast');
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();
							$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
				<?php } else { ?>				
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						$('#payment-address .checkout-content').slideUp('fast');
						$('#payment-method .checkout-content').slideDown('fast');
						$('#payment-address .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn"><span class="glyphicon glyphicon-edit"></span></a>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
				<?php } ?>
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest Shipping
$(document).on('click', '#button-guest-shipping', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest_shipping/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address select, #shipping-address input[type=\'hidden\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest-shipping').attr('disabled', true);
			$('#button-guest-shipping span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-guest-shipping').attr('disabled', false); 
			$('#button-guest-shipping span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
			$('.has-error').removeClass('has-error');
			
			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {

                var error_messages = '<div class="text-danger"><ul class="list-unstyled">';

                if (json['error']['warning']) {
                    error_messages += '<li>' + json['error']['warning'] + '</li>';
				}

				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['firstname'] + '</li>';
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['lastname'] + '</li>';
				}

				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['address_1'] + '</li>';
				}
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['city'] + '</li>';
				}
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['postcode'] + '</li>';
				}

				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['country'] + '</li>';
				}
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['zone'] + '</li>';
				}

                error_messages += '</ul></div>';
                modalBuild(error_messages, 'guest-shipping-address-errors');
			}
            else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						$('#shipping-address .checkout-content').slideUp('fast');
						$('#shipping-method .checkout-content').slideDown('fast');
						$('#shipping-address .checkout-heading a').remove();
						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#shipping-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$(document).on('click', '#button-shipping-method', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method input[type=\'hidden\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
            $('#button-shipping-method span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
			$('#button-shipping-method span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
			$('.warning, .error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {
				var error_messages = '<div class="text-danger"><ul class="list-unstyled">';
                if (json['error']['warning']) {
                    error_messages += '<li>' + json['error']['warning'] + '</li>';
				}
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'shipping-method-errors');                
			}
            else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						$('#shipping-method .checkout-content').slideUp('fast');
						$('#payment-method .checkout-content').slideDown('fast');
						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						$('#shipping-method .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$(document).on('click', '#button-payment-method', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
            $('#button-payment-method span').attr('class', 'glyphicon glyphicon-refresh glyphicon-spin');
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
			$('#button-payment-method span').attr('class', 'glyphicon glyphicon-chevron-down');
		},			
		success: function(json) {
			$('.warning, .error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
            else if (json['error']) {
				var error_messages = '<div class="text-danger"><ul class="list-unstyled">';
                if (json['error']['warning']) {
                    error_messages += '<li>' + json['error']['warning'] + '</li>';
				}
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'payment-method-errors');
			}
            else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
						$('#confirm .checkout-content').html(html);
						$('#payment-method .checkout-content').slideUp('fast');
						$('#confirm .checkout-content').slideDown('fast');
						$('#payment-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

function quickConfirm(module){
	$.ajax({
		url: 'index.php?route=checkout/confirm',
		dataType: 'html',
		success: function(html) {
			$('#confirm .checkout-content').html(html);
			$('#confirm .checkout-content').slideDown('fast');
			$('.checkout-heading a').remove();
			$('#checkout .checkout-heading a').remove();
			$('#checkout .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
			$('#shipping-address .checkout-heading a').remove();
			$('#shipping-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
			$('#shipping-method .checkout-heading a').remove();
			$('#shipping-method .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
			$('#payment-address .checkout-heading a').remove();			
			$('#payment-address .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
			$('#payment-method .checkout-heading a').remove();
			$('#payment-method .checkout-heading').append('<a title="<?php echo $text_modify; ?>" class="btn btn-primary pull-right navbar-btn btn-sm"><span class="glyphicon glyphicon-edit"></span></a>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
}
//--></script> 
<?php echo $footer; ?>
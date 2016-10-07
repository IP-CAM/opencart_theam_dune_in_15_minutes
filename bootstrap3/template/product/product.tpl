<?php echo $header; ?>
<?php echo $column_left; ?>
<?php $compare_products = isset($this->session->data['compare']) ? array_flip((array) $this->session->data['compare']) : array();?>
<?php $wishlist_products = isset($this->session->data['wishlist']) ? array_flip((array) $this->session->data['wishlist']) : array();?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content" itemscope itemtype="http://data-vocabulary.org/Product">
    <?php echo $content_top; ?>
    <?php $breadcrumbs_category = array();?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php $breadcrumbs_category[] = $breadcrumb['text'];?>
      <?php } ?>
    </ol>
    <?php unset($breadcrumbs_category[0]); if($breadcrumbs_category) { ?>
      <meta itemprop="category" content="<?php echo implode(' > ', $breadcrumbs_category); ?>"/>
    <?php } ?>
    <div class="product-info row">
      <?php if ($thumb || $images) { ?>
      <div class="left col-md-4">
        <div id="product-carousel" class="carousel slide">
          <div class="carousel-inner" role="listbox">
            <?php if ($thumb) { ?>
            <div class="item active">
              <a href="<?php echo $popup; ?>"><img itemprop="image" id="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
            </div>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <div class="item">
              <a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
            </div>
            <?php } ?>
            <?php } ?>
          </div>
          <?php if ($images) { ?>
          <a class="left carousel-control" href="#product-carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#product-carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          <?php } ?>
        </div>
        <?php if (count($images) > 1) { ?>
        <div class="carousel-buttons h4">
          <button class="btn btn-default btn-sm" data-action="cycle"><span class="glyphicon glyphicon-play"></span></button>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="right col-md-8" itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
        <h1 class="h2" itemprop="name"><?php echo $heading_title; ?></h1>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><span itemprop="brand"><?php echo $manufacturer; ?></span></a>
        <hr/>
        <?php echo $stock; ?><br/>
        <span class="small"><?php echo $text_model; ?></span> <span class="model small" itemprop="identifier" content="<?php echo $model; ?>"><?php echo $model; ?></span>
        <?php if ($review_status) { ?>
        <div itemprop="review" itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
          <?php if ($rating) { ?>
          <span itemprop="rating" class="hide"><?php echo $rating; ?></span>
          <img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;&nbsp;
          <a href="#" class="review-link"><span itemprop="count"><?php echo $reviews; ?></span></a>
        <?php } else { ?>
          <a href="#" class="review-link"><?php echo $text_write; ?></a>
        <?php }?>
        </div>
        <?php } ?>
        <div id="price" class="price h3">
          <?php if (isset($this->session->data['currency'])) { ?>
          <meta itemprop="priceCurrency" content="<?php echo $this->session->data['currency']; ?>"/>
          <?php } ?>
          <?php if (!$special) { ?>
          <strong><?php echo $price; ?></strong>
          <meta itemprop="price" content="<?php preg_match_all('!\d+\.*\d*!', $price ,$match); echo $match[0][0]; ?>"/>
          <?php } else { ?>
          <span class="price-old"><?php echo $price; ?></span> <strong><span class="price-new"><?php echo $special; ?></span></strong>
          <meta itemprop="price" content="<?php preg_match_all('!\d+\.*\d*!', $special ,$match); echo $match[0][0]; ?>"/>
          <?php } ?>
          <?php if ($tax) { ?>
          <span class="price-tax">(<?php echo $text_tax; ?> <?php echo $tax; ?>)</span>
          <?php } ?>
        
          <?php if ($points) { ?>
          <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
          <?php } ?>
          <?php if ($discounts) { ?>
          <br />
          <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
          </div>
          <?php } ?>
        </div>
        <div class="description trimmed" itemprop="description"><?php echo $description; ?></div>
        <?php if ($profiles): ?>
        <div class="option">
          <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
          <select name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <span id="profile-description"></span>
        </div>
        <?php endif; ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><?php echo $text_option; ?></h3>
          </div>
          <div class="panel-body">
            <?php if ($options) { ?>
            <!-- Options -->
            <div class="options form-horizontal">
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option form-group">
                <label class="control-label col-sm-2">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>          
                <?php echo $option['name']; ?>:</label>
                <div class="col-sm-4">
                  <select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                     (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                     <?php } ?>
                    </option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
                <br />
                <?php } ?>
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
                <br />
                <?php } ?>
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'image') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <table class="option-image">
                  <?php foreach ($option['option_value'] as $option_value) { ?>
                  <tr>
                    <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                    <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                    <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label></td>
                  </tr>
                  <?php } ?>
                </table>
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>">
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date">
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime">
              </div>
              <br />
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                <?php if ($option['required']) { ?>
                <span class="required">*</span>
                <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time">
              </div>
              <br />
              <?php } ?>
              <?php } ?>
            </div>
            <!-- End options -->
            <?php } ?>
          </div>
          <div class="panel-footer clearfix">
            <div class="row">
              <div class="cart btn-group col-md-3">
                <div class="input-group">
                  <input class="form-control" type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                  <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                  <span class="input-group-btn"><button id="button-cart" class="button btn btn-success"><?php echo $button_cart; ?></button></span>
                </div>
                <?php if ($minimum > 1) { ?>
                <div class="minimum"><?php echo $text_minimum; ?></div>
                <?php } ?>
              </div>
              <div class="btn-group col-md-9">
                <div class="pull-right">
                  <button id="wishlist-button-<?php echo $product_id; ?>" onclick="addToWishList('<?php echo $product_id; ?>');" class="btn btn-default wishlist btn-sm<?php echo isset($wishlist_products[$product_id]) ? ' active' : ''; ?>" role="button"><?php echo $button_wishlist; ?> <span class="glyphicon glyphicon-star"></span></button>
                  <button id="compare-button-<?php echo $product_id; ?>" onclick="addToCompare('<?php echo $product_id; ?>');" class="btn btn-default compare btn-sm<?php echo isset($compare_products[$product_id]) ? ' active' : ''; ?>" role="button"><?php echo $button_compare; ?> <span class="glyphicon glyphicon-stats"></span></button>
                  <button onclick="openSharePopup();" class="btn share btn-default btn-sm" role="button"><?php echo $text_share; ?> <span class="glyphicon glyphicon-share"></span></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
      <?php if ($attribute_groups) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading-attribute">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse-attribute" aria-expanded="false" aria-controls="collapse-attribute">
              <?php echo $tab_attribute; ?>
            </a>
          </h4>
        </div>
        <div id="collapse-attribute" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-attribute">
          <div class="panel-body">
            <table class="attribute">
              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <thead>
                <tr>
                  <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <tr>
                  <td><?php echo $attribute['name']; ?></td>
                  <td><?php echo $attribute['text']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
              <?php } ?>
            </table>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($review_status) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading-review">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse-review" aria-expanded="false" aria-controls="collapse-review">
            <?php echo $tab_review; ?>
            </a>
          </h4>
        </div>
        <div id="collapse-review" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-review">
          <div class="panel-body"><div id="review"></div></div>
          <div class="panel-footer">
            <h5 id="review-title"><?php echo $text_write; ?></h5>
            <div class="form-horizontal">
              <div class="form-group">
                <div class="col-sm-10">
                  <span class="glyphicon glyphicon-thumbs-down" title="<?php echo $entry_bad; ?>"></span>
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-default"><input type="radio" name="rating" value="1" autocomplete="off">1</label>
                    <label class="btn btn-default"><input type="radio" name="rating" value="2" autocomplete="off">2</label>
                    <label class="btn btn-default"><input type="radio" name="rating" value="3" autocomplete="off">3</label>
                    <label class="btn btn-default"><input type="radio" name="rating" value="4" autocomplete="off">4</label>
                    <label class="btn btn-default"><input type="radio" name="rating" value="5" autocomplete="off">5</label>
                  </div>
                  <span class="glyphicon glyphicon-thumbs-up" title="<?php echo $entry_good; ?>"></span>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-4">
                  <input class="form-control" type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>" />
                  <div class="hide"><label>Homepage or site URL</label><input id="homepage" type="text" name="homepage" value="" /></div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-6">
                  <textarea class="form-control" name="text" cols="40" rows="4" placeholder="<?php echo $entry_review; ?>"></textarea><br />
                </div>
              </div>
            </div>
            <div class="buttons">
              <div class="right"><a id="button-review" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading-products">
          <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse-products" aria-expanded="false" aria-controls="collapse-products">
              <?php echo $tab_related; ?> (<?php echo count($products); ?>)
            </a>
          </h4>
        </div>
        <div id="collapse-products" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-products">
          <div class="panel-body">
            <div class="box-product">
              <?php foreach ($products as $product) { ?>
              <div>
                <?php if ($product['thumb']) { ?>
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                <?php } ?>
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                <?php } ?>
                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$(document).ready(function() {
    $('#product-carousel').carousel({
        interval:false,
        pause:'hover',
    });

    $(document).on('click', '.carousel-buttons button', function() {
        var action = $(this).attr('data-action');
        if(action == 'cycle') {
          $('#product-carousel').data('bs.carousel').options.interval=1500;
          $(this).html('<span class="glyphicon glyphicon-pause"></span>').attr('data-action', 'pause');
        }
        else {
          $(this).html('<span class="glyphicon glyphicon-play"></span>');
          $(this).attr('data-action', 'cycle');
        }
        
        $('#product-carousel').carousel(action);
    });
    
    $('a.review-link').click(function(){
        if(!$('#collapse-review').hasClass('in')) {
            $('a[href=\'#collapse-review\']').trigger('click');
        }
        return false;
    });
    
    var activityIndicatorOn = function(){
        $( '<div id="imagelightbox-loading"><div></div></div>' ).appendTo( 'body' );
        $('#product-carousel').carousel('pause');
    },
    activityIndicatorOff = function() {
        $( '#imagelightbox-loading' ).remove();
    },
    overlayOn = function() {
        $( '<div id="imagelightbox-overlay"></div>' ).appendTo( 'body' );
    },
    overlayOff = function() {
        $( '#imagelightbox-overlay' ).remove();
    },
    closeButtonOn = function( instance ){
        $( '<button type="button" id="imagelightbox-close" title="Close"></button>' ).appendTo( 'body' ).on( 'click touchend', function(){ $( this ).remove(); instance.quitImageLightbox(); return false; });
    },
    closeButtonOff = function(){
        $( '#imagelightbox-close' ).remove();
    };
    
    $('.carousel .item a').imageLightbox({
        onStart: 	 function() {overlayOn();},
        onEnd:	 	 function() {overlayOff(); activityIndicatorOff();},
        onLoadStart: function() {activityIndicatorOn();},
        onLoadEnd:	 function() {activityIndicatorOff();}
    });
});
//--></script> 
<script type="text/javascript"><!--
$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
	
    $('.options .form-group.has-error').removeClass('has-error');

    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
                var error_messages = '<div class="alert alert-danger"><ul class="list-unstyled">';
				if (json['error']['option']) {
					for (i in json['error']['option']) {
                       $('#option-' + i).addClass('has-error');
                       error_messages += '<li>' + json['error']['option'][i] + '</li>';
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').closest('.form-group').addClass('has-error');
                    error_messages += '<li>' + json['error']['profile'] + '</li>';
                }
                
                error_messages += '</ul></div>';
                modalBuild(error_messages, 'cart-add-errors');  
			} 
			
			if (json['success']) {
                $('#cart').load('index.php?route=module/cart #cart > *');
                
                var html = '<div class="row">';
                    html += '<div class="image col-md-4">';
                    html += '<img class="img-responsive" width="100" src="' + $('.carousel .item.active img').attr('src') + '" />';
                    html += '</div>';
                    html += '<div class="body col-md-8">';
                    html += '<p class="h5">' + $('h1').text() + '</p>';
                    html += '<p class="h5">' + $('#price').html() + '</p>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="modal-footer row">';
                    html += '<div class="cart col-md-6">';
                    html += '<a href="<?php echo $text_cart_url; ?>" class="btn btn-primary"><?php echo $text_cart; ?></a>';
                    html += '</div>';
                    
                    html += '<div class="cart col-md-6">';
                    html += '<a href="<?php echo $text_checkout_url; ?>" class="btn btn-success"><?php echo $text_checkout; ?></a>';
                    html += '</div>';
                    html += '</div>';

                modalBuild(html, 'cart-added', '<?php echo $text_added_to_cart; ?>');
			}	
		}
	});
});
//--></script>

<script type="text/javascript"><!--
$(document).on('click', '#review .pagination a', function() {
	$('#review').load(this.href);
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&homepage=' + encodeURIComponent($('input[name=\'homepage\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning alert alert-warning alert-dismissible">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success alert alert-success alert-dismissible">' + data['success'] + '</div>');
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'homepage\']').val('');
			}
		}
	});
});
//--></script>
<script type="text/javascript" src="catalog/view/theme/bootstrap/js/imagelightbox.js"></script>
<?php echo $footer; ?>
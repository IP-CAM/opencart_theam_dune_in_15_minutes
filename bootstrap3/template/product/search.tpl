<?php echo $header; ?>
<?php echo $column_left; ?>
<?php $compare_products = isset($this->session->data['compare']) ? array_flip((array) $this->session->data['compare']) : array();?>
<?php $wishlist_products = isset($this->session->data['wishlist']) ? array_flip((array) $this->session->data['wishlist']) : array();?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#search-filter">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div class="collapse navbar-collapse" id="search-filter">
            <div class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <input type="text" name="search" class="form-control" value="<?php echo $search; ?>"/>
              </div>
            </div>
            <div class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <select name="category_id" class="form-control">
                  <option value="0"><?php echo $text_category; ?></option>
                  <?php foreach ($categories as $category_1) { ?>
                  <?php if ($category_1['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_1['children'] as $category_2) { ?>
                  <?php if ($category_2['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option><?php } else { ?>
                  <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_2['children'] as $category_3) { ?>
                  <?php if ($category_3['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <div class="btn-group" data-toggle="buttons">
                  <label class="btn btn-default<?php echo $sub_category ? ' active' : ''; ?>">
                  <input type="checkbox" name="sub_category" value="1" id="sub_category"<?php echo $sub_category ? ' checked="checked"' : '';?>/>
                  <?php echo $text_sub_category; ?>
                  </label>
                </div>
              </div>
            </div>
            <div class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <div class="btn-group" data-toggle="buttons">
                  <label for="description" class="btn btn-default<?php echo $description ? ' active' : ''; ?>">
                    <input type="checkbox" name="description" value="1" id="description"<?php echo $description ? ' checked="checked"' : ''; ?>/>
                    <?php echo $entry_description; ?>
                  </label>
                </div>
              </div>
            </div>
            <div class="navbar-form navbar-right" role="search">
              <div class="form-group">
                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button btn btn-primary" />
              </div>
            </div>
          </div>
        </div>
      </nav>
      <?php if ($products) { ?>
      <h4><?php echo $text_search; ?></h4>
      <div class="product-filter">
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <div id="product-filter">
              <div class="navbar-form navbar-left" role="search">
                <div class="form-group">
                  <?php echo $text_sort; ?>
                  <select onchange="location = this.value;" class="form-control">
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                  <?php } ?>
                  </select>
                </div>
              </div>
              <div class="compare navbar-form navbar-left<?php echo (count($compare_products) < 2 ? ' hide' : '');?>" role="search">
                <div class="form-group">
                  <div class="product-compare btn btn-default"><span class="glyphicon glyphicon-stats"></span> <a rel="nofollow" href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
                </div>
              </div>
              <div class="navbar-form navbar-right" role="search">
                <div class="form-group clearfix">
                  <div class="btn-group" role="group">
                    <?php echo $pagination; ?>
                  </div>
                </div>
              </div>
              <div class="navbar-form navbar-right hidden-xs" role="search">
                <div class="form-group clearfix">
                  <div class="display btn-group" role="group">
                    <button data-display="list" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span></button>
                    <button data-display="grid" type="button" class="btn btn-default"><span class="glyphicon glyphicon-th-large"></span></button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
      <div class="product-list row">
        <?php foreach ($products as $product) { ?>
        <div class="product col-md-12">
          <div class="thumbnail">
            <?php if ($product['thumb']) { ?>
            <div class="image img-responsive">
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name'];?>"/></a>
            </div>
            <?php } else {?>
            <?php $thumbnail_height = $this->config->get('config_image_product_height'); $thumbnail_width = $this->config->get('config_image_product_width'); ?>
            <div class="image placeholder" style="position:relative;height:<?php echo $thumbnail_height;?>px;max-width:100%;">
              <div class="glyphicon glyphicon-eye-close" style="text-align:center;color:#ddd;margin:auto;position:absolute;top:0;left:0;bottom:0;right:0;height:<?php echo ($thumbnail_height / 2); ?>px;width:<?php echo ($thumbnail_width / 2); ?>px;font-size:<?php echo ($thumbnail_height / 2); ?>px;"></div>
            </div>
            <?php } ?>
            <div class="caption">
              <div class="title">
                <div>
                  <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                </div>
              </div>
              <p class="description clearfix"><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <p class="rating clearfix"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>"/></p>
              <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price h4">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <div class="buttons clearfix btn-group btn-group-sm">
                  <a id="wishlist-button-<?php echo $product['product_id']; ?>" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-default btn-sm wishlist<?php echo isset($wishlist_products[$product['product_id']]) ? ' active' : ''; ?>"><span class="glyphicon glyphicon-star"></span></a>
                  <a id="compare-button-<?php echo $product['product_id']; ?>" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-default btn-sm compare<?php echo isset($compare_products[$product['product_id']]) ? ' active' : ''; ?>"><span class="glyphicon glyphicon-stats"></span></a>
                </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="pagination-wrapper clearfix">
        <div class="pagination pager-top pull-right"><?php echo $pagination; ?></div>
      </div>
      <?php } else { ?>
      <div class="content"><p><?php echo $text_empty; ?></p></div>
      <?php }?>
      <?php echo $content_bottom; ?>
    </div>
  </div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$(document).on('click', '.display button', function(){
    display($(this).attr('data-display'));
});

function display(view) {
    if (view == 'list') {
		$('.product-grid').attr('class', 'product-list row');
        $('.product-list .product').each(function(index, element) {   
          $(element).attr('class', 'product col-md-12');
          $(element).find('.description').show();
          $(element).find('.title').removeClass('ellipsis');
          $(element).find('.thumbnail').attr('class', 'row');
		  $(element).find('.image').addClass('col-md-3');
          $(element).find('.caption').addClass('col-md-6').after('<div class="right col-md-3"></div>');
          var right = $(element).find('.right');
          $(element).find('.caption .price').appendTo(right);
          $(element).find('.caption .rating').appendTo(right);
          $(element).find('.caption .buttons').appendTo(right);
        });
		
        var buttons = '<div class="btn-group pull-right" role="group">';
            buttons += '<button type="button" data-display="list" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span></button>';
            buttons += '<button type="button" data-display="grid" class="btn btn-default"><span class="glyphicon glyphicon-th-large"></span></button>';
            buttons += '</div>';
        
        $('.display').html(buttons);
        $.totalStorage('display', 'list'); 
        
	} else {
		$('.product-list').attr('class', 'product-grid row');
		$('.product-grid .product').each(function(index, element) {
          $(element).attr('class', 'product col-xs-18 col-sm-4 col-md-3');
          $(element).find('.title').addClass('ellipsis');
          $(element).find('.row').attr('class', 'thumbnail');
          $(element).find('.image').removeClass('col-md-3');
          var caption =  $(element).find('.caption');        
          caption.removeClass('col-md-6');
          $(element).find('.description').hide();
          $(element).find('.right .rating').appendTo(caption);
          $(element).find('.right .price').appendTo(caption);
          $(element).find('.right .buttons').appendTo(caption);
          $(element).find('.right').remove();
        });
        var buttons = '<div class="btn-group pull-right" role="group">';
            buttons += '<button type="button" data-display="list" class="btn btn-default"><span class="glyphicon glyphicon-list"></span></button>';
            buttons += '<button type="button" data-display="grid" class="btn btn-primary"><span class="glyphicon glyphicon-th-large"></span></button>';
            buttons += '</div>';
        
        $('.display').html(buttons);
        $.totalStorage('display', 'grid'); 
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}

$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('checked', false);
        $('input[name=\'sub_category\']').closest('label').addClass('disabled');
	} else {
        $('input[name=\'sub_category\']').closest('label').removeClass('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').val();
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').val();
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').val();
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').val();
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

//--></script> 
<?php echo $footer; ?>
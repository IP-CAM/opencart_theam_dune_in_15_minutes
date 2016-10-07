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
    <?php if (!empty($manufacturer_image) && !empty($manufacturer_description)) { ?>
    <div class="manufacturer-info row navbar">
      <?php if (!empty($manufacturer_image)) { ?>
      <div class="image col-md-2 col-sm-4 col-xs-6">
        <img class="img-responsive" src="image/<?php echo $manufacturer_image; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"/>
      </div>
      <?php } ?>
      <?php if ($manufacturer_description) { ?>
      <?php $class = !empty($manufacturer_image) ? ' col-md-10 col-sm-8 col-xs-12' : ' col-md-12'; ?>
      <div class="description<?php echo $class; ?>"><?php echo $manufacturer_description; ?></div>
      <?php } ?>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
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
              <a id="wishlist-button-<?php echo $product['product_id']; ?>" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-default wishlist<?php echo isset($wishlist_products[$product['product_id']]) ? ' active' : ''; ?>"><span class="glyphicon glyphicon-star"></span></a>
              <a id="compare-button-<?php echo $product['product_id']; ?>" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-default compare<?php echo isset($compare_products[$product['product_id']]) ? ' active' : ''; ?>"><span class="glyphicon glyphicon-stats"></span></a>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php } else { ?>
    <div class="content"><p><?php echo $text_empty; ?></p></div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php }?>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$(document).ready(function() {
    $(document).on('click', '.display button', function(){
      display($(this).attr('data-display'));
    });
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
//--></script> 
<?php echo $footer; ?>
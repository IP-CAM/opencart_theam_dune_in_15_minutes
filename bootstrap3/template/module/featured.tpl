<?php $compare_products = isset($this->session->data['compare']) ? array_flip((array) $this->session->data['compare']) : array();?>
<?php $wishlist_products = isset($this->session->data['wishlist']) ? array_flip((array) $this->session->data['wishlist']) : array();?>
<div class="box featured">
  <h2 class="box-heading"><?php echo $heading_title; ?></h2>
  <div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="col-sm-3">
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
              <div class="title ellipsis">
                <div>
                  <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                </div>
              </div>
              <?php if (!empty($product['rating'])) { ?>
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
</div>







<?php
    $products_count = 0;
    if(!empty($products)) {
        foreach($products as $product) {
            if(isset($product['quantity'])) {
                $products_count += (int)$product['quantity'];
            }
        }
    }
?>
<div id="cart" class="btn btn-default">
  <?php if ($products_count || $vouchers) { ?>
  <a  rel="nofollow" href="<?php echo $cart;?>"><?php echo $text_cart;?> <span id="cart-total">(<?php echo($products_count); ?>)</span></a>
  <div class="content hide">
    <h4><?php echo $heading_title; ?></h4>
    <?php
      $cart_limit = 3;
      $limited_products = array_slice($products, 0, $cart_limit);
      $more_items = $products_count - count($limited_products);
    ?>
    <div class="mini-cart-info">
      <?php foreach($limited_products as $product) { ?>
      <div class="media">
        <?php if ($product['thumb']) { ?>
        <a class="media-left media-middle" href="<?php echo $product['href']; ?>">
          <img class="image img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
        </a>
        <?php } ?>
        <div class="media-body">
          <a class="media-heading" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br/>
            <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
            <?php } ?>
          <span class="quantity">&nbsp;x&nbsp;<?php echo $product['quantity']; ?></span>
        </div>
      </div>
      <hr/>
      <?php } ?>
    </div>
    <?php if ($more_items > 0) { ?>
    <div class="more text-right h5">
      <?php echo sprintf($text_cart_more_items, $cart_limit, $products_count, $cart); ?>
    </div>
    <?php } ?>
    <div class="mini-cart-total">
      <ul class="totals list-unstyled h5" >
        <?php foreach ($totals as $total) { ?>
        <li><span class="title"><?php echo $total['title']; ?>: </span><span class="text"><?php echo $total['text']; ?></span></li>
        <?php } ?>
      </ul>
    </div>
    <div class="mini-cart-footer modal-footer clearfix">
      <a class="cart btn btn-primary pull-left" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
      <a class="checkout btn btn-success pull-right" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
    </div>
  </div>
  <?php } else { ?>
  <div class="empty"><?php echo $text_empty; ?></div>
  <?php } ?>
</div>
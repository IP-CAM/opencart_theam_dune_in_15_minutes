<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($success) { ?>
  <div class="success alert alert-success alert-dismissible" role="alert"><?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <?php if ($products) { ?>
    <div class="table-responsive">
      <table class="compare-info table table-hover table-condensed">
        <tbody>
          <tr class="product">
            <td></td>
            <?php foreach ($products as $product) { ?>
            <td>
              <div class="wrapper">
                <div class="buttons clearfix">
                  <a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" class="button remove btn btn-default btn-sm pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                </div>
                <?php if ($products[$product['product_id']]['thumb']) { ?>
                <div class="image">
                  <a href="<?php echo $products[$product['product_id']]['href']; ?>">
                    <img class="img-responsive" src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                  </a>
                </div>
                <?php } ?>
                <p class="name ellipsis">
                  <a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a>
                </p>

              </div>
            </td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_price; ?></td>
            <?php foreach ($products as $product) { ?>
            <td>
              <?php if ($products[$product['product_id']]['price']) { ?>
              <?php if (!$products[$product['product_id']]['special']) { ?>
              <?php echo $products[$product['product_id']]['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
              <?php } ?>
              <?php } ?>
            </td>
          <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_manufacturer; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td><?php echo $text_availability; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><?php echo $products[$product['product_id']]['availability']; ?></td>
            <?php } ?>
          </tr>
          <?php if ($review_status) { ?>
          <tr>
            <td><?php echo $text_rating; ?></td>
            <?php foreach ($products as $product) { ?>
            <td><img src="catalog/view/theme/default/image/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /></td>
            <?php } ?>
          </tr>
          <?php } ?>
    

    
    <?php foreach ($attribute_groups as $attribute_group) { ?>
    
      <tr>
        <td>
          <?php echo $attribute_group['name']; ?>
        </td>
      </tr>    
    
    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
        <?php foreach ($products as $product) { ?>
        <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
        
        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
        <?php } else { ?>
        <td></td>
        <?php } ?>
        <?php } ?>
      <tr>
        <td><?php echo $attribute['name']; ?></td>
        <?php foreach ($products as $product) { ?>
        <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
        <?php } else { ?>
        <td></td>
        <?php } ?>
        <?php } ?>
      </tr>
    <?php } ?>
    <?php } ?>
    
    </tbody>

  </table>
  </div>
  
  <hr/>

  <?php } else { ?>
  <div class="content"><p><?php echo $text_empty; ?></p></div>
  <?php } ?>
  
  <div class="buttons nav navbar clearbox">
    <div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  
  <?php echo $content_bottom; ?></div></div>
  <?php echo $column_right; ?>
  <?php echo $footer; ?>
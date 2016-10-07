<?php if (!isset($redirect)) { ?>
<div class="checkout-product tbl-responsive">
  <table class="table table-hover table-condensed">
    <thead>
      <tr>
        <th class="name"><?php echo $column_name; ?></th>
        <th class="price"><?php echo $column_price; ?></th>
        <th class="quantity"><?php echo $column_quantity; ?></th>
        <th class="total"><?php echo $column_total; ?></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name">
          <?php echo $product['name']; ?><br />
          <?php foreach ($product['option'] as $option) { ?>
          - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
          <?php } ?>
          <?php if(!empty($product['recurring'])): ?>
          - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
          <?php endif; ?>
          - <small><?php echo $column_model; ?>: <span><?php echo $product['model']; ?></span></small>  
        </td>
        <td data-title="<?php echo $column_price; ?>" class="price"><?php echo $product['price']; ?></td>
        <td data-title="<?php echo $column_quantity; ?>" class="quantity"><?php echo $product['quantity']; ?></td>
        <td data-title="<?php echo $column_total; ?>" class="total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="3" class="left text-right"><?php echo $total['title']; ?></td>
        <td class="right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<div class="payment nav navbar text-center clearfix"><?php echo $payment; ?></div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>
<script type="text/javascript"><!--
    $('#button-confirm').addClass('btn btn-success');
//--></script>
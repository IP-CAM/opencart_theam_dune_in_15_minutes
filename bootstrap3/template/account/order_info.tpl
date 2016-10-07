<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb hidden-print">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <script type="text/javascript" src="catalog/view/theme/bootstrap/js/printthis.js"></script>
    <div class="hidden-print hidden-xs hidden-sm clearfix">
      <a onclick="$('#order-info').printThis();" class="button btn btn-default pull-right"><span class="glyphicon glyphicon-print"></span></a>
    </div>
    <div id="order-info">
      <div class="row">
        <div class="col-md-6">
          <ul class="list-unstyled">
            <li><em><?php echo $this->config->get('config_name'); ?></em></li>
            <li><em><?php echo $this->config->get('config_title'); ?></em></li>
            <li><em><?php echo $this->config->get('config_address'); ?></em></li>
            <li><em><?php echo $this->config->get('config_email'); ?></em></li>
            <li><em><?php echo $this->config->get('config_telephone'); ?></em></li>
          </ul>
        </div>
        <div class="col-md-6">
          <div class="summary">
            <h1><?php echo $heading_title; ?> #<?php echo $order_id; ?> <small>(<?php echo $date_added; ?>)</small></h1>
            <ul class="list-unstyled">
            <?php if ($invoice_no) { ?>
              <li><?php echo $text_invoice_no; ?> <?php echo $invoice_no; ?></li>
            <?php } ?>
            <?php if ($payment_method) { ?>
              <li><?php echo $text_payment_method; ?> <?php echo $payment_method; ?></li>
            <?php } ?>
            <?php if ($shipping_method) { ?>
              <li><?php echo $text_shipping_method; ?> <?php echo $shipping_method; ?></li>
            <?php } ?>
            </ul>
          </div>
        </div>
      </div>
      <hr />
      <div class="row">
        <div class="col-md-6">
          <h4><?php echo $text_payment_address; ?></h4>
          <?php echo $payment_address; ?>
        </div>
        <?php if ($shipping_address) { ?>
        <div class="col-md-6">
          <h4><?php echo $text_shipping_address; ?></h4>
          <?php echo $shipping_address; ?>
        </div>
        <?php } ?>
      </div>
      <hr />
      <div class="tbl-responsive">
        <table class="list table table-striped table-condensed">
          <thead>
            <tr>
              <th colspan="2"><?php echo $column_name; ?></th>
              <th><?php echo $column_quantity; ?></th>
              <th><?php echo $column_price; ?></th>
              <th><?php echo $column_total; ?></th>
            </tr>
          </thead>
          <tbody>
          <?php foreach ($products as $product) { ?>
            <tr>
              <td><?php echo $product['name']; ?>
              <?php foreach ($product['option'] as $option) { ?>
                <br />&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
              <?php } ?>
                <div class="model small"><?php echo $column_model; ?> <span><?php echo $product['model']; ?></span></div>
              </td>
              <td class="hidden-print">
                <a class="btn btn-default" title="<?php echo $button_return; ?>" href="<?php echo $product['return']; ?>"><span class="glyphicon glyphicon-transfer"></span></a>
              </td> 
              <td data-title="<?php echo $column_quantity; ?>"><?php echo $product['quantity']; ?></td>
              <td data-title="<?php echo $column_price; ?>"><?php echo $product['price']; ?></td>
              <td data-title="<?php echo $column_total; ?>"><?php echo $product['total']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="tbl-responsive-hide" colspan="3"></td>
              <td class="tbl-responsive-hide"><?php echo $total['title']; ?></td>
              <td data-title="<?php echo $total['title']; ?>"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <div id="comments">
        <?php echo $text_comment; ?>
        <div class="well">
          <?php echo $comment; ?>
        </div>
      </div>
      <?php } ?>
      <?php if ($histories) { ?>
      <a class="hidden-print" data-toggle="collapse" href="#history" aria-expanded="false" aria-controls="history"><?php echo $text_history; ?> <span class="caret"></span></a>
      <div class="collapse hidden-print" id="history">
        <ul class="list-group">
          <?php foreach ($histories as $history) { ?>
          <li class="list-group-item">
            <p class="list-group-item-text">
            <?php echo $history['date_added']; ?> <span class="badge"><?php echo $history['status']; ?></span>
            <p><small><?php echo $history['comment']; ?></small></p>
            </p>
          </li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <hr />
    </div>
    <div class="buttons hidden-print navbar">
      <a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?> 
<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <?php if ($success) { ?>
  <div class="success alert alert-success alert-dismissible" role="alert"><?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  </div>
  <?php } ?>
  <div id="content">
    <?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?><a class="btn btn-default pull-right" href="<?php echo $logout; ?>"><?php echo $text_logout; ?> <span class="glyphicon glyphicon-log-out"></span></a></h1></div>
    <div class="row">
      <div class="col-md-6">
      <div class="account panel panel-default">
        <div class="panel-heading"><span class="glyphicon glyphicon-user"></span> <?php echo $text_my_account; ?></div>
        <div class="content panel-body">
          <ul class="list-unstyled">
            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          </ul>
        </div>
      </div>
      </div>
      <div class="col-md-6">
        <div class="orders panel panel-default">
          <div class="panel-heading"><span class="glyphicon glyphicon-shopping-cart"></span> <?php echo $text_my_orders; ?></div>
          <div class="content panel-body">
            <ul class="list-unstyled">
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <?php if ($reward) { ?>
              <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
              <?php } ?>
              <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
              <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
      <p><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></p>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
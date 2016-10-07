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
    <div class="content">
      <?php if ($products) { ?>
      <div class="wishlist-info row">
        <?php foreach ($products as $product) { ?>
        <div class="col-md-3">
          <div class="panel panel-default">
            <div class="panel-heading clearfix">
              <span class="badge"><?php echo $product['stock']; ?></span>
              <div class="buttons btn-group btn-group-sm pull-right">
                <a title="<?php echo $button_remove; ?>" class="btn btn-default" href="<?php echo $product['remove']; ?>"><span class="glyphicon glyphicon-remove"></span></a>
              </div>
            </div>
            <div class="content panel-body">
              <?php if ($product['thumb']) { ?>
              <a class="media-left" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
              <?php } ?>
              <div class="title ellipsis"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <div class="model ellipsis"><span class="small"><?php echo $column_model; ?>: <?php echo $product['model']; ?></span></div>
              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
    </div>
    <div class="buttons form-inline nav navbar">
      <a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
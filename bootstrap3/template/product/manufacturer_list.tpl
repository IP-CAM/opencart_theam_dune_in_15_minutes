<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="col-md-<?php echo $this::getColumnWidth($column_left, $column_right); ?>">
  <div id="content"><?php echo $content_top; ?>
    <ol class="breadcrumb">
      <?php array_pop($breadcrumbs); foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ol>
    <div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
    <?php if ($categories) { ?>
    <nav>
      <ul class="pagination">
        <?php foreach ($categories as $category) { ?>
        <li><a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
      </ul>
    </nav>
    <?php foreach ($categories as $category) { ?>
    <div class="manufacturer-list row">
      <div class="col-sm-12">
        <div class="manufacturer-heading"><h3><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></h3></div>
        <div class="manufacturer-content row">
          <?php if ($category['manufacturer']) { ?>
          <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
          <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['manufacturer'][$i])) { ?>
          <div class="col-sm-2"><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    <?php } else { ?>
    <div class="content"><p><?php echo $text_empty; ?></p></div>
    <div class="buttons nav navbar clearfix">
      <div class="right pull-right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?>
   </div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>
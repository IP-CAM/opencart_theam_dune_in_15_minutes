<div id="slideshow" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <?php $slide_num = 0; foreach ($banners as $banner) {?>
    
    <div class="<?php echo ($slide_num == 0 ? 'item active' : 'item'); ?>">
    
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <div class="carousel-caption"><?php echo $banner['title']; ?></div>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <div class="carousel-caption"><?php echo $banner['title']; ?></div>
    <?php } ?>    
    
    
    </div>    

    <?php $slide_num++;} ?>
  
  </div>
  
  
  <?php if (count($banners) > 1) { ?>
  <!-- Controls -->
  <a class="left carousel-control" href="#slideshow" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#slideshow" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <?php } ?>
</div>
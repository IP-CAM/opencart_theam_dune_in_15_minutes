<?php if ($modules) { ?>
<div id="column-left" class="<?php echo $this::getLeftColClasses();?>">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?> 

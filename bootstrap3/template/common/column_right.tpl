<?php if ($modules) { ?>
<div id="column-right" class="<?php echo $this::getRightColClasses();?>">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?>

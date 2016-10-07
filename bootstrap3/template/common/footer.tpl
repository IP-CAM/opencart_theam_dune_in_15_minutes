    </div>
      <footer class="footer hidden-print">
        <div class="navbar row">
          <?php if ($informations) { ?>
          <div class="col-md-3">
            <ul class="list-unstyled">
              <?php foreach ($informations as $information) { ?>
              <li><a rel="nofollow" title="<?php echo $information['title']; ?>" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
          <?php } ?>
          <div class="col-md-3">
            <ul class="list-unstyled">
              <li><a rel="nofollow" title="<?php echo $text_contact; ?>" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_return; ?>" href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_sitemap; ?>" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
          </div>
          <div class="col-md-3">
            <ul class="list-unstyled">
              <li><a rel="nofollow" title="<?php echo $text_manufacturer; ?>" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_voucher; ?>" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_special; ?>" href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
          </div>
          <div class="col-md-3">
            <ul class="list-unstyled">
              <li><a rel="nofollow" title="<?php echo $text_account; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_order; ?>" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_wishlist; ?>" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <li><a rel="nofollow" title="<?php echo $text_newsletter; ?>" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>
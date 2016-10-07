<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php if (isset($this->request->get['route']) && $this->request->get['route'] != 'common/home') { ?>
    <title><?php echo $title; ?> | <?php echo $this->config->get("config_name"); ?></title>
    <?php } else { ?>
    <title><?php echo $title; ?></title>
    <?php } ?>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <?php $template_name = $this->config->get("config_template"); ?>
    <link href="catalog/view/theme/<?php echo $template_name; ?>/css/stylesheet.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <?php if (isset($this->request->get['route']) && substr($this->request->get['route'], 0, 9) != 'checkout/') { ?>
    <script src="catalog/view/theme/<?php echo $template_name; ?>/js/socialite.min.js"></script>
    <?php } ?>
    <script src="catalog/view/theme/<?php echo $template_name; ?>/js/common.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <?php if ($stores) { ?>
    <script type="text/javascript"><!--
    $(document).ready(function() {
      <?php foreach ($stores as $store) { ?>
      $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
      <?php } ?>
    });
    //--></script>
    <?php } ?>
    <?php echo $google_analytics; ?>
    </head>
  <body>
    <div id="container" class="container">
      <div id="header" class="hidden-print">
        <div id="header-top" class="row">
          <div class="col-md-6">
            <?php echo $language; ?>
          </div>
          <div class="col-md-6">
            <?php echo $currency; ?>
          </div>
        </div>
        <div id="header-bottom" class="row">
          <div class="col-md-3 left">
            <?php if ($logo) { ?>
            <?php if($is_home) { ?>
            <img class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>">
            <?php } else { ?>
            <a href="<?php echo $home; ?>"><img class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a>
            <?php } ?>
            <?php } ?>
          </div>
          <div class="col-md-5 middle">
            <div id="search">
              <input name="search" type="text" class="form-control" placeholder="<?php echo $text_search; ?>">
            </div>
          </div>
          <div class="col-md-4 right">
            <a rel="nofollow" class="account btn btn-default" href="<?php echo($account); ?>">
            <?php echo($text_account); ?>
            </a>
            <?php if($logged) { ?>
              <a class="logout btn btn-default" href="<?php echo($logout); ?>"><?php echo($text_logout); ?></a>
            <?php } ?>
            <?php echo $cart; ?>
          </div>
        </div>
        <?php if ($categories) { ?>
        <nav id="menu-top" class="navbar yamm navbar-default " role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="top-navbar-collapse" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">  
              <?php foreach ($categories as $category) { ?>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
                  <?php if ($category['children']) { ?>
                  <b class="caret"></b>
                  <?php } ?>
                </a>
                <?php if ($category['children']) { ?>
                <?php for ($i = 0; $i < count($category['children']);) { ?>
                <ul class="dropdown-menu">
                  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                  <?php for (; $i < $j; $i++) { ?>
                  <?php if (isset($category['children'][$i])) { ?>
                  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                  <?php } ?>
                  <?php } ?>
                </ul>
                <?php } ?>
                <?php } ?>
              </li>
              <?php } ?>
            </ul>
          </div>
        </nav>
        <?php } ?>
      </div>
      <?php if ($error) { ?>
      <div class="warning alert alert-danger alert-dismissible hidden-print"  role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <?php echo $error ?>
      </div>
      <?php } ?>
      <div id="notification" class="hidden-print"></div>
      <div class="row">
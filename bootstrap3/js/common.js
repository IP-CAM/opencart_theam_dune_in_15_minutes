$(document).ready(function() {

    $('body').addClass('js');

    $('input[name="search"]').keypress(function (e) {
        if (e.which == 13) {
            url = $('base').attr('href') + 'index.php?route=product/search';
            var search = $('input[name="search"]').val();
            if (search) {
                url += '&search=' + encodeURIComponent(search);
                location = url;
            }
            return false;
        }
    });

    $(document).on('click', '#cart > a', function() {
        var content = $('#cart > .content').load('index.php?route=module/cart #cart .content > *');
        modalBuild(content.html(), 'cart-modal');
        $('#cart-modal .modal-body h4').prependTo('#cart-modal .modal-header').attr('class', 'modal-title pull-left');
        return false;
	});
});

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;
    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
				location = json['redirect'];
			}

			if (json['success']) {
              $('#cart-total').html(json['total']);
              modalBuild(json['success'], 'cart-modal');
			}	
		}
	});
    return false;
}


function addToWishList(product_id) {
    if($('#wishlist-button-' + product_id).hasClass('active')) {
        return false;
    }

    $.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
            $('#wishlist-button-' + product_id).addClass('active');
			if (json['success']) {
              modalBuild(json['success'], 'wishlist-modal');
			}	
		}
	});
    return false;
}

function addToCompare(product_id) {
    if($('#compare-button-' + product_id).hasClass('active')) {
        location = 'index.php?route=product/compare';
        return false;
    }
    
    $.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
            if (json['success']) {
                $('#compare-button-' + product_id).addClass('active');
                var total = json['total'].match(/\d+/)[0];
				if(total > 1) {
                    $('#compare-total').html(json['total']);
                    $('.compare.navbar-form.hide').removeClass('hide');
                }
                modalBuild(json['success'], 'comparer-modal');
			}	
		}
	});
    return false;
}

function modalBuild(content, id, header) {
    var html = '<div class="modal fade" id="' + id + '">';
        html += '<div class="modal-dialog"><div class="modal-content">';
        html += '<div class="modal-header clearfix">';
        html += '<button type="button" class="btn btn-primary pull-right" data-dismiss="modal">';
        html += '<span class="glyphicon glyphicon-remove"></span>';
        html += '</button>';
        
        if(typeof header !== 'undefined') {
          html += '<h4 class="modal-title pull-left">' + header + '</h4>';
        }

        html += '</div>';
        html += '<div class="modal-body">';
        html += content;
        html += '</div></div></div>';

    $('.modal').remove();
    $('#notification').after(html);
    $('#' + id + '').modal('show');
}

function openSharePopup() {
    var href = window.location.href;
    var title = document.title;
    var html = '<ul class="social-buttons cf list-inline list-group">';
        html += '<li><a href="http://twitter.com/share" class="socialite twitter-share" data-text="' + title + '" data-url="' + href + '" data-count="vertical" rel="nofollow" target="_blank"><span class="vhidden">Share on Twitter</span></a></li>';
        html += '<li><a href="https://plus.google.com/share?url=' + href + '" class="socialite googleplus-one" data-size="tall" data-href="' + href + '" rel="nofollow" target="_blank"><span class="vhidden">Share on Google+</span></a></li>';
        html += '<li><a href="http://www.facebook.com/sharer.php?u=' + href + '&t=' + title + '" class="socialite facebook-like" data-href="' + href + '" data-send="false" data-layout="box_count" data-width="60" data-show-faces="false" rel="nofollow" target="_blank"><span class="vhidden">Share on Facebook</span></a></li>';
        html += '</ul>';
    modalBuild(html, 'social-buttons');
    Socialite.load();
}

function alertBuild(message, type, classes) {
  var alert = '<div class="alert alert-' + type +' alert-dismissible" role="alert">';
  if(typeof classes !== 'undefined') {
    alert = '<div class="' + classes + ' alert alert-' + type +' alert-dismissible" role="alert">';
  }
  alert += message;
  alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
  alert += '<span aria-hidden="true">&times;</span>';
  alert += '</button></div>';
  return alert;
}
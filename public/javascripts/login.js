function toggle_login(openid) {
  if (openid) {
    $('#regularlogin').fadeOut('fast', function(){
                                 $('#openid').fadeIn();
                                 });

  } else {
    $('#openid').fadeOut('fast', function(){
                                 $('#regularlogin').fadeIn();
                                 });

  }
}
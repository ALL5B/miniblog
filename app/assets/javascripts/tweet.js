$(function(){
  $('#tweet_text').on("keyup",function(){
    var strcount = $('#tweet_text').val().length;
    var strmax = 120 - strcount;
    var str = strmax + '';
    if(strmax >= 80){
      $('#maxword').text("残り"+ str + "文字").css('color', 'blue');
    }else if(strmax >= 40){
      $('#maxword').text("残り"+ str + "文字").css('color', 'Orange');
    }else if(strmax >= 0){
      $('#maxword').text("残り"+ str + "文字").css('color', 'red');
    }else{
      $('#maxword').text("文字数がオーバーしています。").css('color', 'red');
    }
  });
});

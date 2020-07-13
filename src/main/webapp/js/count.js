var memberCountConTxt= TotalCase;
  
  $({ val : 0 }).animate({ val : memberCountConTxt }, {
   duration: 2000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".memberCountCon").text(num);
  }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
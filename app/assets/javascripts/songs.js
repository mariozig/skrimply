$(function() {
  rangy.init();

  $("#lyrics").mouseup(function(){
    var range = rangy.getSelection().getRangeAt(0);

    // breakout if the selection is less than 10 characters
    if(range === null || $.trim(range).length < 10){
      return true;
    }

    // This checks each element within the area deamed selectable
    // (aka the lyrics) if it's in the range currently selected
    var definitionModalHTML = "";
    $("#lyrics p").each(function(){
      if(range.intersectsNode(this)){
        var nodeRange = rangy.createRange();
        nodeRange.selectNodeContents(this);
        definitionModalHTML += range.intersection(nodeRange).toHtml();
      }
    });
    // Setup the defintion modal and it's contents
    $("#selectedSongLyrics").html(definitionModalHTML);
    $("#definitionModal").modal('toggle');
  });

});
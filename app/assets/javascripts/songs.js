$(function() {

  rangy.init();

  $("#lyrics").mouseup(function(){
    rangy.getSelection().expand("word", { trim: true });
    // Rangy works with DOM object, not a jQuery objects
    var lyricsDivDomObject = $("#lyrics").get(0);

    // Gets the first Object representing the selected text
    // (...it is literally, just an Object)
    var savedSelection = rangy.getSelection()
                              .saveCharacterRanges(lyricsDivDomObject)[0];

    // Build out a Range object based on the selection
    var selectionRange = rangy.createRangyRange(lyricsDivDomObject);
    selectionRange.selectCharacters(lyricsDivDomObject,
                           savedSelection.characterRange.start,
                           savedSelection.characterRange.end);

    // Check if the selection is valid.
    // Valid == starts and ends within the #lyrics div
    // TODO: compareNode is no longer used in Firefox, use compareBoundaryPoints
    if(selectionRange.compareNode(lyricsDivDomObject) !== Range.NODE_BEFORE_AND_AFTER){
      return true;
    }

    // Setup the modal's form fields
    $("#definition_backward_selection").val(
      savedSelection.backward === true ? "yes" : "no"
    );
    $("#definition_range_start").val(savedSelection.characterRange.start);
    $("#definition_range_end").val(savedSelection.characterRange.end);
    $("#selectedSongLyrics").html(selectionRange.toHtml());

    // Bring in the modal
    $("#definitionModal").modal('toggle');
  });

});
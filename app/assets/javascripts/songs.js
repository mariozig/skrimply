$(function() {

  rangy.init();

  $("#lyrics").mouseup(function(){
    // Rangy works with DOM object, not a jQuery objects
    var lyricsDivDomObject = $("#lyrics").get(0);

    rangy.getSelection().expand("word", { trim: true });

    // Gets the first Object representing the selected text
    // (...it is literally, just an Object)
    var savedSelection = rangy.getSelection()
                              .saveCharacterRanges(lyricsDivDomObject)[0];

    // Build out a Range object based on the selection
    var selectionRange = rangy.createRangyRange(lyricsDivDomObject);
    selectionRange.selectCharacters(lyricsDivDomObject,
                           savedSelection.characterRange.start,
                           savedSelection.characterRange.end);

    // Check if the selection is valid
    if(!isValidSelection(lyricsDivDomObject, selectionRange)){
      return true;
    }

    // Setup the modal's form fields
    $("#definition_backward_selection").val(
      savedSelection.backward === true ? "1" : "0"
    );
    $("#definition_range_start").val(savedSelection.characterRange.start);
    $("#definition_range_end").val(savedSelection.characterRange.end);
    $("#selectedSongLyrics").html(selectionRange.toHtml());

    // Bring in the modal
    $("#definitionModal").modal('toggle');
  });

  // Returns true if a selection is considered valid
  // A selection is valid under the following conditions:
  // - It contains DOM nodes
  // - It is inside of a given containerNode
  // - The ranger is longer than 5 characters
  function isValidSelection(containerNode, selectionRange){
    if(selectionRange.getNodes().length !== 0
       && selectionRange.getNodes()[0].compareDocumentPosition(containerNode) === 10
       && (selectionRange.toCharacterRange().end - selectionRange.toCharacterRange().start) >= 5
      ){
      return true;
    }
    return false;
  }

});
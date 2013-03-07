$(function() {
  rangy.init();

  $.getJSON(Skrimply.track_definitions_url, function(data) {
    var definitions = data;
    var first = definitions[0];

    var highlighter = rangy.createHighlighter();

    highlighter.addClassApplier(rangy.createCssClassApplier("highlight", {
      ignoreWhiteSpace: true
    }));

    var serializedHighlights = "type:textContent|";
    serializedHighlights = serializedHighlights+
                           first.range_start+
                           "$"+first.range_end+
                           "$1$highlight$lyrics";

    highlighter.deserialize(serializedHighlights);
    var highlightableRanges = getHighlightableRanges(definitions);

    console.log(highlightableRanges);

  })
  // .success(function() { alert("second success"); })
  // .error(function() { alert("error"); })
  // .complete(function() { alert("complete"); });

  $("#lyrics").mouseup(function(){
    rangy.getSelection().expand("word", { trim: true });
    var definer = rangy.createHighlighter();

    definer.addClassApplier(rangy.createCssClassApplier("adding-definition", {
      ignoreWhiteSpace: true
    }));

    definer.highlightSelection("adding-definition", null, "lyrics");

    var selection = function(){
      return definer.highlights[0];
    }();

    // Check if the selection is valid
    if(!isValidSelection($("#lyrics").get(0), selection.getRange())){
      return true;
    }

    // Setup the modal's form fields
    $("#definition_range_start").val(selection.characterRange.start);
    $("#definition_range_end").val(selection.characterRange.end);
    $("#selectedSongLyrics").text(selection.getText());

    // Bring in the modal
    $("#definitionModal").modal('toggle');
  });

  function getHighlightableRanges(definitions){
    var allDefinedCharacters = function(){
      return _.flatten(_.map(definitions, function(definition){
        return _.range(definition.range_start, definition.range_end+1);
      }));
    }();

    var characterIndexToOverlapCount = function(){
      var characterOverlaps = {};
      _.each(allDefinedCharacters, function(character){
        if(_.has(characterOverlaps, character)){
          characterOverlaps[character] = characterOverlaps[character] + 1;
        } else {
          characterOverlaps[character] = 1;
        }
      });

      return characterOverlaps;
    }()

    var overlapCountToIndexes = {};
    var highlightableRanges = {};
    var values = _.uniq(_.values(characterIndexToOverlapCount));

    // builds the keys
    _.each(values, function(value){
      overlapCountToIndexes[value] = [];
      highlightableRanges[value] = [];
    });

    // Populates with indexes
    _.each(_.keys(characterIndexToOverlapCount), function(key){
      overlapCountToIndexes[characterIndexToOverlapCount[key]].push(key);
    });

    // Builds out highlightableRanges.
    _.each(_.keys(overlapCountToIndexes), function(key){
      // Sets all of the range starts/stops
      var values = overlapCountToIndexes[key].sort(sortByNumber);
      var temp = [];
      for (var i = 0; i < values.length; i++) {
        var thisPlusOne = parseInt(values[i]) + 1;
        var nextItem = parseInt(values[i+1]);
        temp.push(values[i]);
        if(thisPlusOne !== nextItem){
          highlightableRanges[key].push({
            "range": {
              "start": temp[0],
              "end": temp[temp.length-1]
            }
          });
          temp = [];
        }
      };
    });

    // populates the associated definitions
    _.each(_.keys(highlightableRanges), function(key){
      _.each(highlightableRanges[key], function(sequence) {
        _.each(definitions, function(definition) {
          if(rangesIntersect({start: definition.range_start, end: definition.range_end}, sequence.range)){
            if(sequence["definitions"] === undefined){
              sequence["definitions"] = [];
            }
            sequence["definitions"].push(definition);
          }
        });
      });
    });

    return highlightableRanges;
  }
  // Returns true if a selection is considered valid
  // A selection is valid under the following conditions:
  // - It contains DOM nodes
  // - It is inside of a given containerNode
  // - The ranger is longer than 5 characters
  function isValidSelection(containerNode, range){
    if(range.getNodes().length !== 0
       && range.getNodes()[0].compareDocumentPosition(containerNode) === 10
       && (range.toCharacterRange().end - range.toCharacterRange().start) >= 5
      ){
      return true;
    }
    return false;
  }

  function sortByNumber(a,b){
    return(a-b)
  }

  function rangesIntersect(range1, range2){
    if(range1.start >= range2.start && range1.start <= range2.end)
      return true;
    if(range1.end >= range2.start && range1.start <= range2.end)
      return true;

    return false;
  }
});
<html>
<head>
    <script type="text/javascript" src="/scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/scripts/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="/scripts/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="/scripts/metro.js"></script>

    <link rel="stylesheet" href="/css/metro.css" type="text/css" />
    <link rel="stylesheet" href="/css/achiever.css" type="text/css" />

</head>
<body>
<div class="tiles cobalt column" id="todo">
    <div>
        <div>
            <input type="text" id="cardName" />
            <button onclick="addCard(event)" > + </button>
        </div>
            <span class="tile-title">To Do</span>
    </div>
    <div class="live-tile" data-mode="flip" data-initdelay="500">
        <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
        <div>
            <p><a class="metroLarger" href="#">front 1</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 1</a></p>
        </div>
    </div>
    <div class="live-tile emerald" data-direction="horizontal" data-mode="flip" data-init-delay="2575">
        <div>
            <p><a class="metroLarger" href="#">front 2</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 2</a></p>
            <span class="tile-title">back title</span>
        </div>
    </div>
    <div class="live-tile mango" data-mode="flip" data-initdelay="600">
        <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
        <div>
            <p><a class="metroLarger" href="#">front 3</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 3</a></p>
            <span class="tile-title">back title</span>
        </div>
    </div>
    <div class="live-tile blue" data-direction="horizontal" data-mode="flip" data-init-delay="850">
        <div>
            <p><a class="metroLarger" href="#">front 4</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 4</a></p>
            <span class="tile-title">back title</span>
        </div>
    </div>
    <div class="live-tile" data-mode="flip" data-initdelay="1500">
        <!-- adding the 'full' class to an 'img' or 'a' tag causes it to fill the entire tile -->
        <div>
            <p><a class="metroLarger" href="#">front 5</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 5</a></p>
            <span class="tile-title">back title</span>
        </div>
    </div>
    <div class="live-tile pink" data-direction="horizontal" data-mode="flip" data-init-delay="1350">
        <div>
            <p><a class="metroLarger" href="#">front 6</a></p>
            <span class="tile-title">front title</span>
        </div>
        <div>
            <p><a class="metroLarger" href="#">back 6</a></p>
            <span class="tile-title">back title</span>
        </div>
    </div>
    <div class="live-tile red" id="tile1" data-mode="flip" >
        <div class="front">
            <p id="msg">Click to edit</p>
            <span class="tile-title">Example</span>
        </div>
        <div class="back">
        </div>
    </div>

</div>
<script type="text/javascript">
//flip mode simple
//using data attributes
//$(".live-tile").not(".exclude").liveTile();
// jQuery UI
// http://jqueryui.com/sortable/#display-grid
$( ".tiles" ).sortable();
$( ".tiles" ).disableSelection();

var addCard = function(event){
    var cardName = $("#cardName").val();
    alert(cardName);
    $("#todo").append('<div class="live-tile aqua" data-mode="flip" ><div class="front" onclick="frontFaceClick(event)"><p id="msg">'+cardName+'</p><span class="tile-title">Example</span></div><div class="back" onclick="backFaceClick(event)"></div></div>');
}
var frontFaceClick = function (event) {
//    $("#text").val($("#msg").text());
//    if ($tile1 == null){ // lazy load the tile
//        $tile1 = $("#tile1").liveTile({ repeatCount: 0, delay: 0});
//    }else{
//        $tile1.liveTile('play');
//    }
    var backSide = $(event.target).parent().children()[1];
    var textbox = '<input id="text" type="text" value="'+$("#msg").text()+'" />';
    $(backSide).append('<p><label for="text">Example Field:</label>'+textbox+'<input type="button" value="done" class="done" onclick="doneClick(event)""/></p>');
    $(event.target).parent().liveTile({ repeatCount: 0, delay: 0});
    //event.stopPropagation();
    //  removeTile();
    //$("#tile1").die();
}

var backFaceClick = function (event) {
    event.stopPropagation();
}

var doneClick = function (event) {
    $("#msg").text($("#text").val());
    $(event.target).parent().parent().parent().liveTile('play');
}

$("#tile1").find(">.front").bind("click", frontFaceClick);
$("#tile1").find(">.back").bind("click", backFaceClick);
$(".done").bind("click", doneClick);
</script>
</body>
</html>

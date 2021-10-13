let x;
let y;
let r;
let previousButton;
let currentRadio;
function isValidData() {
    if (x == null || r == null || y == null) return false;
    return !(isNaN(x.value) || x.value <= -5 || x.value >= 5);

}
function resetChanges() {
    x.value = null;
    r.value = null;
    y.value = null;
    x = null;
    y = null;
    r = null;
    currentRadio.checked = false;
    if (previousButton != null) previousButton.style.backgroundColor = 'white';
    $('#submitData').prop('disabled', true);
}
function buttonClick(value, button) {
    if (previousButton != null) previousButton.style.backgroundColor = 'white';
    r = value;
    button.style.backgroundColor = 'lightgreen';
    previousButton = button;
    if (isValidData()) $('#submitData').prop('disabled', false);
    let pointers = $("[name='pointer']");
    let initX;
    let initY;
    let moveX;
    let moveY;
    let initR;
    let hit;
    for (let i = 0; i < pointers.length; i++) {
        initX = pointers[i].dataset.x;
        initY = pointers[i].dataset.y;
        initR = pointers[i].dataset.r;
        hit = pointers[i].dataset.hit;
        moveX = 180 + 150 * initX / Math.abs(r);
        moveY = 180 - 150 * initY / Math.abs(r);
        if (initR === r && hit === "true") {
            pointers[i].style.fill = "#A4CC84";
        } else pointers[i].style.fill = "#cca484";
        $(pointers[i]).animate({
            cx: moveX,
            cy: moveY
        }, {duration: 500, queue: false});
    }
}
function radioChanged(value, radio) {
    currentRadio = radio;
    y = value;
    if (isValidData()) $('#submitData').prop('disabled', false);
}

function textChanged() {
    x = document.getElementById("xValue");
    if (isNaN(x.value) || x.value <= -5 || x.value >= 5) {
        $('#messageX').text("Заполните поле допустимыми значениями");
        $('#submitData').prop('disabled', true);
    }
    else {
        $('#messageX').text("");
        if (isValidData()) $('#submitData').prop('disabled', false);
    }
}

$(document).ready(function() {
    $('[data-submit]').on('click', function(e) {
        e.preventDefault();
    })
});
$(document).ready(function () {
    $('#clearValues').on('click', function (e) {
        e.preventDefault();
        console.log("reset");
        resetChanges();
        $("#r-id").val(true);
    })
});

$("#graph-svg").on("click", function (event) {
    if (r == null) return;
    let canvasX = (event.offsetX - 165) / 165 * r;
    let canvasY = (165 - event.offsetY) / 165 * r;
    $("#x-hid").val(canvasX);
    $("#y-hid").val(canvasY);
    $("#send").click();
});


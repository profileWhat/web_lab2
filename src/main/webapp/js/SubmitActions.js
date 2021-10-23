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
    if (x != null) x.value = null;
    if (y != null) y.value = null;
    if (r != null) r.value = null;
    x = null;
    y = null;
    r = null;
    if (currentRadio != null) currentRadio.checked = false;
    if (previousButton != null) previousButton.style.backgroundColor = 'white';
    $('#rValue').val("");
    $('#r-id').val("");
    $('#submitData').prop('disabled', true);
}
function buttonClick(value, button) {
    $('#messageR').text("");
    if (previousButton != null) previousButton.style.backgroundColor = 'white';
    r = value;
    $('#rValue').val(r);
    button.style.backgroundColor = 'lightgreen';
    previousButton = button;
    if (isValidData()) $('#submitData').prop('disabled', false);
}
function radioChanged(value, radio) {
    currentRadio = radio;
    y = value;
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
    $('#clearValues').on('click', function () {
        console.log("reset");
        resetChanges();
        $("#r-id").val(true);
    })
});

function svgClick(e) {
    let messageR = $('#messageR');
    console.log("graph-click")
    if (r == null) {
        messageR.text("Заполните это поле для клика")
        return;
    }
    messageR.text("");
    x = (e.offsetX - 165) / 165 * r;
    y = (165 - e.offsetY) / 165 * r;
    $("#x-hid").val(x);
    $("#y-hid").val(y);
    $('#submitData').prop('disabled', false);
    $("#submitData").click();
}



const X = document.getElementById("Xvalue");
const Y = document.getElementById("Yvalue");
const R = document.getElementById("Rvalue");
const errorElement = document.getElementById("error");

function invalidY(){
    if ( isNaN(Y.value)){
	    return true;
    } else if(Y.value>3||Y.value < -5){
	    return true
    }
    var reg= /(3|-5).(0)+[1-9]/;

    if ((String(Y.value)).match(reg)) {
    	return true;
    }
    console.log((String(Y.value)).match(reg))
	return false;
}


document.addEventListener('submit', (e)=>{
    let messages=[]
    if ( isNaN(Y.value)){
        messages.push("Y must be a number!")
    } else if(Y.value>3||Y.value < -5){
        messages.push("Y is out of range!")
    }


    var reg= /(3|-5).(0)+[1-9]/;

    if ((String(Y.value)).match(reg)) {
        messages.push("Really?? >:( ")
    }
    console.log((String(Y.value)).match(reg))



	if (messages.length > 0){
    e.preventDefault();
    errorElement.innerHTML=messages.join(", ")
    }
});

let input = document.getElementById("myForm");
let button = document.getElementById("submit-button");
button.disabled = true; //setting button state to disabled

input.addEventListener("change", stateHandle);

function stateHandle() {

	console.log("begin handle")
    var x = document.getElementsByName("Xvalue");
    var xchecked = false;
    for ( var i = 0; i < x.length; i++) {
    if(x[i].checked) {
        xchecked = true;
        break;
        }
    }
	    console.log("x went")
	    console.log(xchecked)
    var r = document.getElementsByName("Rvalue");
    var rchecked = false;
    for ( var i = 0; i < r.length; i++) {
    if(r[i].checked) {
        rchecked = true;
        break;
        }
    }
	console.log("r went")
	console.log(rchecked)
    if (document.querySelector(".input-select").value === "" || invalidY() || !rchecked || !xchecked)  {
    button.disabled = true; //button remains disabled
    } else {
        button.disabled = false; //button is enabled
    }
}

function check_me(ev) {
    ev.preventDefault();
    //alert("Hello World!")
    var r = document.getElementsByName("Rvalue");
    var rchecked = false;
    var k=0
    for ( var i = 0; i < r.length; i++) {
    if(r[i].checked) {
        rchecked = true;
        k=i
        break;

        }
    }
    var radius = document.getElementById("Rvalue");


    if (rchecked){  //not null
        const target = document.getElementById("circle").getBoundingClientRect()

        //var target = this.getBoundingClientRect();

        var x = (ev.clientX - target.left - 225)/180*r[k].value;
        var y = ((ev.clientY - target.top - 200)/180*(-1))*r[k].value;
        var n= ev.clientY - target.top;
        var m= ev.clientX - target.left;

        //alert(String(x).concat('=passedx, ', String(y), '=y', '\nclientx =', String(ev.clientX), ' clienty=', String(ev.clientY), '\nleft= ', String(target.left), ' ', String(target.top), '=top\n', 'n= ', String(n), ' m= ',  String(m)))

        let submitForm = document.getElementById("myForm")

        console.log(R.value)
        submitForm.elements["Yvalue"].value = y;

        select = document.getElementById('Xvalue');

        var radioHtml = '<input class="radio" id="Xvalue" type="radio" name="Xvalue" value='+ x +' checked required/>';

        var radioFragment = document.getElementById("Xchoose")
        radioFragment.innerHTML = radioHtml;
        submitForm.submit();
        //submitForm.elements["Xvalue"].remove(9);
    } else {
        let messages=[]
        messages.push("R must be set!")
        errorElement.innerHTML=messages.join(", ")
    }
}

function getMousePosition(event) {
    const rect = document.querySelector("svg").getBoundingClientRect()
    return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
    };
}



// sleep time expects milliseconds
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}




document.getElementById("circle").addEventListener("click", check_me);

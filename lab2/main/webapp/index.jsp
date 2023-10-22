<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">
        <link rel="icon" type="image" href="pics/frog.png">
        <script defer src="script.js"></script>

        <title>Lab 1</title>
    </head>

    <body>
        <table border="1" cellpadding="0" cellspacing="1" width="100%">
            <tr>
                <th class="header" colspan=2> <h1>Web Lab 2</h1> Kseniya Vladimirovna Arbatova, P3233, var 1414  <br> </th>
            </tr>
            <tr>
                <th width="50%">Point placement</th>
                <th width="50%">Graph</th>
            </tr>
            <tr class="content">
                <td>
                    <form name="myForm" id="myForm"  method="post" action="ControllerServlet">
                        <fieldset name="myForm">
                          <legend>Please select your preferred X-value:</legend>
                          <div id="Xchoose">
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=-3 unchecked required />  <label for="Choice1">-3</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=-2 unchecked required/>  <label for="Choice2">-2</label>
                            <input class="radio" id="Xvalue"  type="radio" name="Xvalue" value=-1 unchecked required/>  <label for="Choice3">-1</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=0 unchecked required/>  <label for="Choice4">0</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=1 unchecked required/>  <label for="Choice5">1</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=2 unchecked required/>  <label for="Choice6">2</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=3 unchecked required/>  <label for="Choice7">3</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=4 unchecked required/>  <label for="Choice8">4</label>
                            <input class="radio" id="Xvalue" type="radio" name="Xvalue" value=5 unchecked required/>  <label for="Choice9">5</label>
                          </div>

                          <legend>Please enter your preferred Y-value:</legend> <br>
                          <div id="y-select-input" class="select-input-container">
                            <input type="text" name="Yvalue" id="Yvalue" class="input-select" placeholder="Should be between -5 and 3" required />
                            <span class="error" aria-live="polite"></span>
                          </div>

                            <p id="error"></p>

                          <legend>Please select your preferred R-value:</legend>
                          <div>
                            <input class="radio" id="Rvalue" type="radio" name="Rvalue" value=1.0 unchecked required/>  <label for="Choice1">1</label>
                            <input class="radio" id="Rvalue" type="radio" name="Rvalue" value=1.5 unchecked required/>  <label for="Choice2">1.5</label>
                            <input class="radio" id="Rvalue" type="radio" name="Rvalue" value=2.0 unchecked required/>  <label for="Choice3">2</label>
                            <input class="radio" id="Rvalue" type="radio" name="Rvalue" value=2.5 unchecked required/>  <label for="Choice4">2.5</label>
                            <input class="radio" id="Rvalue" type="radio" name="Rvalue" value=3.0 unchecked required/>  <label for="Choice5">3</label>
                          </div>

                          <div>
                            <button type="submit" class="button-submit" id="submit-button"  >Submit</button>
                          </div>
                        </fieldset>
                    </form>

                     <form name="clForm" id="clForm"  method="get" action="ControllerServlet">
                        <fieldset>
                            <div>
                                <button type="submit" name="reset" id="reset-button" value=2>Reset</button>
                            </div>
                        </fieldset>
                      </form>
                </td>

                <td class="element">
                    <canvas id="circle"></canvas>

                    <script>

                        var canvas = document.getElementById("circle"),
                        ctx = canvas.getContext("2d");

                        ctx.fillRect(30, 30, 100, 100);
                         canvas.width = 450; // x
                         canvas.height = 400; // y
                         // r =
                         ctx.lineWidth = 2.0;

                         ctx.beginPath();                                  // rectangle in second
                         ctx.rect(225, 200, 180, 90);
                         ctx.closePath();
                         ctx.strokeStyle = "rgba(0,0,255,0.25)";
                         ctx.fillStyle = "rgba(0,50,200,0.25)";
                         ctx.fill();
                         ctx.stroke();

                         ctx.beginPath();                                    // circle in third
                         ctx.arc(225, 200, 180, Math.PI / 2, Math.PI, false);
                         ctx.lineTo(225, 200);
                         ctx.lineTo(225, 380);
                         ctx.closePath();
                         ctx.strokeStyle = "rgba(10,0,200,0.25)";
                         ctx.fillStyle = "rgba(0,50,200,0.25)";
                         ctx.fill();
                         ctx.stroke();

                        ctx.beginPath();                                    // triangle in fourth
                        ctx.moveTo(225, 200); //start at origin
                        ctx.lineTo(225, 110);
                        ctx.lineTo(45, 200);
                        ctx.lineTo(225, 200);
                         ctx.closePath();
                         ctx.strokeStyle = "rgba(0,0,255,0.25)";
                         ctx.fillStyle = "rgba(0,50,200,0.25)";
                         ctx.fill();
                         ctx.stroke();

                         ctx.beginPath();                                    // y coord
                         ctx.moveTo(225, 10);
                         ctx.lineTo(225, 400);

                         ctx.moveTo(0, 200);
                         ctx.lineTo(440, 200);                               // x coord

                         ctx.moveTo(220, 20);
                         ctx.lineTo(230, 20);

                         ctx.moveTo(220, 110);
                         ctx.lineTo(230, 110);

                         ctx.moveTo(315, 195);
                         ctx.lineTo(315, 205);

                         ctx.moveTo(405, 195);
                         ctx.lineTo(405, 205);

                         ctx.moveTo(220, 380);
                         ctx.lineTo(230, 380);

                         ctx.moveTo(220, 290);
                         ctx.lineTo(230, 290);

                         ctx.moveTo(45, 195);
                         ctx.lineTo(45, 205);

                         ctx.closePath();
                         ctx.strokeStyle = "black";
                         ctx.stroke();

                         ctx.lineWidth = 1.0;

                    </script>
                </td>
            </tr>
<tr>
    <td colspan=2> <b>Attempts</b>
        <table border="1" id="result-table">
            <thead>
                <tr><th>X</th><th>Y</th><th>R</th><th>Result</th><th>Executed at</th><th>Execution time (microseconds)</th></tr>
            </thead>

        </table>
    </td>
</tr>
<div class = "footer">
<a href="mailto:kseniya.arbatova@gmail.com">kseniya.arbatova@gmail.com</a></p>
</div>
</table>
</body>
</html>

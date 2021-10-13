<%@ page import="Data.ResultTable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">
<%
    ArrayList<ResultTable> results = new ArrayList<>();
    if (request.getSession().getAttribute("results") != null) {
        results = (ArrayList<ResultTable>) request.getSession().getAttribute("results");
    }
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Лабораторная работа</title>
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="js/SubmitActions.js" type="text/javascript"></script>
</head>
<body>
<table class = table-main id = main_table>

    <tr class = header-my_name>
        <th colspan=2 class = header-my_name-section>Романов Владимир Валерьевич 309616, группа P3233, Вариант 33014
        </th>
    </tr>

    <td class = table-main-section_input>
        <svg id="graph-svg" width="360" height="360">
            <rect width="360" height="360" stroke="indianred" stroke-width="10px" x="0" y="0" fill="deepskyblue" fill-opacity="0.2" stroke-linejoin="round"></rect>
            <line stroke="black" stroke-width="2px" x1="180" x2="180" y1="0" y2="360"></line>
            <line stroke="black" stroke-width="2px" x1="0" x2="360" y1="180" y2="180"></line>
            <rect id="section-1" x="182" y="182" width="75" height="150" fill-opacity="0.7"></rect>
            <path id="section-2" d="M178,182 L107,182 A100,100 0 0,0 178,257 z"
                  fill-opacity="0.7"></path>
            <polygon id="section-3" points="178 178, 178 105, 30 178" fill-opacity="0.7"></polygon>
            <polygon class="graph-base" points="180 0, 185 25, 175 25" stroke="white" stroke-width="1"></polygon>
            <polygon class="graph-base" points="360 180, 340 185, 340 175" stroke="white" stroke-width="1"></polygon>
            <line stroke="white" stroke-width="2" x1="173" x2="187" y1="30"
                  y2="30"></line>
            <line stroke="white" stroke-width="2" x1="173" x2="187" y1="105"
                  y2="105"></line>
            <line stroke="white" stroke-width="2" x1="173" x2="187" y1="255"
                  y2="255"></line>
            <line stroke="white" stroke-width="2" x1="173" x2="187" y1="331"
                  y2="331"></line>
            <line stroke="white" stroke-width="2" x1="30" x2="30" y1="173" y2="187"></line>
            <line stroke="white" stroke-width="2" x1="105" x2="105" y1="173"
                  y2="187"></line>
            <line stroke="white" stroke-width="2" x1="255" x2="255" y1="173"
                  y2="187"></line>
            <line stroke="white" stroke-width="2" x1="330" x2="330" y1="173"
                  y2="187"></line>
            <text fill="indianred" stroke="indianred" x="193" y="35">R</text>
            <text fill="indianred" stroke="indianred" x="193" y="110">R/2</text>
            <text fill="indianred" stroke="indianred" x="193" y="260">-R/2</text>
            <text fill="indianred" stroke="indianred" x="193" y="335">-R</text>
            <text fill="indianred" stroke="indianred" x="325" y="167">R</text>
            <text fill="indianred" stroke="indianred" x="245" y="167">R/2</text>
            <text fill="indianred" stroke="indianred" x="100" y="167">-R/2</text>
            <text fill="indianred" stroke="indianred" x="20" y="167">-R</text>
            <%
                for (ResultTable result : results) {
            %>
            <circle cx="<%=180+150*result.getX()/Math.abs(result.getR())%>"
                    cy="<%=180-150*result.getY()/Math.abs(result.getR())%>"
                    data-x="<%=result.getX()%>" data-y="<%=result.getY()%>" data-r="<%=result.getR()%>"
                    data-hit="<%=result.getHit()%>" r="5"
                    name="pointer" class="pointer"></circle>
            <%
                }
            %>
        </svg>

        <form method="post" action="${pageContext.request.contextPath}/Controller">

            <label for="xValue" class = input_label>Впишите X, допустимые значения (-5..5)</label>
            <input class = main-offer_text type = text name="xValue" id = xValue onchange="textChanged()">
            <br>
            <p class="invalidData_label" name="messageX" id="messageX"></p>
            <br>

            <fieldset id = yValue>
                <legend class="input_label">Выберите Y</legend>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue-3 value = -2 onchange="radioChanged(-2, this)">
                <label for="yValue-3" class = input_label> -2</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue-2 value = -1.5 onchange="radioChanged(-1.5, this)">
                <label for="yValue-2" class = input_label> -1.5</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue-1 value = -1 onchange="radioChanged(-1, this)">
                <label for="yValue-1" class = input_label> -1</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue0 value = -0.5 onchange="radioChanged(-0.5, this)">
                <label for="yValue0" class = input_label> 0.5</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue1 value = 0 onchange="radioChanged(0, this)">
                <label for="yValue1" class = input_label> 0</label>
                <br>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue2 value = 0.5 onchange="radioChanged(0.5, this)">
                <label for="yValue2" class = input_label> 0.5</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue3 value = 1 onchange="radioChanged(1, this)">
                <label for="yValue3" class = input_label> 1</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue4 value = 1.5 onchange="radioChanged(1.5, this)">
                <label for="yValue4" class = input_label> 1.5</label>
                <input class = main-offer_radio type = "radio" name = "yValue" id = yValue5 value = 2 onchange="radioChanged(2, this)">
                <label for="yValue5" class = input_label> 2</label>
            </fieldset>
            <br>
            <p class="invalidData_label" id="messageY"></p>
            <br>

            <fieldset id = rValue>
                <legend class = input_label>Выберите R</legend>
                <input class="main-offer_button" type = button name="rValue" value="1" onclick="buttonClick(1, this)">
                <input class="main-offer_button" type = button name="rValue" value="1.5" onclick="buttonClick(1.5, this)">
                <input class="main-offer_button" type = button name="rValue" value="2" onclick="buttonClick(2, this)">
                <input class="main-offer_button" type = button name="rValue" value="2.5" onclick="buttonClick(2.5, this)">
                <input class="main-offer_button" type = button name="rValue" value="3" onclick="buttonClick(3,this)">
            </fieldset>
            <br>
            <p class="invalidData_label" id="messageR"></p>
            <p class ="input_label" id="messageRvalue"></p>
            <br>
            <input disabled class =main-offer_submitExpression type = submit value = "Проверить" id="submitData">
            <input type="hidden" value="" name="canvas-x" id="x-hid">
            <input type="hidden" value="" name="canvas-y" id="y-hid">
            <br>

            <input class = main-offer_submitExpression type = submit name = clearValues id = clearValues value = "Очистить">
            <input type="hidden" value="" name="reset-flag" id="r-id">
            <br>

        </form>
        <br>
        <p class = invalidData_label id = "invalidDataAnswer"></p>
    </td>

    <td class = table-main-section_output>
        <table id="outputTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Время</th>
                <th>Попадание</th>
            </tr>
            </thead>
            <tbody id="outputTableBody">
            <%
                for (ResultTable result : results) {
            %>
            <tr>
                <td><%=result.getX()%>
                </td>
                <td><%=result.getY()%>
                </td>
                <td><%=result.getR()%>
                </td>
                <td><%=result.getCurrTime()%>
                </td>
                <td><%=result.getHit()%>
                </td>
            </tr>
            <%
                }
                ;
            %>
            </tbody>
        </table>
    </td>
</table>
</body>
</html>

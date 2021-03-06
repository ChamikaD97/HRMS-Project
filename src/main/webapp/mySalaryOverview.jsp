<%@ page import="salary.SalaryBean" %>
<%@ page import="salary.SalaryDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.Date" %>
<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="icon" href="img/logo.png" sizes="25x25" type="image/png">
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/mySalaryOverview.css">
</head>
<body>
<div class="content">
    <div class="heading">
        <h3> My Salary History </h3>
    </div>
    <br>
    <form action="searchMySalaries" method="POST">
        <%HttpSession sss = request.getSession(false);
            if (sss == null || sss.isNew()) {
                request.setAttribute("session", "Expired");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }%>
    <input class="input" type="number" name="empId" value="<%=session.getAttribute("empId")%>" hidden>
    <div class="selection">
        <table class="searchSal">
            <tr>
                <td>
                    <label class="label">Salaries Greater Than</label>
                </td>
                <th >
                    <input  type="number" id="totSalary" name="totSalary" value="0">
                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Salaries Less Than</label>
                </td>
                <th >
                    <input  type="number" id="totSalaryLess" name="totSalaryLess" value="999999999">
                </th>
            </tr>
        </table>
        <%
            Date date;
            date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
            String currentYear= formatter.format(date);%>
        <table>
            <tr>
                <td>
                    <label class="label">From</label>
                </td>
                <th>
                    <div class="year">
                        <input type="number" id="fromYear" name="fromYear" value="<%=currentYear%>">
                    </div>

                </th>
                <th>
                    <div class="date">
                        <select name="fromMonth" id="fromMonth">
                            <option value="0">All</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">Auguest</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                    </div>

                </th>

            </tr>
            <tr>
                <td>
                    <label class="label">To</label>
                </td>
                <th>
                    <div class="year">
                        <input type="number" id="toYear" name="toYear" value="<%=currentYear%>">
                    </div>

                </th>
                <th>
                    <div class="date">
                        <select name="toMonth" id="toMonth">
                            <option value="0" selected>All</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">Auguest</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12" >December</option>
                        </select>
                    </div>

                </th>
            </tr>

            <tr>
                <td>

                </td>
                <th></th>
                <th>
                    <input class="show" type="submit" value="Show"/>
                </th>
            </tr>
        </table>
    </div>
        <%
            SalaryBean results= (SalaryBean) request.getAttribute("results");

            if (results != null){
                System.out.println(results.getResultGreater() +results.getResultLess() + results.getFromDate() + results.getToDate());

        %>
        <div>
            <table>
                <tr class="searchResults">
                    <td>
                        <%=results.getResultGreater() +results.getResultLess() + results.getFromDate() + results.getToDate()%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <%}
        String empId= (String) session.getAttribute("empId");
        String fromMonth= request.getParameter("fromMonth");
        String toMonth= request.getParameter("toMonth");
        String totSalary= request.getParameter("totSalary");
        String totSalaryLess= request.getParameter("totSalaryLess");
        SalaryDao empDao = new SalaryDao();

        List<SalaryBean> salaryListDefault = empDao.mySalaries(empId,fromMonth,toMonth,totSalary,totSalaryLess);
    %>

    <div class="result">
        <br>
        <table id="table">
            <tr>
                <th>
                    From
                </th>
                <th>
                    To
                </th>
                <th>
                    NoPays
                </th>
                <th>
                    Absences
                </th>
                <th>
                    Office Days
                </th>

                <th>
                    Basic
                </th>
                <th>
                    Daily
                </th>
                <th>
                    OT rate
                </th>
                <th>
                    OT Hours
                </th>
                <th>
                    Total
                </th>
            </tr>

            <%

                String check= request.getParameter("totSalary");

                if (check== null) {
                    for(SalaryBean salary:salaryListDefault){
                        if(session.getAttribute("empId").equals(salary.getEmpId())){}
                        else{
            %>
            <tr>
            <td class="salaryData"><%=salary.getFromDate()%></td>
            <td class="salaryData"><%=salary.getToDate()%></td>
            <td class="salaryData"><%=salary.getNoPayes()%></td>
            <td class="salaryData"><%=salary.getAbsences()%></td>
            <td class="salaryData"><%=salary.getOfficeWorkingDays()%></td>
            <td class="basic"><%=salary.getBasic()%></td>
            <td class="daily"><%=salary.getDailyPayment()%></td>
            <td class="otrate"><%=salary.getOtRate()%></td>
            <td class="salaryData"><%=salary.getOtHours()%></td>
            <td class="totalSalary"><%=salary.getTotalSalary()%><%}}}%></td>

            </tr>
            <%
                String search= request.getParameter("totSalary");
                if (search != null) {
                    List<SalaryBean> salariesBySearch = (List<SalaryBean>) request.getAttribute("salaries");
                    for(SalaryBean salary:salariesBySearch){
                        if(session.getAttribute("empId").equals(salary.getEmpId())){}
                        else{
            %>
                        <tr>
            <td class="salaryData"><%=salary.getFromDate()%></td>
            <td class="salaryData"><%=salary.getToDate()%></td>
            <td class="salaryData"><%=salary.getNoPayes()%></td>
            <td class="salaryData"><%=salary.getAbsences()%></td>
            <td class="salaryData"><%=salary.getOfficeWorkingDays()%></td>
            <td class="basic"><%=salary.getBasic()%></td>
            <td class="daily"><%=salary.getDailyPayment()%></td>
            <td class="otrate"><%=salary.getOtRate()%></td>
            <td class="salaryData"><%=salary.getOtHours()%></td>
            <td class="totalSalary"><%=salary.getTotalSalary()%><%}}}%></td>

            </tr>
        </table>
    </div>

</div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>
</html>

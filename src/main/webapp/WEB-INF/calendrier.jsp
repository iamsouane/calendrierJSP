<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.DayOfWeek" %>

<%!
	int mois = 11;
	int annee = 2024;
	
	public void jspInit(ServletConfig config) throws ServletException {
		super.init(config);
		
		mois = Integer.parseInt(getServletConfig().getInitParameter("mois"));
		annee = Integer.parseInt(getServletConfig().getInitParameter("annee"));
	}
%>

<%!
	//Obtenir le 1er jour du mois
	LocalDate localDate = LocalDate.of(annee, mois, 1);
	DayOfWeek nom1erJourMois = localDate.getDayOfWeek();
	int numero1erJourMois = nom1erJourMois.getValue();
	
	//Obtenir le nombre de jours du mois
	int nbrJourMois = localDate.lengthOfMonth();
%>

<%!
	int[] genererTableauCalendrier(int debut, int fin) {
		int[] tableau = new int[42];
		int k = 1;
		
		for(int i = debut; i < fin + debut; i++) {
			tableau[i] = k++;
		}
		return tableau;
	}

	String calendrier(int[] tableau) {
		String strTableau = "";
		strTableau += "<table border='2'>";
		
		int k = -1;
		for(int i = 0; i < 6; i++) {
			strTableau += "<tr>";
			
			for(int j = 0; j < 7; j++) {
				k++;
				
				if(tableau[k] == 0) {
					strTableau += "<td>&nbsp;</td>";
				} else {
					if(j == 5 || j == 6) {
						strTableau += "<td bgcolor='red'>" + tableau[k] + "</td>";
					} else {
						strTableau += "<td>" + tableau[k] + "</td>";
					}
				}
			}
			strTableau += "</tr>";
		}
		strTableau += "</table>";
		return strTableau;
	}
	
	int[] tableau = genererTableauCalendrier(numero1erJourMois - 1, nbrJourMois);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Calendrier Novembre 2024</title>
	</head>
	<body>
		<p><%= calendrier(tableau)%></p>
	</body>
</html>
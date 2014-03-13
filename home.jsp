<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.lang.management.ManagementFactory"%>
<%@page import="java.lang.management.OperatingSystemMXBean"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Modifier"%>
<%@page import="org.hyperic.sigar.CpuInfo"%>
<%@page import="org.hyperic.sigar.Sigar"%>
<%@page import="org.hyperic.sigar.CpuPerc"%>
<%@page import="org.hyperic.sigar.SigarException"%>
<%@page import="org.hyperic.sigar.Cpu"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.apache.http.client.methods.HttpPut"%>
<%@page import="org.apache.http.entity.StringEntity"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="org.apache.http.util.EntityUtils"%>
<%@page import="org.w3c.dom.CharacterData"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.xml.sax.InputSource"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Corent</title>

<!-- Include Styles -->
<link rel="stylesheet" href="css/menu.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-hashchange.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script>
	function loadpage() {
		var xmlhttp;
		var tenantname = getCookie('tn');
		if(tenantname != null) {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			}
		}
		xmlhttp.open("GET", "/liveuser?tn="+tenantname+"&userid="+<%=request.getParameter("userid")%>, true);
		xmlhttp.send();
		}
	}
	
	function getCookie(cname)
	{
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++)
	  {
	  var c = ca[i].trim();
	  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
	}
	return "";
	}

	function getCPUApi() {
		var req = new XMLHttpRequest();
		req.open('POST', document.getElementById('cpuurl'));
		req.setRequestHeader("API_KEY", document.getElementById('apikey'));
		alert("sessionID===>:"+document.forms["myForm"]["sessionid"].value);
		req.setRequestHeader("C_Session_ID", document.forms["myForm"]["sessionid"].value);
		req.onreadystatechange = function(aEvt) {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				}
			}
		};
		var xmlrpcrequest=document.forms["myForm"]["cpuxml"].value;
		req.send(xmlrpcrequest);
	}

	function getRAMApi() {
		
		var req = new XMLHttpRequest();
		alert("url===>:"+document.forms["myForm"]["ramurl"].value);	  
		alert("apikey===>:"+document.forms["myForm"]["apikey"].value);	  
		  req.open('POST', document.forms["myForm"]["ramurl"].value);	    
		req.setRequestHeader("API_KEY", document.forms["myForm"]["apikey"].value);
		alert("sessionID===>:"+document.forms["myForm"]["sessionid"].value);
		req.setRequestHeader("C_Session_ID", document.forms["myForm"]["sessionid"].value);
		
		req.onreadystatechange = function(aEvt) {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				}
			}
		};
	    
		var xmlrpcrequest=document.forms["myForm"]["ramxml"].value;		
		alert("xmlrpcrequest==>:"+xmlrpcrequest);
		req.send(xmlrpcrequest);  
	}

	function getUsedRAMApi() {
		var req = new XMLHttpRequest();
		alert("used ram url===>:"+document.forms["myForm"]["usedramurl"].value);	  
		alert("apikey===>:"+document.forms["myForm"]["apikey"].value);	 
		req.open('POST', +document.forms["myForm"]["usedramurl"].value);
		req.setRequestHeader("API_KEY", document.getElementById('apikey'));
		alert("sessionID===>:"+document.forms["myForm"]["sessionid"].value);
		req.setRequestHeader("C_Session_ID", document.forms["myForm"]["sessionid"].value);
		req.onreadystatechange = function(aEvt) {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				}
			}
		};
		var xmlrpcrequest=document.forms["myForm"]["usedramxml"].value;
		alert("used ram xml==>:"+xmlrpcrequest);
		req.send(xmlrpcrequest);
	}

	function getInfraApi() {
		var req = new XMLHttpRequest();
		alert("url===>:"+document.forms["myForm"]["infraurl"].value);	  
		alert("apikey===>:"+document.forms["myForm"]["apikey"].value);	 
		req.open('POST', document.forms["myForm"]["infraurl"].value);
		req.setRequestHeader("API_KEY", document.getElementById('apikey'));	
		alert("sessionID===>:"+document.forms["myForm"]["sessionid"].value);
		req.setRequestHeader("C_Session_ID", document.forms["myForm"]["sessionid"].value);
		req.onreadystatechange = function(aEvt) {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				}
			}
		};	
		alert("getInfraApi xml===>:"+document.forms["myForm"]["infraxml"].value);
		var xmlrpcrequest=document.forms["myForm"]["infraxml"].value;
		req.send(xmlrpcrequest);
	}

	function getFeatureApi() {
		var req = new XMLHttpRequest();
		alert("url===>:"+document.forms["myForm"]["featureurl"].value);	  
		alert("apikey===>:"+document.forms["myForm"]["apikey"].value);
		req.open('POST', document.forms["myForm"]["featureurl"].value);	  
		req.setRequestHeader("API_KEY", document.getElementById('apikey'));
		alert("sessionID===>:"+document.forms["myForm"]["sessionid"].value);
		req.setRequestHeader("C_Session_ID", document.forms["myForm"]["sessionid"].value);	
		req.onreadystatechange = function(aEvt) {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				}
			}
		};
		alert("getFeatureApi xml===>:"+document.forms["myForm"]["featurexml"].value);
		var xmlrpcrequest=document.forms["myForm"]["featurexml"].value;
		req.send(xmlrpcrequest);
	}
</script>

</head>
<body>
<form name="myForm" action="logout"><section id="wrapper" class="wrapper">

<div class="header" align="center">
<div class="logo"><img src="images/corent_logo.png" alt="corentlogo"></div>
<div class="right-login-set" style="padding-top: 30px;"><span
	style="color: #2699BF;">Welcome <b><%=request.getParameter("username")%></b></span>&nbsp;&nbsp;<input
	type="submit" class="LoginButton" value="Logout" /></div>
</div>
<div id="v-nav">

<ul>
	<li tab="tab1" onclick="getCPUApi()" class="first current">CPU</li>
	<li tab="tab2" onclick="getRAMApi()">RAM</li>
	<li tab="tab3" onclick="getUsedRAMApi()">USED RAM</li>
	<li tab="tab4" onclick="getInfraApi()">INFRASTRUCTURE</li>
	<li tab="tab5" onclick="getFeatureApi()">FEATURE USAGE</li>
</ul>
<table height="20"></table>
<table width="744" height="30" border="1" cellpadding="1"
	cellspacing="0" bordercolor="#e1f3fb" bgcolor="#EEEEEE">
	<tr>
		<td bgcolor="#3aa0cc" align="left">&nbsp;XMT INFO</td>
	</tr>
</table>

<div id="refresh">
<table width="744" height="25" border="1" cellpadding="1"
	cellspacing="0" bordercolor="#e1f3fb" bgcolor="#EEEEEE">
	<tr>
		<td bgcolor="#3aa0cc" align="center">&nbsp;NAME</td>
		<td bgcolor="#3aa0cc" align="center">&nbsp;VALUE</td>
	</tr>

	<%
		ResultSet rset = null;
		Connection conn = null;
		HashMap<String,String> hs = new HashMap<String, String>();
		try {
			ResourceBundle rb = ResourceBundle
					.getBundle("com.corenttech.config");
			String dburl = rb.getString("jdbcurl");
			String username = rb.getString("dbusername");
			String pwd = rb.getString("dbpassword");
			Class.forName(rb.getString("driver"));
			conn = DriverManager.getConnection(dburl, username, pwd);
			Statement st = conn.createStatement();
			rset = st.executeQuery("select * from appinfo");
			while (rset.next()) {
				System.out.println("gggggggggggggggggggggg:"+rset.getString("keyname"));		
				hs.put(rset.getString("keyname"),rset.getString("keyvalue"));
				System.out.println("cockpiturl====>:"+rset.getString("keyvalue"));
			
	%>
	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=rset.getString("keyname")%></td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=rset.getString("keyvalue")%></td>
	</tr>
	<%	
		}
	%>
	
 <%
//calling session url
String sessionID = null;
		String sessionUrl = hs.get("cockpiturl")+"v1/identity/sessions";
		String sessionXml = "<request><apiKey>"+hs.get("apikey").toString()+"</apiKey></request>";
		String sessionResponse = sessionRequest(sessionUrl, sessionXml);	
		System.out.println("sessionResponse==>:"+sessionResponse);
		sessionID = parseXml(sessionResponse);
		System.out.println("sessionID==>:"+sessionID);  %>
		
	<%!	public String sessionRequest(String Url,String Xml) {	    
			HttpClient httpClient = new DefaultHttpClient();
			System.out.println("sessionRequest url=========="+Url);
			System.out.println("sessionRequest xml=========="+Xml);
			String response = null;
			try {
				HttpPost httpPost = new HttpPost(Url);	
				StringEntity postEntity;		
				postEntity = new StringEntity(Xml, "text/xml", "UTF-8");			
				httpPost.setEntity(postEntity);			
				HttpEntity entity=httpClient.execute(httpPost).getEntity();
				response=EntityUtils.toString(entity);	
				System.out.println("sessionRequest url response====>:"+response);
				} catch (Exception e) {
				e.printStackTrace();
				}		
				return response;
			}
		
		public  String parseXml(String xml)  {
			System.out.println("inside parsing==");
			String sessID = null;
			try{
			DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		    InputSource is = new InputSource();
		    is.setCharacterStream(new StringReader(xml));
		    Document doc = db.parse(is);
		    NodeList nodeLst = doc.getElementsByTagName("response");  
		    
		    
	        for (int s = 0; s < nodeLst.getLength(); s++) {  
	            Node fstNode = nodeLst.item(s);  
	            if (fstNode.getNodeType() == Node.ELEMENT_NODE) {  
	                Element fstElmnt = (Element) fstNode;  
	                 NodeList fstNmElmntLst = fstElmnt.getElementsByTagName("sessionID");  
	                 Element fstNmElmnt = (Element) fstNmElmntLst.item(0);  
	                 sessID=getCharacterDataFromElement(fstNmElmnt);	    
	                System.out.println("res=========>:"+sessID);
	            }  
		    
			}		
			}catch(Exception e) {
				e.printStackTrace();	
				}
			return sessID;
		  }
		
		 public static String getCharacterDataFromElement(Element e) {
			    Node child = e.getFirstChild();
			    if (child instanceof CharacterData) {
			      CharacterData cd = (CharacterData) child;
			      return cd.getData();
			    }
			    return "";
			  }
 %>
</table>
</table>
</div>


<table height="20"></table>
<table width="744" height="30" border="1" cellpadding="1"
	cellspacing="0" bordercolor="#e1f3fb" bgcolor="#EEEEEE">
	<tr>
		<td bgcolor="#3aa0cc" align="left">&nbsp;INSTANCE DETAILS</td>
	</tr>
</table>

<div id="refreshone">
<table width="744" height="25" border="1" cellpadding="1"
	cellspacing="0" bordercolor="#e1f3fb" bgcolor="#EEEEEE">
	<tr>
		<td bgcolor="#3aa0cc" align="center">&nbsp;NAME</td>
		<td bgcolor="#3aa0cc" align="center">&nbsp;VALUE</td>
	</tr>

	<%
		ResultSet rset1 = null;
			Connection conn1 = null;
			String totalMemSpace = "";
			String freeMemSpace = "";
			String usableMemSpace = "";
			String drivestring = "";
			long freePhysicalMemory = 0;
			long usedPhysicalMemory = 0;
			int totaldiskspace = 0;
			int useddiskspace = 0;
			int freediskspace = 0;

			File[] drives = File.listRoots();
			for (int i = 0; i < drives.length; ++i) {
				File drive = new File(drives[i].toString());
				long totalDriSpace = drive.getTotalSpace();
				totalDriSpace = totalDriSpace / (1024 * 1024 * 1024);
				totalMemSpace = totalMemSpace + drive + ":" + totalDriSpace
						+ " GB  ";
				totaldiskspace = totaldiskspace
						+ (Integer.parseInt(String.valueOf(totalDriSpace)));

				long freeSpace = drive.getFreeSpace();
				freeSpace = freeSpace / (1024 * 1024 * 1024);
				 System.out.println("freeSpaceHD "+freeSpace);
				freeMemSpace = freeMemSpace + drive + ":" + freeSpace
						+ " GB  ";
				freediskspace = freediskspace
						+ (Integer.parseInt(String.valueOf(freeSpace)));

				int usablespace = (Integer.parseInt(String
						.valueOf(totalDriSpace)) - Integer.parseInt(String
						.valueOf(freeSpace)));
				usableMemSpace = usableMemSpace + drive + ":" + usablespace
						+ " GB  ";
				useddiskspace = useddiskspace
						+ (Integer.parseInt(String.valueOf(usablespace)));

				drivestring = drivestring + "<drive><total>"
						+ totalDriSpace + " GB</total><name>" + drive
						+ "</name> <avail>" + freeSpace
						+ " GB</avail> <type>local</type> <used>"
						+ usablespace + " GB</used> </drive>";
			}
			if ((totalMemSpace == null) && (totalMemSpace == " "))
				totalMemSpace = "NA";
			 System.out.println("getTotalHDDSpace : " + totalMemSpace);

			if ((freeMemSpace == null) && (freeMemSpace == " "))
				freeMemSpace = "NA";
			 System.out.println("getFreeHDDSpace : " + freeMemSpace);

			if ((usableMemSpace == null) && (usableMemSpace == " "))
				usableMemSpace = "NA";
			 System.out.println("getFreeHDDSpace : " + freeMemSpace);

			String capacityStr = "";
			long ramSize = 0L;
			String ramSizeStr = "";
			Process process = Runtime.getRuntime()
					.exec(new String[] { "wmic", "memorychip", "get",
							"capacity" });

			process.getOutputStream().close();
			Scanner sc = new Scanner(process.getInputStream());
			while (sc.hasNext()) {
				String capacity = sc.next().toString().trim();
				if (!(capacity.equalsIgnoreCase("Capacity")))
					capacityStr = capacityStr + capacity + ",";
			}

			String[] capacityStrArr = capacityStr.split(",");
			for (int i = 0; i < capacityStrArr.length; ++i)
				ramSize += Long.parseLong(capacityStrArr[i]);
			ramSize = ramSize / (1024 * 1024);
			ramSizeStr = Long.toString(ramSize);
			if ((ramSizeStr == null) && (ramSizeStr == " "))
				;
			System.out.println("getRAM : " + ramSizeStr);

			String ip = "";
			URL url = new URL("http://gt-tests.appspot.com/ip");
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));			
			ip = in.readLine().toString();			
			hs.put("instanceid", ip);
           
			String hostname = "";
			InetAddress addr = InetAddress.getLocalHost();
			hostname = addr.getHostName();
			System.out.println("hostname====>:"+hostname);
			/* if ((hostname == null) && (hostname == " "))				
			 System.out.println("hostname : " + hostname); */

			OperatingSystemMXBean operatingSystemMXBean = ManagementFactory.getOperatingSystemMXBean();
			for (Method method : operatingSystemMXBean.getClass().getDeclaredMethods()) {
				method.setAccessible(true);
				if (method.getName().startsWith("get")
						&& Modifier.isPublic(method.getModifiers())) {
					Object value = null;
					try {
						value = method.invoke(operatingSystemMXBean);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}

					if (method.getName()
							.equals("getFreePhysicalMemorySize")) {
						freePhysicalMemory = (Long) value / (1024 * 1024);
						System.out.println("freePhysicalMemory----"
								+ freePhysicalMemory);
						usedPhysicalMemory = ramSize - freePhysicalMemory;
					}
				}
			}

			Sigar sessionobj = new Sigar();
			double usedcpu = 0.0;
			try {

				CpuPerc cpuPerc = sessionobj.getCpuPerc();
				System.out.println("Cpu percentage usage combined: "
						+ cpuPerc.getCombined() * 100);
				usedcpu = cpuPerc.getCombined() * 100;
				System.out.println("Cpu percentage usage system: "
						+ cpuPerc.getSys() * 100);
				System.out.println("Cpu percentage usage user: "
						+ cpuPerc.getUser() * 100);
				System.out.println("Free CPU percentage : "
						+ cpuPerc.getIdle() * 100);

			} catch (SigarException e) {		
				e.printStackTrace();
			}
	%>
	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;CPU Usage</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=usedcpu%></td>
	</tr>


	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;IP</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=ip%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;HOST NAME</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=hostname%></td>
	</tr>


	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Total RAM</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=ramSizeStr%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Used RAM</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=usedPhysicalMemory%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Free RAM</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=freePhysicalMemory%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Operating System</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=System.getProperty("os.name")%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;OS Version</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=System.getProperty("os.version")%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;OS Architecture</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=System.getProperty("os.arch")%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Total Drive</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=drives.length%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Total DiskSpace</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=totalMemSpace%></td>
	</tr>


	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Free DiskSpace</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=freeMemSpace%></td>
	</tr>

	<tr>
		<td bgcolor="#FFFFFF" align="left">&nbsp;Used DiskSpace</td>
		<td bgcolor="#FFFFFF" align="left">&nbsp;<%=usableMemSpace%></td>
	</tr>

	<%
		Cookie cookie = null;
			Cookie[] cookies = null;
			// Get an array of Cookies associated with this domain
			cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookie = cookies[i];
					if (cookie.getName().equals("tn")) {
						String tenantname = cookie.getValue();					
						Statement tenantst = conn.createStatement();
						ResultSet tenantrset = tenantst
								.executeQuery("select accid from accountinfo where tenantname='"+ tenantname + "'");
						if (tenantrset.next()) {
							hs.put("accountid",
									tenantrset.getString("accid"));
							System.out.println("accountid==>:"+tenantrset.getString("accid"));
						}
						break;
					}
				}
			} 
			
			if (hs != null && hs.get("accountid") != null) {
				String cpuurl = hs.get("cockpiturl")
						+ "v2/storage/datastream?account="
						+ hs.get("accountid")+"&stream=cpu";
				System.out.println("cpuurl url=====>:"+cpuurl);
				String cpuxml = "<stream><applicationid>" + hs.get("applicationid")
						+ "</applicationid><instanceid>" + hs.get("instanceid")
						+ "</instanceid> <record> <cpu>" + usedcpu
						+ "</cpu> </record> </stream>";

				String ramurl = hs.get("cockpiturl")
						+ "v2/storage/datastream?account="
						+ hs.get("accountid")+"&stream=ram";
				System.out.println("ram url=====>:"+ramurl);
				String apikey = hs.get("apikey").toString();
				System.out.println("apikey====>:"+apikey);
				System.out.println("applicationid====>:"+ hs.get("applicationid"));
				String ramxml = "<stream><applicationid>" + hs.get("applicationid")
						+ "</applicationid><instanceid>" + hs.get("instanceid")
						+ "</instanceid> <record> <ram>" + ramSizeStr
						+ "</ram> </record> </stream>";

				String usedramurl = hs.get("cockpiturl")
						+ "v2/storage/datastream?account="
						+ hs.get("accountid")+"&stream=usedram";
				System.out.println("usedramurl url=====>:"+usedramurl);
				String usedramxml = "<stream><applicationid>"
						+ hs.get("applicationid") + "</applicationid><instanceid>"
						+ hs.get("instanceid")
						+ "</instanceid> <record> <usedram>" + usedPhysicalMemory
						+ "</usedram><ram>"+ramSizeStr+"</ram></record></stream>";
				System.out.println("usedramurl xml=====>:"+usedramxml);
				String infraurl = hs.get("cockpiturl")
						+ "v2/storage/datastream?account="
						+ hs.get("accountid")+"&stream=infrastructure";
				System.out.println("infraurl url=====>:"+infraurl);
				String infraxml = "<stream><applicationid>"
						+ hs.get("applicationid")
						+ "</applicationid><instanceid>"
						+ hs.get("instanceid")
						+ "</instanceid><record><xml><![CDATA[<hostaddress>"
						+ hs.get("instanceid")
						+ "</hostaddress><hostname>"
						+ hostname
						+ "</hostname><osarch>"
						+ System.getProperty("os.arch")
						+ "</osarch><osdescription>Microsoft Windows 2008</osdescription> <osname>"
						+ System.getProperty("os.name")
						+ "</osname> <osvendor>Microsoft</osvendor> <osvendorversion>2008</osvendorversion> <osversion>"
						+ System.getProperty("os.version")
						+ "</osversion> <drives>"
						+ drivestring
						+ "</drives><freememory>"
						+ freePhysicalMemory
						+ "</freememory> <totalcpuusage>9.1%</totalcpuusage> <totalmemory>"
						+ ramSizeStr + "</totalmemory> <freediskspace>"
						+ freediskspace + "</freediskspace> <totaldrive>"
						+ drives.length + "</totaldrive> <totaldiskspace>"
						+ totaldiskspace
						+ "</totaldiskspace><useddiskspace>"
						+ useddiskspace + "</useddiskspace><usedmemory>"
						+ usedPhysicalMemory
						+ "</usedmemory>]]></xml></record></stream>";

				String featureurl = hs.get("cockpiturl")
						+ "v2/storage/datastream?account="
						+ hs.get("accountid")+"&stream=webrequest";
				System.out.println("featureurl url=====>:"+featureurl);
				String featurexml = "<stream><applicationid>"
						+ hs.get("applicationid")
						+ "</applicationid><instanceid>"
						+ hs.get("instanceid")
						+ "</instanceid><record><url><![CDATA[index.jsp]]></url><method>POST</method><count>1</count></record>";
						
	%>
	
	<input type="hidden" name="cpuurl" value="<%=cpuurl%>" />
	<input type="hidden" name="cpuxml" value="<%=cpuxml%>" />	
	<input type="hidden" name="ramurl" id="ramurl" value="<%=ramurl%>" />	
	<input type="hidden" name="apikey"  id="apikey" value="<%=apikey%>" />
	<input type="hidden" name="ramxml" id="ramxml" value="<%=ramxml%>" />
	<input type="hidden" name="usedramurl" id="usedramurl" value="<%=usedramurl%>" />
	<input type="hidden" name="usedramxml" id="usedramxml" value="<%=usedramxml%>" />
	<input type="hidden" name="infraurl" id="infraurl" value="<%=infraurl%>" />
	<input type="hidden" name="infraxml"  id="infraxml" value="<%=infraxml%>" />
	<input type="hidden" name="sessionid"  id="sessionid" value="<%=sessionID%>" />
	<input type="hidden" name="userid" id="userid" value="<%=request.getParameter("userid")%>" />

	<%
	
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</table>

</div>

</div>
</section> <!-- Include Scripts -->
<div class="footer" align="center">&copy; Copyright 2013 Corent
Technology Inc. All rights reserved</div>
</form>
</body>
</html>
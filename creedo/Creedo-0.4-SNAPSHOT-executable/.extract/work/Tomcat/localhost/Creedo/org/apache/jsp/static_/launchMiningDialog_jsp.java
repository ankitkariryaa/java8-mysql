/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2016-07-14 12:43:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.static_;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class launchMiningDialog_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<div class=\"modal fade\" id=\"refControlBox\" tabindex=\"-1\" role=\"dialog\"\n");
      out.write("\taria-labelledby=\"refBoxLabel\" aria-hidden=\"true\">\n");
      out.write("\t<div class=\"modal-dialog\">\n");
      out.write("\t\t<div class=\"modal-content\">\n");
      out.write("\t\t\t<div class=\"modal-header\">\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\n");
      out.write("\t\t\t\t\taria-hidden=\"true\">&times;</button>\n");
      out.write("\t\t\t\t<h4 class=\"modal-title\" id=\"refBoxLabel\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${launchDialogTitle}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</h4>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"modal-body\" id=\"refBoxContent\">\n");
      out.write("\t\t\t\t");
      out.write("\n");
      out.write("\t\t\t\t<div class=\"row ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${algorithmCategoryHiddenClass}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"\n");
      out.write("\t\t\t\t\tid=\"refCategoryArea\">\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-4 text-right\">\n");
      out.write("\t\t\t\t\t\t<h4>\n");
      out.write("\t\t\t\t\t\t\t<label for=\"algorithmCategoriesSelect\">Category:</label>\n");
      out.write("\t\t\t\t\t\t</h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-8\">\n");
      out.write("\t\t\t\t\t\t<select id=\"algorithmCategoriesSelect\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t<option value=\"\">Select algorithm category</option>\n");
      out.write("\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t");
      out.write("\n");
      out.write("\t\t\t\t<div class=\"row paramMargin ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${algorithmSelectHiddenClass}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\" id=\"refAlgorithmsArea\"\n");
      out.write("\t\t\t\t\tstyle=\"display: none;\">\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-4 text-right\">\n");
      out.write("\t\t\t\t\t\t<h4>\n");
      out.write("\t\t\t\t\t\t\t<label for=\"algorithmSelect\">Algorithm:</label>\n");
      out.write("\t\t\t\t\t\t</h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-8\">\n");
      out.write("\t\t\t\t\t\t<select id=\"algorithmSelect\" class=\"form-control\">\n");
      out.write("\t\t\t\t\t\t\t<option value=\"\">Select algorithm</option>\n");
      out.write("\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t");
      out.write("\n");
      out.write("\t\t\t\t<div id=\"refParametersArea\" style=\"display: none;\">\n");
      out.write("\t\t\t\t\t<div class=\"row\" id=\"refParameterRow\">\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xs-4 text-right\">\n");
      out.write("\t\t\t\t\t\t\t<label for=\"input_xyz\">ParamName:</label>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"col-xs-8\">\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"input_xyz\">\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"modal-footer\">\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-info\" id=\"refExecuteButton\">Execute!</button>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

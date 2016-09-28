<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="serror" uri="/WEB-INF/ErrorDescripter.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ page import="net.tanesha.recaptcha.ReCaptcha"%> --%>
<%-- <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%> --%>
<%@ page import="java.util.ResourceBundle"%>
<html lang="en">

<jsp:include page="fragments/headTag.jsp" />

<body>

	<div id="wrapper">
		<jsp:include page="fragments/bodyHeader.jsp" />
		<div class="content">
			<div class="container-fluid">
				<h2 class="page-header evm-font-blue">Contact</h2>

				<serror:Error id="msgBox" errorList="${formError}"
					cssInfClass="${className}">
				</serror:Error>
				<div class="col-md-6">
					<form method="post" action="validate">
						<p>
							<span>Please provide your details below for further
								information.</span>
						</p>
						<div class="well well-sm">
							<strong>*</strong> represents required field
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" required="required" placeholder="NAME*"
									id="InputName" name="name" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="email" required="required" placeholder="EMAIL*"
									name="mail" id="InputEmail" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<textarea required="required" rows="5" class="form-control"
									id="InputMessage" name="msg" placeholder="MESSAGE"></textarea>
							</div>
						</div>


						<%
// 							ResourceBundle bundle = ResourceBundle.getBundle("spring/app");
// 							ReCaptcha c = ReCaptchaFactory.newReCaptcha(
// 									bundle.getString("captcha.public.key"),
// 									bundle.getString("captcha.private.key"), false);
// 							out.print(c.createRecaptchaHtml(null, null));
						%>

						<input type="submit" name="submit" class="btn btn-primary btn-sm"
							value="SEND" />
					</form>
				</div>
				<div class=" col-md-4 pull-right">
					<article class="text-right">
						<h5>New Delhi, India Country Office</h5>
						<address>
							UNICEF<br>73 Lodi Estate, New Delhi 110 003, India<br>Phone:
							91 11 2469-0401, 2469-1410<br>Fax: 011 2462-7521, 2469-1410
						</address>
					</article>
					<section class="text-right mar-top-15">
							<p>
								<span>Mail to:<a
									href="mailto:newdelhi@unicef.org?Subject=Hello" target="_top">
										<span class="evm-font-blue">newdelhi@unicef.org</span>
								</a>
								</span>
							</p>
					</section>
					<i
						class="fa fa-envelope fa-6x evm-envelope evm-font-blue pull-right"></i>
				</div>

			</div>
		</div>
		<div class="clearfooter"></div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>

</html>

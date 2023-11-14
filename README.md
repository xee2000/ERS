# 응급안전안심서비스 - 생활지원사 파트

## 프로젝트 소개

본 프로젝트는 응급안전안심서비스를 주제로 진행되었으며, 담당한 파트는 생활지원사입니다. 주요 업무는 보고서 처리와 배정받은 고객에 대한 캘린더 기능을 담당하고 있습니다.

## 주요 라이브러리 및 사용 기술

- **텍스트 에디터:** Summernote
- **파일 업로드 기능 처리:** MultipartFile

## 보고서 처리 로직

아래는 보고서 작성 시 사용된 로직입니다.

```java
@PostMapping(value = "/ers/lsupporter/reportregist", produces = "text/plain;charset=utf-8")
public String reportregist(@DateTimeFormat(pattern = "yyyy-MM-dd") MemberReportLsupporterVO reportlsupporter, HttpSession session, HttpServletRequest request) throws Exception {
    String url = "redirect:/ers/lsupporter/memberdetail?id="+reportlsupporter.getId();
    session = request.getSession();
    LsupporterVO loginUser = (LsupporterVO) session.getAttribute("loginUser");
    List<MultipartFile> multiFiles = reportlsupporter.getUploadFile();
    String savePath = this.lsupporterfileUploadPath;

    List<ReportFileVO> reportfileList = saveFileToAttaches(multiFiles, savePath);
    reportlsupporter.setReportFileList(reportfileList);
    lsupporterService.reportregist(reportlsupporter, loginUser.getWid());
    return url;
}

private List<ReportFileVO> saveFileToAttaches(List<MultipartFile> multiFiles, String savePath) throws Exception {
    List<ReportFileVO> reportfileList = new ArrayList<ReportFileVO>();

    if (multiFiles != null) {
        for (MultipartFile multi : multiFiles) {
            String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
            File target = new File(savePath, fileName);
            target.mkdirs();
            multi.transferTo(target);

            ReportFileVO reportfile = new ReportFileVO();
            reportfile.setUploadpath(savePath);
            reportfile.setFilename(fileName);
            reportfile.setFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
            reportfileList.add(reportfile);
        }
    }
    return reportfileList;
}



#파일경로을 위한 application.yml입니다.

lsupporterpicturePath: c:/lsupporterpicture
summernotepath: c:/summernote/upload
lsupporterfileUploadPath: c:/report/fileupload/upload
noticefileuploadpath: c:/notice/fileupload


#아이디찾기시의 메일을 사용하여 찾을수있도록 MailContentSend 클래스를 이용하였습니다.

public class MailContentSend {
	private String SMPT_HOSTNAME;
	private String USERNAME;
	private String PASSWORD;

	public void setMail(String host, String user, String password) {
		this.SMPT_HOSTNAME = host;
		this.USERNAME = user;
		this.PASSWORD = password;
	}

	public void sendMail(String fromMailAddr, String toMailAddr, String title, String content) throws Exception {
		Properties props = new Properties();
		props.put("mail.smtp.host", SMPT_HOSTNAME);
		props.put("mail.from", fromMailAddr);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USERNAME, PASSWORD);
			}
		});
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom();
			msg.setRecipients(Message.RecipientType.TO, toMailAddr);
			msg.setSubject(title);
			msg.setSentDate(new Date());

			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String htmlText = "";
			htmlText += content;

			messageBodyPart.setContent(htmlText, "text/html;charset=UTF-8");
			multipart.addBodyPart(messageBodyPart);

			msg.setContent(multipart);
			Transport.send(msg);
		} catch (MessagingException mex) {
			System.out.println("send failed, exception: " + mex);
		}

	}
}



#아이디 찾기시의 controller입니다

@PostMapping("/ers/lsupporter/idcheck")
public String Showidcheck(String name, String email, HttpServletRequest request, HttpServletResponse response) {
	String url = null;

	int result = lsupporterService.selectcountemail(name, email);
	System.out.println("name :" + name);
	if (result == 1) {

		LsupporterVO lsupporterwid = lsupporterService.getLsupportByemail(email);
		String mailSet_Server = "smtp.naver.com"; // 보내는 메일 server
		String mailSet_ID = "xee2000"; // 보내는 메일 ID
		String mailSet_PW = "dlwjdgh0**^"; // 보내는 메일 비밀번호

		String mailFromName = "EmergencyService."; // 보내는 사람 이름
		String mailFromAddress = "<xee2000@naver.com>"; // 보내는 메일 주소

		String mailTo = (request).getParameter("email"); // 받는 메일 주소
		String mailTitle = "응급안전안심서비스 아이디 찾기 관련 메일 보내드립니다."; // 메일 제목
		String content = "고객님의 ID는 " + lsupporterwid.getWid() + "입니다"; // 메일내용

		String mailFrom = "";
		try {
			mailFrom = new String(mailFromName.getBytes("utf-8"), "8859_1") + mailFromAddress;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MailContentSend ms = new MailContentSend();
		ms.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
		try {
			ms.sendMail(mailFrom, mailTo, mailTitle, content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("text/plain;charset=utf-8");
		url = "/ers/lsupporter/loginForm";
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(url);
		out.close();

	} else {
		String error = "없는 정보입니다 다시 입력해주세요.";
		url = "findLsupporterWidForm&error=" + error;
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(url);
		out.close();
	}

	return url;
}

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

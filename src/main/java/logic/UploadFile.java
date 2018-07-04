package logic;

import java.io.Serializable;

public class UploadFile implements Serializable {
    private int file_no;
    private int ref_no;
    private String originalname;
    private String filename;
    private long filesize;
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getRef_no() {
		return ref_no;
	}
	public void setRef_no(int ref_no) {
		this.ref_no = ref_no;
	}
	public String getOriginalname() {
		return originalname;
	}
	public void setOriginalname(String originalname) {
		this.originalname = originalname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "UploadFile [file_no=" + file_no + ", ref_no=" + ref_no + ", originalname=" + originalname
				+ ", filename=" + filename + ", filesize=" + filesize + "]";
	}
    
}

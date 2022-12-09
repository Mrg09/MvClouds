import { LightningElement,api } from 'lwc';

export default class Fileuploadpagination extends LightningElement {
  @api recordId;
  newFileWasUploaded = false;
  uploadedFilesUrl = [];

  get acceptedFormats() {
      return ['.jpg','.png','.pdf','.txt','.doc','.docx','.mp4','.csv','.xml'];
  }
  value = file.id;
  handleUploadFinished(event) {
      const uploadedFiles = event.detail.files;
      if(uploadedFiles && uploadedFiles.length > 0){
          this.newFileWasUploaded = true;
          uploadedFiles.forEach(element => {
              this.uploadedFilesUrl.push({
                  id : '/sfc/servlet.shepherd/version/download/' + element.contentVersionId
              })
          });
      }
  }
}
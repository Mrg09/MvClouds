public class Randomfileclass {




    //this is comment
    
    public Randomfileclass(){
    }
    
    public static Pagereference redirect(String oid){
        String rid = oid;
        System.debug('Redirect:-'+rid+' oid:-'+oid);
        PageReference pageRef = new PageReference('https://mitrajsinhgohil-dev-ed.develop.lightning.force.com/'+rid);
        pageRef.setRedirect(true);

        return pageRef;
    }
    
    public static jsonwrapper parse(String json){
		return (jsonwrapper) System.JSON.deserialize(json, jsonwrapper.class);
	}
    @future(callout=true) 
    public Static void getRandomImage(){
        Opportunity opp = new Opportunity();
        String oid = ApexPages.currentPage().getParameters().get('id');
        //String oid = '0065g00000TOU43';
        System.debug(oid);
        opp = [SELECT id, Name from Opportunity WHERE id = :oid];
        System.debug(opp);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.unsplash.com/photos/random/?client_id=enYatuM5xt9cmPeJjMp2dKcYmPoACGI2dwnLeVhu2aw');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'image/png');
        HTTPresponse res= http.send(request);
        String response = res.getBody();
        
		jsonwrapper jswr = jsonwrapper.parse(response);
        
		String imageapi = jsWr.urls.full;
        System.debug(imageapi);
        
        request.setEndpoint(imageapi);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'image/png');
        HTTPresponse res2= http.send(request);
        blob response2 = res2.getBodyAsBlob();

        
        System.debug(blob.valueOf(imageapi));
        
        System.debug(response);
        blob resp = blob.valueOf(imageapi);
        String result = System.EncodingUtil.base64Encode(response2);
        System.debug('Result:-'+result);
        
        ContentVersion DocVer = new ContentVersion();
        docVer.ContentLocation = 'S';
        docVer.PathOnClient = '/'+oid+'_Image.png';
        docVer.Title = oid+'_Image';
        docVer.VersionData = EncodingUtil.base64Decode(result);
        insert DocVer;
        
        string Versid = [SELECT Contentdocumentid from ContentVersion where id = :DocVer.Id].ContentDocumentid;
        ContentDocumentLink DocLink = new ContentDocumentLink();
        doclink.ContentDocumentId = Versid;
        doclink.LinkedEntityId = oid;
        doclink.ShareType = 'I';
        doclink.Visibility = 'ALLUsers';
        insert doclink;
        redirect(oid);
    }
    
}
public class Start {
    public Pagereference Start(){
        PageReference p = new PageReference('https://mvclouds-2d-dev-ed--c.develop.vf.force.com/apex/SignUp?core.apexpages.request.devconsole=1');
        p.setRedirect(true);
        return p;
    }
}
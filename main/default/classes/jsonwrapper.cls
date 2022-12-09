public class jsonwrapper{
	
    public cls_urls urls;
	
	public class cls_urls {
		public String raw;	//https://images.unsplash.com/photo-1666552594550-bdf6f8017eff?ixid=MnwzODE2ODh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjkyMDE2NDI&ixlib=rb-4.0.3
		public String full;	//https://images.unsplash.com/photo-1666552594550-bdf6f8017eff?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzODE2ODh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjkyMDE2NDI&ixlib=rb-4.0.3&q=80
		public String regular;	//https://images.unsplash.com/photo-1666552594550-bdf6f8017eff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODE2ODh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjkyMDE2NDI&ixlib=rb-4.0.3&q=80&w=1080
		public String small;	//https://images.unsplash.com/photo-1666552594550-bdf6f8017eff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODE2ODh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjkyMDE2NDI&ixlib=rb-4.0.3&q=80&w=400
		public String thumb;	//https://images.unsplash.com/photo-1666552594550-bdf6f8017eff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODE2ODh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjkyMDE2NDI&ixlib=rb-4.0.3&q=80&w=200
		public String small_s3;	//https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1666552594550-bdf6f8017eff
	}
	
	public static jsonwrapper parse(String json){
		return (jsonwrapper) System.JSON.deserialize(json, jsonwrapper.class);
	}
}
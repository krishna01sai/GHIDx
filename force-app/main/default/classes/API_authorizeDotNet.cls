public class API_authorizeDotNet {
	public static string APILOGIN;
    public static string APITRANSKEY;
    
    public static void getNetAuth()
    {
    Authorize_Net_Setting__c apiloginSetting= Authorize_Net_Setting__c.getInstance('Api Login');
        Authorize_Net_Setting__c apiTransKeySetting= Authorize_Net_Setting__c.getInstance('Key');
        System.debug(apiloginSetting);
        System.debug(apiTransKeySetting);
        APILOGIN = apiloginSetting.Value__c;
        APITRANSKEY= apiTransKeySetting.Value__c;
        //sai1
    }
}
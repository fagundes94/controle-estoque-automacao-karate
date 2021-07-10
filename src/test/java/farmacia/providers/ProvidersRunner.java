package farmacia.providers;


import com.intuit.karate.junit5.Karate;

public class ProvidersRunner {

    @Karate.Test
    Karate testProviders() {
        return new Karate().feature("provider").relativeTo(getClass());
    }


}
